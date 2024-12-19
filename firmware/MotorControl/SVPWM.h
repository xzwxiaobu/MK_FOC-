#ifndef __SVPWM_H
#define __SVPWM_H

//#include "stm32f405xx.h"
//#include "delay.h"
//#include "tim.h"
#include "Motor.h"

/* ���չ�ʽ����Tx+Ty���ܻ����Ts,������Ҫ��ʵ�ʵ�Tx��Ty�������� */
#define MODIFY_TX_TY(x,y,z,s) {z=x+y; if(x+y>s){x=x/z*s;y=y/z*s;}}

typedef struct 	{
    float  Ualpha; 				    //���ྲֹ����ϵalpha-��
    float  Ubeta;					//���ྲֹ����ϵbeta-��
    float  Ta;						//����ʸ��ռ�ձ�Ta
    float  Tb;						//����ʸ��ռ�ձ�Tb
    float  Tc;						//����ʸ��ռ�ձ�Tc
    float  u1;						//���ྲֹ����ϵ�ĵ�ѹtemp1
    float  u2;						//���ྲֹ����ϵ�ĵ�ѹtemp2
    float  u3;						//���ྲֹ����ϵ�ĵ�ѹtemp3
    float  T0;						//��ʸ������ʱ��
    uint8_t VecSector;	 	        //ʸ���ռ������� 
} SVPWM, *M_SVPWM ;

#define SVPWM_DEFAULTS  {0,0,0,0,0,0,0,0,0,0}  // ��ʼSVPWM������


extern  SVPWM        SVPWM_dq;

void SVPWM_Cale(M_SVPWM	pv);

#endif

