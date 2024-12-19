#include "FOC_Control.h"

PI_Control   pi_spd = PI_Control_DEFAULTS;
PI_Control   pi_id = PI_Control_DEFAULTS;
PI_Control   pi_iq = PI_Control_DEFAULTS;

float  Limit_Sat( float Uint,float U_max, float U_min) //限制赋值函数
{
    float Uout;

    if(Uint <= U_min)
        Uout = U_min;
    else if(Uint >= U_max)
        Uout = U_max;
    else
        Uout = Uint;
    return  Uout;
}

//增量式pid
void  PI_Controller(M_PI_Control  pv)
{
    /* proportional term */
    pv->err = pv->Ref - pv->Fbk; // 偏差计算

    pv->Up = pv->Kp * pv->err;

    pv->Ui = Limit_Sat(pv->Ui +(pv->Ki * pv->Up), pv->Umax, pv->Umin);
    /* integral term */
    pv->Out = Limit_Sat(pv->Up +pv->Ui, pv->Umax, pv->Umin); // 限制PI输出，超出最大值

//		pv->Ui +=  pv->Ki * pv->Up + pv->Out - (pv->Up + pv->Ui);->Out, pv->Umax, pv->Umin); // 限制PI输出，超出最大值
}

void  PI_Pare_init(void )
{
    pi_spd.Kp = 0.0013f;
    pi_spd.Ki = 0.12f;                // 0.0001*10 / 0.2   T*SpeedLoopPrescaler/0.2
    pi_spd.Umax =  PI_MAX_Spd;  	  //  电流 10
    pi_spd.Umin = -PI_MAX_Spd;  	 //-10

    pi_id.Kp = Motor.Ls * BWc_rps;   //1000*26e-6ff 0.026
    pi_id.Ki = Motor.Rs / Motor.Ls * TS;//0.045/2.6e-6/20000 0.086
    pi_id.Umax =  PI_MAX_Ud;
    pi_id.Umin = -PI_MAX_Ud;

    pi_iq.Kp = Motor.Ls * BWc_rps;;
    pi_iq.Ki = Motor.Rs / Motor.Ls * TS;
    pi_iq.Umax =  PI_MAX_Uq;
    pi_iq.Umin = -PI_MAX_Uq;  //-PI_MAX_Uq
}

