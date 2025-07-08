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
#define Encoder_lines	4*4         //  4对级的hall  应该霍尔 一个机械周期 5次 *2 跳变  两个霍尔 *2   // 4*1000 是编码器
//#define Encoder_Pulse	16384			//Encoder_lines*4
//#define TIM3_Pulse		16384			//???3????


//extern  static  volatile float IF_Theta ;


typedef struct
{ 
    float  XieLv_X;     // 指令参数斜率输入变量x
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

extern uint8_t 					Fault_Code;			//故障代码
extern uint8_t 					Cal_time;
extern volatile uint8_t	     	Speed_Cal_time;
extern volatile float 		   IF_Theta;
//extern bool 				    Observe_Switch_flag;
extern volatile  bool                  Init_Over  ;

void Grad_XieLv(p_GXieLv pv);			//梯度加减
void Position_To_Zero(void);			//电机归零
void Fault_Detection(void);			//故障检测
void M_STOP(void);						//电机停止
void M_RUN(void);					   //电机启动
void UVW_Axis_dq(void);						//坐标轴变换
void Speed_Closeloop(void);				//速度&电流闭环
void FOC_Svpwm_dq(void);					//SVPM计算
void QT_Motor(void);							//强制拖动
void FOC_Control_Selected(void);	            //控制模式选择
void Control_Mode_CmdPara(void);               // 控制模式运行
void Variable_Clear(void);				      //变量清零
void Send_TO_PC(void);						//发送数据至上位机观测
void IF_Start_Control(void);			   //IF启动
void Postion_To_Zero_Double(void);        //二次调零
void J_Scope_Write(void);					//J_Scope数据写入
float  Get_Postion (int mode ) ;
float  Get_Speed ( int32_t Timecnt ,int mode) ;   


#endif

