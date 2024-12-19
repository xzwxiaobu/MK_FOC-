#ifndef __SVPWM_H
#define __SVPWM_H

//#include "stm32f405xx.h"
//#include "delay.h"
//#include "tim.h"
#include "Motor.h"

/* 按照公式计算Tx+Ty可能会大于Ts,所以需要对实际的Tx和Ty进行修正 */
#define MODIFY_TX_TY(x,y,z,s) {z=x+y; if(x+y>s){x=x/z*s;y=y/z*s;}}

typedef struct 	{
    float  Ualpha; 				    //二相静止坐标系alpha-轴
    float  Ubeta;					//二相静止坐标系beta-轴
    float  Ta;						//三相矢量占空比Ta
    float  Tb;						//三相矢量占空比Tb
    float  Tc;						//三相矢量占空比Tc
    float  u1;						//三相静止坐标系的电压temp1
    float  u2;						//三相静止坐标系的电压temp2
    float  u3;						//三相静止坐标系的电压temp3
    float  T0;						//零矢量作用时间
    uint8_t VecSector;	 	        //矢量空间扇区号 
} SVPWM, *M_SVPWM ;

#define SVPWM_DEFAULTS  {0,0,0,0,0,0,0,0,0,0}  // 初始SVPWM化参数


extern  SVPWM        SVPWM_dq;

void SVPWM_Cale(M_SVPWM	pv);

#endif

