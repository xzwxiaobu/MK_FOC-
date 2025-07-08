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

u8 		Fault_Code = 0;			//���ϴ���(0����������1������ѹ���ͣ�2������ѹ���ߣ�3������ת�쳣����ת��5����ʧ�ٱ�����6�������±���)
u8 		Cal_Period = 0;			//�ջ�����Ƶ�ʼ���
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

void Grad_XieLv(p_GXieLv pv)    // б���ݶȼ��� ������һ���ݶ�ֵ�ӼӼ���
{
    if(pv->XieLv_X < (pv->XieLv_Y - pv->XieLv_Grad)) // XieLv_Grad ���ݶ�ֵʱ��
    {
        pv->XieLv_Y = pv->XieLv_Y - pv->XieLv_Grad;
    }
    else if(pv->XieLv_X > (pv->XieLv_Y + pv->XieLv_Grad)) // ���ݶ�ֵʱ��
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
    SVPWM_dq.Ualpha = 0.0f;								//�����ѹ ��90��
    SVPWM_dq.Ubeta = 0.3f;
    SVPWM_Cale((M_SVPWM)&SVPWM_dq);   	  	           // ��Alpha��Beta��ѹ�������SVPWM��ռ�ձ�
    delay_1ms(500);
//
    SVPWM_dq.Ualpha =  0.3f;								//�����ѹ
    SVPWM_dq.Ubeta  =  0.0f;
    SVPWM_Cale((M_SVPWM)&SVPWM_dq);   		             // ��Alpha��Beta��ѹ�������SVPWM��ռ�ձ�
    delay_1ms(500);
	
    QEI1_Initialize () ;							   //�����������ǰ����ֵ
    Motor.E_theta = 0;
    delay_1ms(400);

     MCPWM_Stop() ;

//    LED1 = !LED1;
//    LED2 = !LED2;
}

//���ϼ��
static volatile int Vwrcnt  ;  
void Fault_Detection(void)
{
    static u16 i;

    if(Init_Over)								//��ʼ����������е��״̬�쳣��� Init_Over
    {
        if(ADC_Sample_F_Para.VBUS > Protect_High_Voltage_V)
        {
            Fault_Code = 2;						//��ѹ���ߣ�
         
                M_STOP();						    //ͣ��
                Motor.M_State = M_ERR;		//���״̬����
//            LED_RGB_Color(255,0,255);	//��ɫ�Ʊ���
         

        }
      
       
      if(ADC_Sample_F_Para.VBUS < Protect_Low_Voltage_V)
        {  
          
             Vwrcnt ++;
            if(Vwrcnt>30)
            {
            Fault_Code = 1;						//��ѹ����
            M_STOP();									//ͣ��
            Motor.M_State = M_ERR;		//���״̬����
//            LED_RGB_Color(0,255,255);	//��ɫ�Ʊ���
            }
   
        }
        else
        {
         Vwrcnt =0;
        
        }

        
        //����ת���
        if(my_abs(PARK_PCurr.Qs) >= pi_spd.Umax)
            Stall_time ++;
        if(Stall_time == 500)			//��ת500ms
        {
            M_STOP();					//ͣ��
            Fault_Code = 3;
            Stall_time = 0;
            Motor.M_State = M_ERR;		//���״̬����

//            LED_RGB_Color(255,0,0);		//��Ʊ���
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

    //ת��ƫ�������
    if(Motor.M_State == RUN)
    {
        if(my_abs(pi_spd.Fbk) > 200*Motor.P)					//�����ٶȴ���200RPM�󣬿����ٶ�ƫ����
        {
            if(pi_spd.err < 0)		//�ٶȸ���һ����Ŀ���ٶȿ�������
            {
                if(my_abs(pi_spd.err) > my_abs(pi_spd.Ref))
                {
                    M_STOP();										//ͣ��
                    Fault_Code = 5;							//ʧ�ٱ���
//                    LED_RGB_Color(255,165,0);		//��ɫ�Ʊ���
                    Motor.M_State = M_ERR;			//���״̬����
                }
            }
            if((Sign(pi_spd.Ref) + Sign(pi_spd.Fbk)) == 0)		//��Ŀ���ٶȷ�����ת����
            {
                M_STOP();											//ͣ��
                Fault_Code = 5;								      //ʧ�ٱ���
//                LED_RGB_Color(255,165,0);			             //��ɫ�Ʊ���
                Motor.M_State = M_ERR;				             //���״̬����
            }
        }
    }

    //���±���
    if(NTC_Temp >= 80)
    {
        M_STOP();										    //ͣ��
        Fault_Code = 6;										//���±���
//        LED_RGB_Color(255,10,5);					        //���ɫ�Ʊ���
        Motor.M_State = M_ERR;
    }

    if(Motor.M_State != M_ERR)
    {
        i ++;

        Fault_Code = 0;

//        if(i < 1000)
////            LED_RGB_Color(0,80,0);						//ϵͳ�������У���ɫ����˸
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
        Variable_Clear();			//��������
}


void M_RUN(void)
{
//      Fault_Detection();				                                         // ����ǰ�Ƚ��й��ϼ��  
//      MCPWM_Initialize();
//      MCPWM_CallbackRegister(MCPWM_CH_1, PWM_PeriodHandler, (uintptr_t)NULL);   //  �� stop �� ����ȻҪ ���� ��ʼ�� Ȼ��ע��ص� 
      MCPWM_Start();
}

//ǿ���϶�
void QT_Motor(void)
{
    IF_Frq ++;
    if(IF_Frq == QT_Frq)					//ǿ��Ƶ��50΢�� *50=2500  2.5ms
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

//���������dq������仯
void UVW_Axis_dq(void)
{
    Speed_Cal_time ++;            // 20K ��Ƶ��  ���� 

    CLARKE_ICurr.Iv = ADC_Sample_Para.PhaseV_Curr;			//���������������CLARK�任
    CLARKE_ICurr.Iw = ADC_Sample_Para.PhaseW_Curr;
	CLARKE_ICurr.Iu=-CLARKE_ICurr.Iv-CLARKE_ICurr.Iw;
    CLARKE_Cale((M_CLARKE)&CLARKE_ICurr);					//CLARK�任�������ȷ�ֵ�任
   
//    if(Motor.Control_Mode== IF_Control)	
//    {
          PARK_PCurr.Theta =IF_Theta ;	
    
//    }
  
    
//           Get_Postion() ;
    
   
    
    PARK_PCurr.Alpha = CLARKE_ICurr.Alpha;								//CLARK�任��õ���Alpha_I���뵽PARK�任
    PARK_PCurr.Beta = CLARKE_ICurr.Beta;
    PARK_Cale((M_PARK)&PARK_PCurr);							            //PARK�任����
}

//����ٶȿ����������ջ�����
//IF�����ٶ�=IF_Fre_Max/P*60 rpm/min 
void IF_Start_Control(void)
{
    float IF_Freq_EX = 0.0f;
  
    
    IF_Freq_GXieLv.XieLv_Grad = IF_F_Grad_0D1HZ ;   //����Ƶ�ʵ��ݶ�ֵ
    IF_Freq_GXieLv.Grad_Timer = IF_F_Grad_Timer;    //����Ƶ�ʵ��ݶ�ʱ��
    IF_Freq_GXieLv.XieLv_X = IF_Fre_Max;			//�����ݶ�����
   
    IF_Freq_GXieLv.Timer_Count ++;                 //20K    1/20000*20
    if(IF_Freq_GXieLv.Timer_Count > IF_Freq_GXieLv.Grad_Timer)
    {
        IF_Freq_GXieLv.Timer_Count = 0;
        Grad_XieLv((p_GXieLv)&IF_Freq_GXieLv);				//�ݶȼ���
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

		
		
    pi_id.Ref = 0.0f;														      //id=0��d������ջ������ش�
    pi_id.Fbk = PARK_PCurr.Ds;
    PI_Controller((M_PI_Control)&pi_id);									     //Id��ջ�
//	pi_id.OutF = pi_id.OutF*LPF_I_RUN_B + pi_id.Out*LPF_I_RUN_A;
		
	float maxVsMag_V = MaxVsMagPu * ADC_Sample_F_Para.VBUS;
    float outMax_V = maxVsMag_V * maxVsMag_V -  pi_id.Out *  pi_id.Out;
    outMax_V =sqrtf(outMax_V);        //����֤��������  
  //  outMax_V=2.0f;
    pi_iq.Umax = 	outMax_V;
    pi_iq.Umin =   -outMax_V;
    pi_iq.Ref =    IF_Current;																//Iq���趨�͵���Ķת���йأ�IF����һ��Iqѡ��ȶת���µ�Iq�Դ�
    pi_iq.Fbk=    PARK_PCurr.Qs;
    PI_Controller((M_PI_Control)&pi_iq);									//Iq��ջ�
//	pi_iq.OutF = pi_iq.OutF*LPF_I_RUN_B + pi_iq.Out*LPF_I_RUN_A;

    IPARK_PVdq.Theta = IF_Theta;
    IPARK_PVdq.Ds = pi_id.Out;
    IPARK_PVdq.Qs = pi_iq.Out;
    IPARK_Cale((M_IPARK)&IPARK_PVdq);											//IPARK��������

   		
//   ICLARKE_PVuvw.Alpha=IPARK_PVdq.Alpha;
//   ICLARKE_PVuvw.Beta=IPARK_PVdq.Beta;
 //  ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);								//Iclake��������

}

//����SMO���޸п���
void Senserless_SMO_Control(void)
{
//    if(Speed_Cal_time == Speed_Cal_Period)
//    {
//        Speed_Cal_time	%= Speed_Cal_Period;
//
//        pi_spd.Ref = M_SPEED*Motor.P;
//        pi_spd.Fbk = PLL_SMO_Para.Omega/PIX2*60;
//        PI_Controller((M_PI_Control)&pi_spd);									//�ٶȻ�
//        pi_spd.OutF=pi_spd.OutF*LPF_I_RUN_B+pi_spd.Out*LPF_I_RUN_A; //��·�˲������
//    }
//
//    pi_id.Ref = 0;																				//id=0��d������ջ������ش�
//    pi_id.Fbk = PARK_PCurr.Ds;
//    PI_Controller((M_PI_Control)&pi_id);									//Id��ջ�
//    pi_id.OutF=pi_id.OutF*LPF_I_RUN_B + pi_id.Out*LPF_I_RUN_A;
//		
//		float maxVsMag_V = MaxVsMagPu * ADC_Sample_F_Para.VBUS;
//    float outMax_V = maxVsMag_V * maxVsMag_V -  pi_id.Out *  pi_id.Out;
//    arm_sqrt_f32(outMax_V, &outMax_V);
//
//    pi_iq.Umax = 	outMax_V;
//    pi_iq.Umin = -outMax_V;
//    pi_iq.Ref = pi_spd.OutF;															//Iq���趨�͵���Ķת���йأ�IF����һ��Iqѡ��ȶת���µ�Iq�Դ�
//    pi_iq.Fbk	= PARK_PCurr.Qs;
//    PI_Controller((M_PI_Control)&pi_iq);									//Iq��ջ�
//    pi_iq.OutF = pi_iq.OutF*LPF_I_RUN_B + pi_iq.Out*LPF_I_RUN_A;
//
//    IPARK_PVdq.Theta = PLL_SMO_Para.Angle;
//    IPARK_PVdq.Ds = pi_id.OutF;
//    IPARK_PVdq.Qs = pi_iq.OutF;
//    IPARK_Cale((M_IPARK)&IPARK_PVdq);											//IPARK��������
//		
//		
////   ICLARKE_PVuvw.Alpha=IPARK_PVdq.Alpha;
////   ICLARKE_PVuvw.Beta=IPARK_PVdq.Beta;
////   ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);											//Iclake��������
////		
		
		
		
}

//�и�,�ٶȱջ�,�����ջ�
void Speed_Closeloop(void)
{
    float ISpeed_Ref_EX = 0.0f;

    Speed_Ref_GXieLv.XieLv_Grad = Speed_Ref_OD ;   		// �����ٶȵ��ݶ�ֵ
    Speed_Ref_GXieLv.Grad_Timer = Speed_Ref_Timer;      // �����ٶȵ��ݶ�ʱ��
    Speed_Ref_GXieLv.XieLv_X = M_SPEED;					// �����ݶ�����

    Speed_Ref_GXieLv.Timer_Count++;

    if(my_abs(pi_spd.Ref - pi_spd.Fbk) >= 700)
        Speed_Ref_GXieLv.Timer_Count --;

    if(Speed_Ref_GXieLv.Timer_Count > Speed_Ref_GXieLv.Grad_Timer)
    {
        Speed_Ref_GXieLv.Timer_Count = 0;
        Grad_XieLv((p_GXieLv)&Speed_Ref_GXieLv);				//�ݶȼ���
    }
    ISpeed_Ref_EX = Limit_Sat(Speed_Ref_GXieLv.XieLv_Y, Speed_Ref_Max, -Speed_Ref_Max );

    if(Speed_Cal_time == PWMZD_Count)			// 1ms����һ��ת�ٻ�  �ٶȻ����ȵ����� 
    {
        Speed_Cal_time	%= PWMZD_Count;
        pi_spd.Ref = ISpeed_Ref_EX*Motor.P;
        pi_spd.Fbk = Motor.speed_E_rpm;
        PI_Controller((M_PI_Control)&pi_spd);									//�ٶȻ�
//	pi_spd.OutF=pi_spd.OutF*LPF_I_RUN_B + pi_spd.Out*LPF_I_RUN_A; //��·�˲������
    }


    pi_id.Ref = 0.0f;																		//id=0��d������ջ������ش�
    pi_id.Fbk = PARK_PCurr.Ds;
    PI_Controller((M_PI_Control)&pi_id);									               //Id��ջ�
//	pi_id.OutF=pi_id.OutF*LPF_I_RUN_B + pi_id.Out*LPF_I_RUN_A;
		
    float maxVsMag_V = MaxVsMagPu * ADC_Sample_F_Para.VBUS;
    float outMax_V = maxVsMag_V * maxVsMag_V -  pi_id.Out *  pi_id.Out;
//    arm_sqrt_f32(outMax_V, &outMax_V);
      outMax_V =sqrtf(outMax_V);

    pi_iq.Umax =  	outMax_V;
    pi_iq.Umin =    -outMax_V;
    pi_iq.Ref =  1.5;        //pi_spd.Out;
    pi_iq.Fbk	= PARK_PCurr.Qs;
    PI_Controller((M_PI_Control)&pi_iq);									//Iq��ջ�
//	pi_iq.OutF=pi_iq.OutF*LPF_I_RUN_B + pi_iq.Out*LPF_I_RUN_A;

    IPARK_PVdq.Theta = Motor.E_theta;
    IPARK_PVdq.Ds = pi_id.Out;
    IPARK_PVdq.Qs = pi_iq.Out;
    IPARK_Cale((M_IPARK)&IPARK_PVdq);											//IPARK��������
		
		
//	 ICLARKE_PVuvw.Alpha=IPARK_PVdq.Alpha;
//   ICLARKE_PVuvw.Beta=IPARK_PVdq.Beta;
//   ICLARKE_Cale((M_ICLARKE)&ICLARKE_PVuvw);											//Iclake��������
		
		
		
}


//cal svpwm --xzw
void FOC_Svpwm_dq(void)
{
    SVPWM_dq.Ualpha = IPARK_PVdq.Alpha;										    //IPARK�����ݴ���SVPWM
    SVPWM_dq.Ubeta = IPARK_PVdq.Beta;
    
//    SVPWM_dq.Ualpha = 0;										                 //IPARK�����ݴ���SVPWM
//    SVPWM_dq.Ubeta = 0;
    
    SVPWM_Cale((M_SVPWM)&SVPWM_dq);												//��Alpha��Beta��ѹ�������SVPWM��ռ�ձ�
}


void Sensorless_Fullspeed_Control(void)
{
//    float ISpeed_Ref_EX = 0.0f;
//
//    Speed_Ref_GXieLv.XieLv_Grad = Speed_Ref_OD ;   		//�����ٶȵ��ݶ�ֵ
//    Speed_Ref_GXieLv.Grad_Timer = Speed_Ref_Timer;    //�����ٶȵ��ݶ�ʱ��
//    Speed_Ref_GXieLv.XieLv_X = Sensorless.Speed_Max;	//�����ݶ�����
//
//    if(HFI_Init_Angle_flag)														//��ɳ�ʼ�Ƕ�ʶ���ʼ���ٶȿ�ʼ�ݶ�����
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
//            Grad_XieLv((p_GXieLv)&Speed_Ref_GXieLv);				//�ݶȼ���
//        }
//        ISpeed_Ref_EX = Limit_Sat(Speed_Ref_GXieLv.XieLv_Y, Speed_Ref_Max, -Speed_Ref_Max);			//�ٶ��޷�
//        Sensorless.Speed_Ref = ISpeed_Ref_EX*Motor.P;			//ת��Ϊ����ٶ�	rpm/min
//    }
//
//    switch(Sensorless.Observer)													//�۲���ѡ��
//    {
//    case 1:
//    {
//        if(HFI_Init_Angle_flag)													//��ʼ�Ƕȼ����ɺ�
//        {
//            if(Down_Time == 1)
//            {
//                HFI.Id_last = 0;
//                HFI.Iq_last = 0;
//
//                extract_Idq_f();
//                HFI_Observer(PARK_PCurr.Ds, PARK_PCurr.Qs);	//����HFI���ٶȻ�����
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
//            extract_Idq_f();														//��ȡ��Ƶ��������
//            SMO_Observer(HFI.Idf, HFI.Iqf);							//SMO�ٶȱջ�
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

//����ģʽ����
void Control_Mode_CmdPara(void)
{
    switch(Motor.Control_Mode)
    {
    case Spd_I_CL:
    {
        Speed_Closeloop();

//        FOC_Svpwm_dq();												//SVPWM����
        break;
    }
    case IF_Control:
    {
        switch(QT_IF_Mode)
        {
        case 1:																	//ǿ�����Ƕ�
        {
            QT_Motor();														//���ǿ�Ͽ���
            FOC_Svpwm_dq();												   //SVPWM����
            if(IF_Angle == QT_Angle)
            {
                M_STOP();														//ͣ��
                IF_Angle = 0;
                IF_Frq = 0;
            }
            break;
        }
        case 2:																	//ǿ����ת
        {
            QT_Motor();														//���ǿ�Ͽ���
            FOC_Svpwm_dq();												//SVPWM����
            break;
        }
        case 3:																	//IF����
        {
//            if(SMO_Switch_flag)
//                Senserless_SMO_Control();						//����SMO���޸п���
//            else
                IF_Start_Control();									//	I/F��Ƶ�ȿ���
//            if(SMO_flag)													//����SMO
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
////			HFI_Injection();										//��IFģʽ�£�ֻ��D��ע���Ƶ��ѹ������HFI����
////        if(HFI_Init_Angle_flag)								//��ʼ�Ƕȼ����Ϻ�
////        {
////            HFI_Speed_Closeloop();						  //HFI�ٶȱջ�ģʽ
//////				HFI_Init_Angle_flag = 0;
//////				Motor.M_State = 0;
//////				LED3 = !LED3;
//////				M_STOP();
////        }
////        else
////        {
////            HFI_Init_Theta();										//HFI��ʼ�Ƕȼ��
////        }
//
//        FOC_Svpwm_dq();												//SVPWM����
        break;
    }
    case HS_Control:												//����HFI������SMO��ȫ���޸п���
    {
//        Sensorless_Fullspeed_Control();
//        FOC_Svpwm_dq();												//SVPWM����
        break;
    }
    default :
        break;
    }
}

//����ģʽѡ��
void FOC_Control_Selected(void)
{
     Motor.Control_Mode = IF_Control;		//IF or ǿ�Ͽ���
        Control_Mode_CmdPara();		
    
//    switch(Motor.M_State)
//    {
////    case Spd_I_CL:
////    {
////        Motor.Control_Mode = Spd_I_CL;			//�ٶ�&�����ջ�����
////        Control_Mode_CmdPara();							//����ģʽ����
////        break;
////    }
//    case IF_Control:
//    {
//        Motor.Control_Mode = IF_Control;		//IF or ǿ�Ͽ���
//        Control_Mode_CmdPara();					    // ����ģʽ����
//        break;
//    }
////    case T0_Zero:													//�ֶ��������
////    {
////        break;
////    }
////    case M_HFI:
////    {
////        Motor.Control_Mode = HFI_Control;		//��Ƶע��
////        Control_Mode_CmdPara();					    // ����ģʽ����
////        break;
////    }
////    case HS_C:
////    {
////        Motor.Control_Mode = HS_Control;		  //����HFI������SMO��ȫ���޸п���
////        Control_Mode_CmdPara();					    // ����ģʽ����
////        break;
////    }
//    default:
//    {
//        M_STOP();													 	//ͣ��
//        break;
//    }
//    }
}

//��������
void Variable_Clear(void)
{
//	Speed_Clock = 0;										//�ٶȼ������
    Cal_Period = 0;											//�ջ�����Ƶ�ʼ���

// 	__HAL_TIM_SET_COUNTER(&htim3, 0);		//�����������ǰ����ֵ
//	encoder_overflow_count = 0;					//�����������������

    Motor.speed_M_rpm = 0;							//�����е���ٶ�����
    Motor.speed_E_rpm = 0;							//�������ٶ�����
    Motor.Control_Mode = 0;							//�������ģʽ����
//	Motor.M_State = 0;								//���״̬����
//	Motor.E_theta = 0;								//�����Ƕ�����

    IF_Frq = 0;													//ǿ��Ƶ�ʼ�������
    
 
    
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

//���ݷ�������λ���۲�
void Send_TO_PC(void)
{
//    vofa_data[0] =  ADC_Value[0];										//��Ƕ�   NTC_Temp  Motor.E_theta PARK_PCurr.Qs
//    vofa_data[1] =  ADC_Value[1];												//Ŀ���ٶ�  ADC_Sample_Para.PhaseV_Curr  ADC_Sample_Para.PhaseW_Curr
//    vofa_data[2] =  SVPWM_dq.Ta;												//ʵ���ٶ�  PARK_PCurr.Qs;	 PARK_PCurr.Ds;		  pv->Ta 
//    vofa_data[3] =  SVPWM_dq.Tb;				            //Ŀ��d����� Sensorless.Speed_Max;  ADC_Sample_F_Para.Temperature
//    vofa_data[4] =  SVPWM_dq.Tc;										//d��ʵ�ʵ���  Sensorless.theta; PLL_SMO_Para.Angle SVPWM_dq.Ta
//    vofa_data[5] =  CLARKE_ICurr.Alpha ;             //         Motor.E_theta;					    //Ŀ��q�����PLL_HFI_Para.Omega_F/PIX2*Velocity_Constant
//    vofa_data[6] =  CLARKE_ICurr.Beta ;									//q��ʵ�ʵ��� PLL_HFI_Para.Theta    CLARKE_ICurr.Iv  PLL_SMO_Para.Omega/PIX2*Velocity_Constant
//    vofa_data[7] =  IPARK_PVdq.Ds;
//    vofa_data[8] =  IPARK_PVdq.Qs;
//    vofa_data[9] = IF_Theta;
//
////	vofa_data[8] = CLARKE_ICurr.Alpha;
////	vofa_data[9] = CLARKE_ICurr.Beta;
//    JustFloat_Send(vofa_data, 10, USART1);
}

//J_Scope RTTģʽ���ݷ���
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

