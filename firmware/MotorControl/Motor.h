#ifndef __MOTOR_H
#define __MOTOR_H




typedef int32_t  s32;
typedef int16_t s16;
typedef int8_t  s8;

typedef const int32_t sc32;  
typedef const int16_t sc16;  
typedef const int8_t sc8;  

//typedef __IO int32_t  vs32;
//typedef __IO int16_t  vs16;
//typedef __IO int8_t   vs8;
//
//typedef __I int32_t vsc32;  
//typedef __I int16_t vsc16; 
//typedef __I int8_t vsc8;   

typedef uint32_t  u32;
typedef uint16_t u16;
typedef uint8_t  u8;

typedef const uint32_t uc32;  
typedef const uint16_t uc16;  
typedef const uint8_t uc8; 

typedef volatile uint32_t  vu32;
typedef volatile uint16_t vu16;
typedef volatile uint8_t  vu8;
//
//typedef __I uint32_t vuc32;  
//typedef __I uint16_t vuc16; 
//typedef __I uint8_t vuc8;  





#define  MCPWM_Period		  3000			//定时器1的重装载值
//#define TIM1_Period_Half 		4200			//定时器1重装载值的一半

#define Speed_Cal_Period		20				//速度环计算周期		2k
#define BWc_rps					1000	//电流环带宽

#define STOP			0		//电机停止状态
#define RUN				1		//电机速度电流闭环
#define UP				2		//电机IF or 强拖
#define T0_Zero		    3		//手动调零
#define M_ERR			4		//电机运行故障
#define M_HFI			5		//高频注入模式
#define HS_C			6		//低速HFI，高速SMO的全速无感控制

#define HFI_Uin_offset 		1.0f			//HFI注入高频电压偏置
//#define HFI_Open_flag			0					//开启高频注入	0——关闭；1——开启

#define Spd_I_CL		    1		//速度和电流闭环控制模式
#define IF_Control			2		//IF控制
#define HFI_Control			3		//HFI控制
#define HS_Control			5		//低速HFI，高速SMO

#define QT_Angle				210	//强拖至角度（0——360）
#define QT_Frq					50	//强拖频率=TIM1_Frq/QT_Frq
#define QT_IF_Mode			    3  //1——强拖至角度；2——强拖旋转；3——IF启功

#define IF_Theta_Init							4.71238898f		//开环拖动角为270°，一开始Iq在实际转子的q轴分量为0
#define PIX2						            6.28318530718f//2PI
#define DEG_10								    0.1745329252f	//10°角度制对应的弧度制
#define Velocity_Constant					    8.571428571f	//速度常数=60/Motor.P

#define IF_F_Grad_Timer 					20				//定义角度改变频率的梯度时间20    20  
#define IF_F_Grad_0D1HZ    				   0.1f					//定义角度改变频率的梯度值0.08 0.1
#define IF_Fre_Max						   10.0f			    	//IF角度改变上限值82 80   4A-3000RPM/MIN    3000/60=50hz  50*p=200
#define IF_Current_Max					   0.4f					//速度开环，电流闭环中的电流上限-1.8 

#define Speed_Ref_Timer						    30						//定义目标速度改变的梯度时间
#define Speed_Ref_OD							1.0f					//定义目标速度改变的梯度值
#define Speed_Ref_Max							9000					//目标速度上限值，机械角速度

#define HFI_Speed_Ref_Max					550						//HFI最大转速速度限制

#define Motor_Freq_Min      			4							//定义频率的最小值
#define Motor_Freq_Max  	  			200						//定义频率最大值

#define ObersiveSwitch_SpeedErr		700						//当电角速度小于该值时，目标速度不再增加

#define Protect_Low_Voltage_V     16.2f 				//低压保护
#define Standard_Work_Voltage_V   24.0f					//标准工作电压
#define Protect_High_Voltage_V    26.8f 				//高压保护

#define Sqrt_OF_3									0.57735f
#define Svpwm_Km        					(Standard_Work_Voltage_V*Sqrt_OF_3)
#define Svpwm_Km_Backw						0.1443376f		// 倒数  1/(Standard_Work_Voltage_V*Sqrt_OF_3)
#define SVGEN_SQRT3_OVER_2     		        ((float)(0.8660254038f))			// sqrt(3)/2
#define MaxVsMagPu							0.56f					// 最大允许调制比Vs/Vdc

#define Vdc_s          Standard_Work_Voltage_V*MaxVsMagPu      //  (Standard_Work_Voltage_V*Sqrt_OF_3*0.96)
#define PI_MAX_Ud      Standard_Work_Voltage_V*MaxVsMagPu      //  (Standard_Work_Voltage_V*Sqrt_OF_3*0.92)
#define PI_MAX_Uq      Standard_Work_Voltage_V*MaxVsMagPu      //  (Standard_Work_Voltage_V*Sqrt_OF_3*0.92)
#define PI_MAX_Spd				 				4.0f												 // 电机额定电流


typedef struct {
    float 	M_theta;				//电机转子机械角度
    float	E_theta;				//电机转子电角度
    float 	speed_M_rpm;		//电机当前机械角速度	rpm/min
    float	speed_E_rpm;		//电机当前电角速度		rpm/min
    vu8		M_State;				//电机当前运行状态
    vu8 	Control_Mode;	  //电机控制模式
    float 	Rs;							//电机的相电阻
    float 	Ls;							//电机的相电感
    float 	Ib;							//电机相电流
    float 	Vb;							//电机相电压
    float   Ld;
    float   Lq;
    u8		 P;							//电机极对数
    vu32    adccnt;
} motor_p;

#define MOTOR_DEFAULTS		{0,0,0,0,0,0,0,0,0,0,0,0,0,0}			//电机状态参数初始化

typedef struct {
    vu8 			Observer;				//无感控制时的观测器选择，1——HFI；3——SMO
    vu8 			Observer_last;
    volatile	float 		theta;					//观测器角度
    volatile	float		Omega;					//观测器电角速度，弧度制		rad/s
    volatile	float 		Speed_Fbk;			//观测器速度反馈值
    float			Speed_Ref;			//观测器速度目标值
    s16				Speed_Max;			//观测器目标速度最大值
    s16				w1;							//观测器低速与过渡阶段临界值
    s16				w2;							//观测器高速与过渡阶段临界值
} Sensorless_Control;

#define Sensorless_DEFAULTS		{1,1,0,0,0,0,0,0,0}				//观测器融合参数初始化

extern s16 M_SPEED;
extern s16 HFI_Speed;
extern motor_p Motor;
extern const float ubeta_tab[360];
extern const float ualpha_tab[360];
extern Sensorless_Control Sensorless;

void Motor_Init(void);								//电机参数总初始化
float my_atan2(float x, float y);			//反正切函数		atan2(x,y)
float my_atan(float x);								//反正切计算		atan(x)
s8 Sign(float x);											//符号函数
float my_abs(float x);								//取绝对值
float Sat(float s, float delta);			//饱和函数
float Sigmoid(float delta) ;
float my_max(float a, float b);				//取最大值函数
void JScope_Data_Send(int16_t *data, u8 Number);		//J_Scope数据发送

#endif

