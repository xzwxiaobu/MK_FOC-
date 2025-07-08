#include "FOC_Control.h"
#include "definitions.h"                // SYS function prototypes

CLARKE      								 CLARKE_ICurr = CLARKE_DEFAULTS;
CLARKE									     CLARKE_UCurr = CLARKE_DEFAULTS;
PARK        								 PARK_PCurr   = PARK_DEFAULTS;
IPARK       								 IPARK_PVdq   = IPARK_DEFAULTS;
ICLARKE	                                     ICLARKE_PVuvw=ICLARKE_DEFAULTS;


motor_p											 Motor = MOTOR_DEFAULTS;
GXieLv    								         IF_Freq_GXieLv = GXieLv_DEFAULTS;
GXieLv											 Speed_Ref_GXieLv = GXieLv_DEFAULTS;
GXieLv											 Idq_Ref_GXieLv = GXieLv_DEFAULTS;
Sensorless_Control				 	             Sensorless = Sensorless_DEFAULTS;
IPARK				 						     IPARK_SMO_PVdq = IPARK_DEFAULTS;

u8 		Fault_Code = 0;			//故障代码(0——正常；1——电压过低；2——电压过高；3——旋转异常，堵转；5——失速报警；6——过温报警)
u8 		Cal_Period = 0;			//闭环计算频率计数
vu16 	Up_Time = 0;
vu16 	Down_Time = 0;
u16 	IF_Frq;
u16 	IF_Angle;
u16 	Stall_time;
bool 	Observe_Switch_flag = 0;

u8 		Cal_time;
vu8 	Speed_Cal_time = 0;

float iq_ref = 0.0f ;
float id_ref = 0.0f;
volatile float 	IF_Theta;
float IF_Current = IF_Current_Max;
float Angler_err;
float Ext_Angle;
float vofa_data[10];

void Grad_XieLv(p_GXieLv pv)    // 斜率梯度计算 ，按照一定梯度值加加减减
{
    if(pv->XieLv_X < (pv->XieLv_Y - pv->XieLv_Grad)) // XieLv_Grad 减梯度值时候
    {
        pv->XieLv_Y = pv->XieLv_Y - pv->XieLv_Grad;
    }
    else if(pv->XieLv_X > (pv->XieLv_Y + pv->XieLv_Grad)) // 加梯度值时候
    {
        pv->XieLv_Y = pv->XieLv_Y + pv->XieLv_Grad;
    }
    else
    {
        pv->XieLv_Y = pv->XieLv_X;
    }
}




void Postion_To_Zero_Double(void)
{

     MCPWM_Start();
     delay_1ms(500);
//
    SVPWM_dq.Ualpha = 0.0f;								//调零电压 先90度
    SVPWM_dq.Ubeta = 0.3f;
    SVPWM_Cale((M_SVPWM)&SVPWM_dq);   	  	           // 将Alpha和Beta电压带入计算SVPWM的占空比
    delay_1ms(500);
//
    SVPWM_dq.Ualpha =  0.3f;								//调零电压
    SVPWM_dq.Ubeta  =  0.0f;
    SVPWM_Cale((M_SVPWM)&SVPWM_dq);   		             // 将Alpha和Beta电压带入计算SVPWM的占空比
    delay_1ms(500);
	
    QEI1_Initialize () ;							   //清除编码器当前计数值
    Motor.E_theta = 0;
    delay_1ms(400);

     MCPWM_Stop() ;

//    LED1 = !LED1;
//    LED2 = !LED2;
}

//故障检测
static volatile int Vwrcnt  ;  
void Fault_Detection(void)
{
    static u16 i;

    if(Init_Over)								//初始化结束后进行电机状态异常检测 Init_Over
    {
        if(ADC_Sample_F_Para.VBUS > Protect_High_Voltage_V)
        {
            Fault_Code = 2;						//电压过高；
         
                M_STOP();						    //停机
                Motor.M_State = M_ERR;		//电机状态报错
//            LED_RGB_Color(255,0,255);	//紫色灯报警
         

        }
      
       
      if(ADC_Sample_F_Para.VBUS < Protect_Low_Voltage_V)
        {  
          
             Vwrcnt ++;
            if(Vwrcnt>30)
            {
            Fault_Code = 1;						//电压过低
            M_STOP();									//停机
            Motor.M_State = M_ERR;		//电机状态报错
//            LED_RGB_Color(0,255,255);	//青色灯报警
            }
   
        }
        else
        {
         Vwrcnt =0;
        
        }

        
        //防堵转检测
        if(my_abs(PARK_PCurr.Qs) >= pi_spd.Umax)
            Stall_time ++;
        if(Stall_time == 500)			//堵转500ms
        {
            M_STOP();					//停机
            Fault_Code = 3;
            Stall_time = 0;
            Motor.M_State = M_ERR;		//电机状态报错

//            LED_RGB_Color(255,0,0);		//红灯报警
//            LED1 = 1;
//            LED2 = 1;
//            LED3 = 1;
//            LED4 = 1;
        }
        else if(Stall_time > 0)
        {
            if(my_abs(PARK_PCurr.Qs) < pi_iq.Umax)
                Stall_time = 0;
        }
    }

    //转速偏差过大检测
    if(Motor.M_State == RUN)
    {
        if(my_abs(pi_spd.Fbk) > 200*Motor.P)					//反馈速度大于200RPM后，开启速度偏差检测
        {
            if(pi_spd.err < 0)		//速度高于一倍的目标速度开启保护
            {
                if(my_abs(pi_spd.err) > my_abs(pi_spd.Ref))
                {
                    M_STOP();										//停机
                    Fault_Code = 5;							//失速报警
//                    LED_RGB_Color(255,165,0);		//黄色灯报警
                    Motor.M_State = M_ERR;			//电机状态报错
                }
            }
            if((Sign(pi_spd.Ref) + Sign(pi_spd.Fbk)) == 0)		//与目标速度反方向转报警
            {
                M_STOP();											//停机
                Fault_Code = 5;								      //失速报警
//                LED_RGB_Color(255,165,0);			             //黄色灯报警
                Motor.M_State = M_ERR;				             //电机状态报错
            }
        }
    }

    //高温报警
    if(NTC_Temp >= 80)
    {
        M_STOP();										    //停机
        Fault_Code = 6;										//过温报警
//        LED_RGB_Color(255,10,5);					        //红橙色灯报警
        Motor.M_State = M_ERR;
    }

    if(Motor.M_State != M_ERR)
    {
        i ++;

        Fault_Code = 0;

//        if(i < 1000)
////            LED_RGB_Color(0,80,0);						//系统正常运行，绿色灯闪烁
//        else
////            LED_RGB_Color(0,0,0);

        i %= 2000;
    }
}


void M_STOP(void)
{

        MCPWM_Stop () ;
        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, 0);          //b15  1L ??? down       B14  1h  ??? up adc    mk ?act +- inv?
        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_2, 0);         // b13  2L                B12  2h
        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_3, 0); 	  
        Variable_Clear();			//变量清零
}


void M_RUN(void)
{
//      Fault_Detection();				                                         // 启动前先进行故障检测  
//      MCPWM_Initialize();
//      MCPWM_CallbackRegister(MCPWM_CH_1, PWM_PeriodHandler, (uintptr_t)NULL);   //  被 stop 了 ，居然要 重新 初始化 然后注册回调 
      MCPWM_Start();
}

//强制拖动
void QT_Motor(void)
{
    IF_Frq ++;
    if(IF_Frq == QT_Frq)					//强拖频率50微秒 *50=2500  2.5ms
    {
        IF_Frq = 0;
        IPARK_PVdq.Alpha = ualpha_tab[IF_Angle];
//        IPARK_PVdq.Alpha=2* IPARK_PVdq.Alpha;
        IPARK_PVdq.Beta = ubeta_tab[IF_Angle];
//          IPARK_PVdq.Beta=2*  IPARK_PVdq.Beta ;
        IF_Angle ++;
        if(IF_Angle > 359)
            IF_Angle = 0;
    }
}

//三相电流到dq轴电流变化
void UVW_Axis_dq(void)
{
    Speed_Cal_time ++;            // 20K 的频率  调度 

    CLARKE_ICurr.Iv = ADC_Sample_Para.PhaseV_Curr;			//采样的相电流代入CLARK变换
    CLARKE_ICurr.Iw = ADC_Sample_Para.PhaseW_Curr;
	CLARKE_ICurr.Iu=-CLARKE_ICurr.Iv-CLARKE_ICurr.Iw;
    CLARKE_Cale((M_CLARKE)&CLARKE_ICurr);					//CLARK变换函数，等峰值变换
   
//    if(Motor.Control_Mode== IF_Control)	
//    {
          PARK_PCurr.Theta =IF_Theta ;	
    
//    }
  
    
//           Get_Postion() ;
    
   
    
    PARK_PCurr.Alpha = CLARKE_ICurr.Alpha;								//CLARK变换后得到的Alpha_I代入到PARK变换
    PARK_PCurr.Beta = CLARKE_ICurr.Beta;
    PARK_Cale((M_PARK)&PARK_PCurr);							            //PARK变换函数
}

//电机速度开环，电流闭环启动
//IF启动速度=IF_Fre_Max/P*60 rpm/min 
void IF_Start_Control(void)
{
    float IF_Freq_EX = 0.0f;
  
    
    IF_Freq_GXieLv.XieLv_Grad = IF_F_Grad_0D1HZ ;   //定义频率的梯度值
    IF_Freq_GXieLv.Grad_Timer = IF_F_Grad_Timer;    //定义频率的梯度时间
    IF_Freq_GXieLv.XieLv_X = IF_Fre_Max;			//定义梯度上限
   
    IF_Freq_GXieLv.Timer_Count ++;                 //20K    1/20000*20
    if(IF_Freq_GXieLv.Timer_Count > IF_Freq_GXieLv.Grad_Timer)
    {
        IF_Freq_GXieLv.Timer_Count = 0;
        Grad_XieLv((p_GXieLv)&IF_Freq_GXieLv);				//梯度计算
    }

    IF_Freq_EX = Limit_Sat(IF_Freq_GXieLv.XieLv_Y, Motor_Freq_Max, Motor_Freq_Min );
    IF_Theta += (float)(PIX2 * IF_Freq_EX) / TIM1_Frq;  // 2pi/f= 2pi*(T)) 2PI/f   f= TIM1_Frq /IF_Freq_EX
//    volatile  float addcnt;
//     addcnt=   IF_Freq_EX *  PIX2 * TS;
//     IF_Theta = IF_Theta+ 0.1 ;
    
//    IF_Theta=IF_Theta+0.0001 ;
    while(IF_Theta > PIX2)
        { IF_Theta -= PIX2;}
   
    while(IF_Theta < 0)
       { IF_Theta += PIX2 ;}
    
		
//		IF_Theta -=(PIX2 * IF_Freq_EX) / TIM1_Frq;

		
		
    pi_id.Ref = 0.0f;														      //id=0，d轴电流闭环，力矩大
    pi_id.Fbk = PARK_PCurr.Ds;
    PI_Controller((M_PI_Control)&pi_id);									     //Id轴闭环
//	pi_id.OutF = pi_id.OutF*LPF_I_RUN_B + pi_id.Out*LPF_I_RUN_A;
		
	float maxVsMag_V = MaxVsMagPu * ADC_Sample_F_Para.VBUS;
    float outMax_V = maxVsMag_V * maxVsMag_V -  pi_id.Out *  pi_id.Out;
    outMax_V =sqrtf(outMax_V);        //已验证开方函数  
  //  outMax_V=2.0f;
    pi_iq.Umax = 	outMax_V;
    pi_iq.Umin =   -outMax_V;
    pi_iq.Ref =    IF_Current;																//Iq的设定和电机的额定转矩有关，IF启动一般Iq选择比额定转矩下的Iq略大
    pi_iq.Fbk=    PARK_PCurr.Qs;
    PI_Controller((M_PI_Control)&pi_iq);									//Iq轴闭环
//	pi_iq.OutF = pi_iq.OutF*LPF_I_RUN_B + pi_iq.Out*LPF_I_RUN_A;

    IPARK_PVdq.Theta = IF_Theta;
    IPARK_PVdq.Ds = pi_id.Out;
    IPARK_PVdq.Qs = pi_iq.Out;
    IPARK_Cale((M_IPARK)&IPARK_PVdq);											//IPARK函数计算

   		
//   ICLARKE_PVuvw.Alpha=IPARK_PVdq.Alpha;
//   ICLARKE_PVuvw.Beta=IPARK_PVdq.Beta;
 //  ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);								//Iclake函数计算

}

//基于SMO的无感控制
void Senserless_SMO_Control(void)
{
//    if(Speed_Cal_time == Speed_Cal_Period)
//    {
//        Speed_Cal_time	%= Speed_Cal_Period;
//
//        pi_spd.Ref = M_SPEED*Motor.P;
//        pi_spd.Fbk = PLL_SMO_Para.Omega/PIX2*60;
//        PI_Controller((M_PI_Control)&pi_spd);									//速度环
//        pi_spd.OutF=pi_spd.OutF*LPF_I_RUN_B+pi_spd.Out*LPF_I_RUN_A; //环路滤波后输出
//    }
//
//    pi_id.Ref = 0;																				//id=0，d轴电流闭环，力矩大
//    pi_id.Fbk = PARK_PCurr.Ds;
//    PI_Controller((M_PI_Control)&pi_id);									//Id轴闭环
//    pi_id.OutF=pi_id.OutF*LPF_I_RUN_B + pi_id.Out*LPF_I_RUN_A;
//		
//		float maxVsMag_V = MaxVsMagPu * ADC_Sample_F_Para.VBUS;
//    float outMax_V = maxVsMag_V * maxVsMag_V -  pi_id.Out *  pi_id.Out;
//    arm_sqrt_f32(outMax_V, &outMax_V);
//
//    pi_iq.Umax = 	outMax_V;
//    pi_iq.Umin = -outMax_V;
//    pi_iq.Ref = pi_spd.OutF;															//Iq的设定和电机的额定转矩有关，IF启动一般Iq选择比额定转矩下的Iq略大
//    pi_iq.Fbk	= PARK_PCurr.Qs;
//    PI_Controller((M_PI_Control)&pi_iq);									//Iq轴闭环
//    pi_iq.OutF = pi_iq.OutF*LPF_I_RUN_B + pi_iq.Out*LPF_I_RUN_A;
//
//    IPARK_PVdq.Theta = PLL_SMO_Para.Angle;
//    IPARK_PVdq.Ds = pi_id.OutF;
//    IPARK_PVdq.Qs = pi_iq.OutF;
//    IPARK_Cale((M_IPARK)&IPARK_PVdq);											//IPARK函数计算
//		
//		
////   ICLARKE_PVuvw.Alpha=IPARK_PVdq.Alpha;
////   ICLARKE_PVuvw.Beta=IPARK_PVdq.Beta;
////   ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);											//Iclake函数计算
////		
		
		
		
}

//有感,速度闭环,电流闭环
void Speed_Closeloop(void)
{
    float ISpeed_Ref_EX = 0.0f;

    Speed_Ref_GXieLv.XieLv_Grad = Speed_Ref_OD ;   		// 定义速度的梯度值
    Speed_Ref_GXieLv.Grad_Timer = Speed_Ref_Timer;      // 定义速度的梯度时间
    Speed_Ref_GXieLv.XieLv_X = M_SPEED;					// 定义梯度上限

    Speed_Ref_GXieLv.Timer_Count++;

    if(my_abs(pi_spd.Ref - pi_spd.Fbk) >= 700)
        Speed_Ref_GXieLv.Timer_Count --;

    if(Speed_Ref_GXieLv.Timer_Count > Speed_Ref_GXieLv.Grad_Timer)
    {
        Speed_Ref_GXieLv.Timer_Count = 0;
        Grad_XieLv((p_GXieLv)&Speed_Ref_GXieLv);				//梯度计算
    }
    ISpeed_Ref_EX = Limit_Sat(Speed_Ref_GXieLv.XieLv_Y, Speed_Ref_Max, -Speed_Ref_Max );

    if(Speed_Cal_time == PWMZD_Count)			// 1ms计算一次转速环  速度环调度的周期 
    {
        Speed_Cal_time	%= PWMZD_Count;
        pi_spd.Ref = ISpeed_Ref_EX*Motor.P;
        pi_spd.Fbk = Motor.speed_E_rpm;
        PI_Controller((M_PI_Control)&pi_spd);									//速度环
//	pi_spd.OutF=pi_spd.OutF*LPF_I_RUN_B + pi_spd.Out*LPF_I_RUN_A; //环路滤波后输出
    }


    pi_id.Ref = 0.0f;																		//id=0，d轴电流闭环，力矩大
    pi_id.Fbk = PARK_PCurr.Ds;
    PI_Controller((M_PI_Control)&pi_id);									               //Id轴闭环
//	pi_id.OutF=pi_id.OutF*LPF_I_RUN_B + pi_id.Out*LPF_I_RUN_A;
		
    float maxVsMag_V = MaxVsMagPu * ADC_Sample_F_Para.VBUS;
    float outMax_V = maxVsMag_V * maxVsMag_V -  pi_id.Out *  pi_id.Out;
//    arm_sqrt_f32(outMax_V, &outMax_V);
      outMax_V =sqrtf(outMax_V);

    pi_iq.Umax =  	outMax_V;
    pi_iq.Umin =    -outMax_V;
    pi_iq.Ref =  1.5;        //pi_spd.Out;
    pi_iq.Fbk	= PARK_PCurr.Qs;
    PI_Controller((M_PI_Control)&pi_iq);									//Iq轴闭环
//	pi_iq.OutF=pi_iq.OutF*LPF_I_RUN_B + pi_iq.Out*LPF_I_RUN_A;

    IPARK_PVdq.Theta = Motor.E_theta;
    IPARK_PVdq.Ds = pi_id.Out;
    IPARK_PVdq.Qs = pi_iq.Out;
    IPARK_Cale((M_IPARK)&IPARK_PVdq);											//IPARK函数计算
		
		
//	 ICLARKE_PVuvw.Alpha=IPARK_PVdq.Alpha;
//   ICLARKE_PVuvw.Beta=IPARK_PVdq.Beta;
//   ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);											//Iclake函数计算
		
		
		
}


//cal svpwm --xzw
void FOC_Svpwm_dq(void)
{
    SVPWM_dq.Ualpha = IPARK_PVdq.Alpha;										    //IPARK的数据传入SVPWM
    SVPWM_dq.Ubeta = IPARK_PVdq.Beta;
    
//    SVPWM_dq.Ualpha = 0;										                 //IPARK的数据传入SVPWM
//    SVPWM_dq.Ubeta = 0;
    
    SVPWM_Cale((M_SVPWM)&SVPWM_dq);												//将Alpha和Beta电压带入计算SVPWM的占空比
}


void Sensorless_Fullspeed_Control(void)
{
//    float ISpeed_Ref_EX = 0.0f;
//
//    Speed_Ref_GXieLv.XieLv_Grad = Speed_Ref_OD ;   		//定义速度的梯度值
//    Speed_Ref_GXieLv.Grad_Timer = Speed_Ref_Timer;    //定义速度的梯度时间
//    Speed_Ref_GXieLv.XieLv_X = Sensorless.Speed_Max;	//定义梯度上限
//
//    if(HFI_Init_Angle_flag)														//完成初始角度识别后开始，速度开始梯度增加
//    {
//        if(Observe_Switch_flag != 1)
//            Speed_Ref_GXieLv.Timer_Count ++;
//
//        if((my_abs(Sensorless.Speed_Ref - Sensorless.Speed_Fbk) >= ObersiveSwitch_SpeedErr) && (Sensorless.Observer == 1))
//            Speed_Ref_GXieLv.Timer_Count --;
//
//        if(Speed_Ref_GXieLv.Timer_Count > Speed_Ref_GXieLv.Grad_Timer)
//        {
//            Speed_Ref_GXieLv.Timer_Count = 0;
//            Grad_XieLv((p_GXieLv)&Speed_Ref_GXieLv);				//梯度计算
//        }
//        ISpeed_Ref_EX = Limit_Sat(Speed_Ref_GXieLv.XieLv_Y, Speed_Ref_Max, -Speed_Ref_Max);			//速度限幅
//        Sensorless.Speed_Ref = ISpeed_Ref_EX*Motor.P;			//转变为电角速度	rpm/min
//    }
//
//    switch(Sensorless.Observer)													//观测器选择
//    {
//    case 1:
//    {
//        if(HFI_Init_Angle_flag)													//初始角度检测完成后
//        {
//            if(Down_Time == 1)
//            {
//                HFI.Id_last = 0;
//                HFI.Iq_last = 0;
//
//                extract_Idq_f();
//                HFI_Observer(PARK_PCurr.Ds, PARK_PCurr.Qs);	//基于HFI的速度环控制
//
//                HFI.Ialpha_last = 0;
//                HFI.Ibeta_last = 0;
//                HFI.ialpha_h = 0;
//                HFI.ibeta_h = 0;
//            }
//            else
//            {
//                extract_Idq_f();
//                HFI_Observer(HFI.Idf, HFI.Iqf);
//            }
//        }
//        else
//            HFI_Init_Theta();
//        break;
//    }
//    case 3:
//    {
//        if(Up_Time == 1)
//        {
//            extract_Idq_f();
//            HFI_Observer(HFI.Idf, HFI.Iqf);
//        }
//        else if(Up_Time == 2)															//
//        {
//            extract_Idq_f();														//提取低频电流分量
//            SMO_Observer(HFI.Idf, HFI.Iqf);							//SMO速度闭环
//        }
//        else
//        {
//            SMO_Observer(PARK_PCurr.Ds, PARK_PCurr.Qs);
//        }
//        break;
//    }
//    default :
//        break;
//    }
//
//    Speed_Cal_time	%= Speed_Cal_Period;
}

//控制模式运行
void Control_Mode_CmdPara(void)
{
    switch(Motor.Control_Mode)
    {
    case Spd_I_CL:
    {
        Speed_Closeloop();

//        FOC_Svpwm_dq();												//SVPWM计算
        break;
    }
    case IF_Control:
    {
        switch(QT_IF_Mode)
        {
        case 1:																	//强拖至角度
        {
            QT_Motor();														//电机强拖控制
            FOC_Svpwm_dq();												   //SVPWM计算
            if(IF_Angle == QT_Angle)
            {
                M_STOP();														//停机
                IF_Angle = 0;
                IF_Frq = 0;
            }
            break;
        }
        case 2:																	//强拖旋转
        {
            QT_Motor();														//电机强拖控制
            FOC_Svpwm_dq();												//SVPWM计算
            break;
        }
        case 3:																	//IF启动
        {
//            if(SMO_Switch_flag)
//                Senserless_SMO_Control();						//基于SMO的无感控制
//            else
                IF_Start_Control();									//	I/F流频比控制
//            if(SMO_flag)													//开启SMO
//            {
//                Angle_SMO_Para.Ialpha = CLARKE_ICurr.Alpha;
//                Angle_SMO_Para.Ibeta = CLARKE_ICurr.Beta;
//                Angle_SMO_Para.Ualpha = SVPWM_dq.Ualpha;
//                Angle_SMO_Para.Ubeta = SVPWM_dq.Ubeta;
//                SMO_Angle_Cale((p_Angle_SMO)&Angle_SMO_Para);
//            }
						
						
            FOC_Svpwm_dq();
						//ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);	
            break;
        }
        default:
            break;
        }
        break;
    }
    case HFI_Control:
    {
////			HFI_Injection();										//在IF模式下，只在D轴注入高频电压，进行HFI调试
////        if(HFI_Init_Angle_flag)								//初始角度检测完毕后
////        {
////            HFI_Speed_Closeloop();						  //HFI速度闭环模式
//////				HFI_Init_Angle_flag = 0;
//////				Motor.M_State = 0;
//////				LED3 = !LED3;
//////				M_STOP();
////        }
////        else
////        {
////            HFI_Init_Theta();										//HFI初始角度检测
////        }
//
//        FOC_Svpwm_dq();												//SVPWM计算
        break;
    }
    case HS_Control:												//低速HFI，高速SMO的全速无感控制
    {
//        Sensorless_Fullspeed_Control();
//        FOC_Svpwm_dq();												//SVPWM计算
        break;
    }
    default :
        break;
    }
}

//控制模式选择
void FOC_Control_Selected(void)
{
     Motor.Control_Mode = IF_Control;		//IF or 强拖控制
        Control_Mode_CmdPara();		
    
//    switch(Motor.M_State)
//    {
////    case Spd_I_CL:
////    {
////        Motor.Control_Mode = Spd_I_CL;			//速度&电流闭环控制
////        Control_Mode_CmdPara();							//控制模式运行
////        break;
////    }
//    case IF_Control:
//    {
//        Motor.Control_Mode = IF_Control;		//IF or 强拖控制
//        Control_Mode_CmdPara();					    // 控制模式运行
//        break;
//    }
////    case T0_Zero:													//手动电机调零
////    {
////        break;
////    }
////    case M_HFI:
////    {
////        Motor.Control_Mode = HFI_Control;		//高频注入
////        Control_Mode_CmdPara();					    // 控制模式运行
////        break;
////    }
////    case HS_C:
////    {
////        Motor.Control_Mode = HS_Control;		  //低速HFI，高速SMO的全速无感控制
////        Control_Mode_CmdPara();					    // 控制模式运行
////        break;
////    }
//    default:
//    {
//        M_STOP();													 	//停机
//        break;
//    }
//    }
}

//变量清零
void Variable_Clear(void)
{
//	Speed_Clock = 0;										//速度计算计数
    Cal_Period = 0;											//闭环计算频率计数

// 	__HAL_TIM_SET_COUNTER(&htim3, 0);		//清除编码器当前计数值
//	encoder_overflow_count = 0;					//编码器溢出次数清零

    Motor.speed_M_rpm = 0;							//电机机械角速度清零
    Motor.speed_E_rpm = 0;							//电机电角速度清零
    Motor.Control_Mode = 0;							//电机控制模式清零
//	Motor.M_State = 0;								//电机状态置零
//	Motor.E_theta = 0;								//电机电角度清零

    IF_Frq = 0;													//强拖频率计数清零
    
 
    
    pi_spd.Ref = 0;
    pi_spd.Fbk = 0;
    pi_spd.err = 0;
    pi_spd.err_l = 0;
    pi_spd.Out = 0;
    pi_spd.OutF = 0;
    pi_spd.Ui = 0;
    pi_spd.Up = 0;

    pi_id.Ref = 0;
    pi_id.Fbk = 0;
    pi_id.err = 0;
    pi_id.Out = 0;
    pi_id.OutF = 0;
    pi_id.err_l = 0;
	pi_id.Ui = 0;
    pi_id.Up = 0;

    pi_iq.Ref = 0;
    pi_iq.Fbk = 0;
    pi_iq.err = 0;
    pi_iq.Out = 0;
    pi_iq.OutF = 0;
    pi_iq.err_l = 0;
	pi_iq.Ui = 0;
    pi_iq.Up = 0;

    IF_Freq_GXieLv.Timer_Count = 0;
    IF_Theta = 0;//M_PI_2;
    IF_Freq_GXieLv.XieLv_Y = 0;

    Speed_Ref_GXieLv.Timer_Count = 0;
    Speed_Ref_GXieLv.XieLv_Y = 0;

    Idq_Ref_GXieLv.Timer_Count = 0;
    Idq_Ref_GXieLv.XieLv_Y = 0;

    IPARK_PVdq.Alpha = 0;
    IPARK_PVdq.Beta = 0;
    IPARK_PVdq.Ds = 0;
    IPARK_PVdq.Qs = 0;

    SVPWM_dq.Ualpha = 0;
    SVPWM_dq.Ubeta = 0;

//    PLL_SMO_Para.Theta = 0;
//    PLL_SMO_Para.Angle = 0;
//    PLL_SMO_Para.Theta_Err = 0;
//    PLL_SMO_Para.Theta_Err_last = 0;
//    PLL_SMO_Para.Omega = 0;
//    PLL_SMO_Para.Omega_F = 0;
//    PLL_SMO_Para.Omega2 = 0;
//    PLL_SMO_Para.Omega2_F = 0;
//    PLL_SMO_Para.Theta_last = 0;

//    PLL_HFI_Para.Theta = 0;
//    PLL_HFI_Para.Theta_Err = 0;
//    PLL_HFI_Para.Theta_Err_last = 0;
//    PLL_HFI_Para.Omega = 0;
//    PLL_HFI_Para.Omega_F = 0;
//    PLL_HFI_Para.Omega2 = 0;
//    PLL_HFI_Para.Omega2_F = 0;
//    PLL_HFI_Para.Theta_last = 0;
//
//    HFI_Init_Angle_flag = 0;
//    HFI.Ialpha_last = 0;
//    HFI.Ibeta_last = 0;
//    HFI.Id_last = 0;
//    HFI.Iq_last = 0;
//    HFI.Uin = 0;
//    Angle_SMO_Para.Ealpha = 0;
//    Angle_SMO_Para.Ebeta = 0;
//    HFI_Uin_flag = 0;

//    Sensorless.Observer = 1;
//    Sensorless.Observer_last = 1;
//    Sensorless.theta = 0;
//    Sensorless.Omega = 0;
//    Sensorless.Speed_Fbk = 0;
//    Sensorless.Speed_Ref = 0;
//    Up_Time = 0;
//    Down_Time = 0;
//
//    Ext_Angle = 0;
//    Cal_time = 0;
//    Speed_Cal_time = 0;
//    Observe_Switch_flag = 0;
}

//数据发送至上位机观测
void Send_TO_PC(void)
{
//    vofa_data[0] =  ADC_Value[0];										//电角度   NTC_Temp  Motor.E_theta PARK_PCurr.Qs
//    vofa_data[1] =  ADC_Value[1];												//目标速度  ADC_Sample_Para.PhaseV_Curr  ADC_Sample_Para.PhaseW_Curr
//    vofa_data[2] =  SVPWM_dq.Ta;												//实际速度  PARK_PCurr.Qs;	 PARK_PCurr.Ds;		  pv->Ta 
//    vofa_data[3] =  SVPWM_dq.Tb;				            //目标d轴电流 Sensorless.Speed_Max;  ADC_Sample_F_Para.Temperature
//    vofa_data[4] =  SVPWM_dq.Tc;										//d轴实际电流  Sensorless.theta; PLL_SMO_Para.Angle SVPWM_dq.Ta
//    vofa_data[5] =  CLARKE_ICurr.Alpha ;             //         Motor.E_theta;					    //目标q轴电流PLL_HFI_Para.Omega_F/PIX2*Velocity_Constant
//    vofa_data[6] =  CLARKE_ICurr.Beta ;									//q轴实际电流 PLL_HFI_Para.Theta    CLARKE_ICurr.Iv  PLL_SMO_Para.Omega/PIX2*Velocity_Constant
//    vofa_data[7] =  IPARK_PVdq.Ds;
//    vofa_data[8] =  IPARK_PVdq.Qs;
//    vofa_data[9] = IF_Theta;
//
////	vofa_data[8] = CLARKE_ICurr.Alpha;
////	vofa_data[9] = CLARKE_ICurr.Beta;
//    JustFloat_Send(vofa_data, 10, USART1);
}

//J_Scope RTT模式数据发送
s16 JScope_data[4];
void J_Scope_Write(void)
{
//    JScope_data[0] = (s16)(pi_iq.Ref*100);
//    JScope_data[1] = (s16)(pi_iq.Fbk*100);
//    JScope_data[2] = (s16)(PLL_HFI_Para.Theta*100);
//    JScope_data[3] = (s16)(PLL_SMO_Para.Angle*100);
//
//    JScope_Data_Send(JScope_data, 4);
}

