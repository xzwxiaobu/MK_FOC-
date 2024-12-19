#ifndef __PI_CALE_H
#define __PI_CALE_H

#include "FOC_Control.h"

typedef struct {
    float  Ref;   // PI控制的给定参数
    float  Fbk;   // PI控制的反馈参数
    float  Out;   // PI控制的输出参数
    float  OutF;  // PI控制的滤波后输出参数
    float  Kp;    // PI控制的比例参数
    float  Ki;    // PI控制的积分参数
    float  Umax;  // PI控制的输出限制最大幅值参数
    float  Umin;  // PI控制的输出限制最小幅值参数
    float  err;   // PI控制的误差
    float  err_l; // PI控制的上一次误差
	float  Up;		// 比例计算值
    float  Ui;		// 积分计算值
} PI_Control, *M_PI_Control ;

#define PI_Control_DEFAULTS {0,0,0,0,0,0,0,0,0,0,0,0} // PI初始化参数

extern  PI_Control   pi_spd ;
extern  PI_Control   pi_id ;
extern  PI_Control   pi_iq ;

void  PI_Controller(M_PI_Control  pv);  //PI控制算法函数
void  PI_Pare_init(void );    //PI控制参数初始化
float  Limit_Sat( float Uint,float U_max, float U_min); //限制赋值函数
#endif

