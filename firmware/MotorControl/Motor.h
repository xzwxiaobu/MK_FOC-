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





#define  MCPWM_Period		  3000			//��ʱ��1����װ��ֵ
//#define TIM1_Period_Half 		4200			//��ʱ��1��װ��ֵ��һ��

#define Speed_Cal_Period		20				//�ٶȻ���������		2k
#define BWc_rps					1000	//����������

#define STOP			0		//���ֹͣ״̬
#define RUN				1		//����ٶȵ����ջ�
#define UP				2		//���IF or ǿ��
#define T0_Zero		    3		//�ֶ�����
#define M_ERR			4		//������й���
#define M_HFI			5		//��Ƶע��ģʽ
#define HS_C			6		//����HFI������SMO��ȫ���޸п���

#define HFI_Uin_offset 		1.0f			//HFIע���Ƶ��ѹƫ��
//#define HFI_Open_flag			0					//������Ƶע��	0�����رգ�1��������

#define Spd_I_CL		    1		//�ٶȺ͵����ջ�����ģʽ
#define IF_Control			2		//IF����
#define HFI_Control			3		//HFI����
#define HS_Control			5		//����HFI������SMO

#define QT_Angle				210	//ǿ�����Ƕȣ�0����360��
#define QT_Frq					50	//ǿ��Ƶ��=TIM1_Frq/QT_Frq
#define QT_IF_Mode			    3  //1����ǿ�����Ƕȣ�2����ǿ����ת��3����IF����

#define IF_Theta_Init							4.71238898f		//�����϶���Ϊ270�㣬һ��ʼIq��ʵ��ת�ӵ�q�����Ϊ0
#define PIX2						            6.28318530718f//2PI
#define DEG_10								    0.1745329252f	//10��Ƕ��ƶ�Ӧ�Ļ�����
#define Velocity_Constant					    8.571428571f	//�ٶȳ���=60/Motor.P

#define IF_F_Grad_Timer 					20				//����Ƕȸı�Ƶ�ʵ��ݶ�ʱ��20    20  
#define IF_F_Grad_0D1HZ    				   0.1f					//����Ƕȸı�Ƶ�ʵ��ݶ�ֵ0.08 0.1
#define IF_Fre_Max						   10.0f			    	//IF�Ƕȸı�����ֵ82 80   4A-3000RPM/MIN    3000/60=50hz  50*p=200
#define IF_Current_Max					   0.4f					//�ٶȿ����������ջ��еĵ�������-1.8 

#define Speed_Ref_Timer						    30						//����Ŀ���ٶȸı���ݶ�ʱ��
#define Speed_Ref_OD							1.0f					//����Ŀ���ٶȸı���ݶ�ֵ
#define Speed_Ref_Max							9000					//Ŀ���ٶ�����ֵ����е���ٶ�

#define HFI_Speed_Ref_Max					550						//HFI���ת���ٶ�����

#define Motor_Freq_Min      			4							//����Ƶ�ʵ���Сֵ
#define Motor_Freq_Max  	  			200						//����Ƶ�����ֵ

#define ObersiveSwitch_SpeedErr		700						//������ٶ�С�ڸ�ֵʱ��Ŀ���ٶȲ�������

#define Protect_Low_Voltage_V     16.2f 				//��ѹ����
#define Standard_Work_Voltage_V   24.0f					//��׼������ѹ
#define Protect_High_Voltage_V    26.8f 				//��ѹ����

#define Sqrt_OF_3									0.57735f
#define Svpwm_Km        					(Standard_Work_Voltage_V*Sqrt_OF_3)
#define Svpwm_Km_Backw						0.1443376f		// ����  1/(Standard_Work_Voltage_V*Sqrt_OF_3)
#define SVGEN_SQRT3_OVER_2     		        ((float)(0.8660254038f))			// sqrt(3)/2
#define MaxVsMagPu							0.56f					// ���������Ʊ�Vs/Vdc

#define Vdc_s          Standard_Work_Voltage_V*MaxVsMagPu      //  (Standard_Work_Voltage_V*Sqrt_OF_3*0.96)
#define PI_MAX_Ud      Standard_Work_Voltage_V*MaxVsMagPu      //  (Standard_Work_Voltage_V*Sqrt_OF_3*0.92)
#define PI_MAX_Uq      Standard_Work_Voltage_V*MaxVsMagPu      //  (Standard_Work_Voltage_V*Sqrt_OF_3*0.92)
#define PI_MAX_Spd				 				4.0f												 // ��������


typedef struct {
    float 	M_theta;				//���ת�ӻ�е�Ƕ�
    float	E_theta;				//���ת�ӵ�Ƕ�
    float 	speed_M_rpm;		//�����ǰ��е���ٶ�	rpm/min
    float	speed_E_rpm;		//�����ǰ����ٶ�		rpm/min
    vu8		M_State;				//�����ǰ����״̬
    vu8 	Control_Mode;	  //�������ģʽ
    float 	Rs;							//����������
    float 	Ls;							//���������
    float 	Ib;							//��������
    float 	Vb;							//������ѹ
    float   Ld;
    float   Lq;
    u8		 P;							//���������
    vu32    adccnt;
} motor_p;

#define MOTOR_DEFAULTS		{0,0,0,0,0,0,0,0,0,0,0,0,0,0}			//���״̬������ʼ��

typedef struct {
    vu8 			Observer;				//�޸п���ʱ�Ĺ۲���ѡ��1����HFI��3����SMO
    vu8 			Observer_last;
    volatile	float 		theta;					//�۲����Ƕ�
    volatile	float		Omega;					//�۲�������ٶȣ�������		rad/s
    volatile	float 		Speed_Fbk;			//�۲����ٶȷ���ֵ
    float			Speed_Ref;			//�۲����ٶ�Ŀ��ֵ
    s16				Speed_Max;			//�۲���Ŀ���ٶ����ֵ
    s16				w1;							//�۲�����������ɽ׶��ٽ�ֵ
    s16				w2;							//�۲�����������ɽ׶��ٽ�ֵ
} Sensorless_Control;

#define Sensorless_DEFAULTS		{1,1,0,0,0,0,0,0,0}				//�۲����ںϲ�����ʼ��

extern s16 M_SPEED;
extern s16 HFI_Speed;
extern motor_p Motor;
extern const float ubeta_tab[360];
extern const float ualpha_tab[360];
extern Sensorless_Control Sensorless;

void Motor_Init(void);								//��������ܳ�ʼ��
float my_atan2(float x, float y);			//�����к���		atan2(x,y)
float my_atan(float x);								//�����м���		atan(x)
s8 Sign(float x);											//���ź���
float my_abs(float x);								//ȡ����ֵ
float Sat(float s, float delta);			//���ͺ���
float Sigmoid(float delta) ;
float my_max(float a, float b);				//ȡ���ֵ����
void JScope_Data_Send(int16_t *data, u8 Number);		//J_Scope���ݷ���

#endif

