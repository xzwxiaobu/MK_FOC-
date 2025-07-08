#ifndef __FOC_CONTROL_H
#define __FOC_CONTROL_H

#include <stdio.h>
#include "math.h"
#include "Coordinate_transform.h"
#include "Motor.h"
#include "PI_Cale.h"
#include "definitions.h"                // SYS function prototypes
#include "vofa.h"
//#include "Sensorless_SMO.h"
//#include "HFI.h"
#include "SVPWM.h"
//#include "Filter.h"
//#include "SEGGER_RTT.h"

typedef int32_t  s32;
typedef int16_t s16;
typedef int8_t  s8;

typedef const int32_t sc32;  
typedef const int16_t sc16;  
typedef const int8_t sc8;  



#define PWMZD_Count		    100				//??????????1K
#define TIM1_Frq			20000			//mcpwm ????
#define TS 				    0.00005f 		   //SVPWM?????



#define Encoder_Fre		12000		  // TIM1_Frq/PWMZD_Count*60 
#define Encoder_lines	4*4         //  4�Լ���hall  Ӧ�û��� һ����е���� 5�� *2 ����  �������� *2   // 4*1000 �Ǳ�����
//#define Encoder_Pulse	16384			//Encoder_lines*4
//#define TIM3_Pulse		16384			//???3????


//extern  static  volatile float IF_Theta ;


typedef struct
{ 
    float  XieLv_X;     // ָ�����б���������x
    float  XieLv_Y;
    float  XieLv_Grad;
    uint8_t     Timer_Count;
    uint8_t     Grad_Timer;
} GXieLv, *p_GXieLv;

#define  GXieLv_DEFAULTS    {0,0,0,0,0}

extern 	CLARKE       CLARKE_ICurr;
extern 	PARK         PARK_PCurr;
extern  IPARK        IPARK_PVdq;
extern 	GXieLv       IF_Freq_GXieLv;
extern 	GXieLv	     Speed_Ref_GXieLv;
extern  IPARK	     IPARK_SMO_PVdq;

extern uint8_t 					Fault_Code;			//���ϴ���
extern uint8_t 					Cal_time;
extern volatile uint8_t	     	Speed_Cal_time;
extern volatile float 		   IF_Theta;
//extern bool 				    Observe_Switch_flag;
extern volatile  bool                  Init_Over  ;

void Grad_XieLv(p_GXieLv pv);			//�ݶȼӼ�
void Position_To_Zero(void);			//�������
void Fault_Detection(void);			//���ϼ��
void M_STOP(void);						//���ֹͣ
void M_RUN(void);					   //�������
void UVW_Axis_dq(void);						//������任
void Speed_Closeloop(void);				//�ٶ�&�����ջ�
void FOC_Svpwm_dq(void);					//SVPM����
void QT_Motor(void);							//ǿ���϶�
void FOC_Control_Selected(void);	            //����ģʽѡ��
void Control_Mode_CmdPara(void);               // ����ģʽ����
void Variable_Clear(void);				      //��������
void Send_TO_PC(void);						//������������λ���۲�
void IF_Start_Control(void);			   //IF����
void Postion_To_Zero_Double(void);        //���ε���
void J_Scope_Write(void);					//J_Scope����д��
float  Get_Postion (int mode ) ;
float  Get_Speed ( int32_t Timecnt ,int mode) ;   


#endif

