#ifndef __PI_CALE_H
#define __PI_CALE_H

#include "FOC_Control.h"

typedef struct {
    float  Ref;   // PI���Ƶĸ�������
    float  Fbk;   // PI���Ƶķ�������
    float  Out;   // PI���Ƶ��������
    float  OutF;  // PI���Ƶ��˲����������
    float  Kp;    // PI���Ƶı�������
    float  Ki;    // PI���ƵĻ��ֲ���
    float  Umax;  // PI���Ƶ������������ֵ����
    float  Umin;  // PI���Ƶ����������С��ֵ����
    float  err;   // PI���Ƶ����
    float  err_l; // PI���Ƶ���һ�����
	float  Up;		// ��������ֵ
    float  Ui;		// ���ּ���ֵ
} PI_Control, *M_PI_Control ;

#define PI_Control_DEFAULTS {0,0,0,0,0,0,0,0,0,0,0,0} // PI��ʼ������

extern  PI_Control   pi_spd ;
extern  PI_Control   pi_id ;
extern  PI_Control   pi_iq ;

void  PI_Controller(M_PI_Control  pv);  //PI�����㷨����
void  PI_Pare_init(void );    //PI���Ʋ�����ʼ��
float  Limit_Sat( float Uint,float U_max, float U_min); //���Ƹ�ֵ����
#endif

