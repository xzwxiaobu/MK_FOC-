
#include  "FOC_Control.h"
#include  "definitions.h"
#include "Motor.h"                // SYS function prototypes


float  Get_Postion (void )     // ע�ⵥλ rpm       �����ϵ��ʼλ��λ��xzw   rpm��ʽ ���� rad ��ʽ 
{
    
     int32_t  p;
     float_t  pp ,ppp, epp;
     int32_t enconder ;
     
     enconder = Encoder_lines ;
     p= (int32_t) (POS1CNT) ;
     
     pp =p / enconder ;               //pp  Ϊrpm Ȧ
     ppp = pp*PIX2 ;                 // ppp Ϊ����  
     epp  = ppp*Motor.P ;
     
     return  epp  ;                  // X�������ʼλ��   PIC32MK qei ��֤

}



float  Get_Speed ( int32_t Timecnt )     //  ����
{
    
    int32_t v ;
    float_t  vv, vv1 ,vv2,evv1 ,evv2;
    int32_t enconder ;

    enconder = Encoder_lines ;
 
    
    
    static volatile  uint32_t    SpticOld;  
    static volatile  uint32_t    SptickNow;  
    SptickNow =  getSysTick(); 
     
    if((int32_t)(SptickNow - SpticOld) >= Timecnt)   
    { 
        
         v= (int32_t) (VEL1CNT) ;
         vv =(float_t) v;
         vv1=  (vv)/enconder*PIX2*(1000/Timecnt)  ;       //  ��λ��rad/s       ��е�ٶ�
         vv2 = (vv)/enconder*(1000/Timecnt)*60 ;          //  ��λ��rpm/min     ��е�ٶ�
         evv1= vv1*Motor.P   ;                           //  ��λ��rad/s      ��е�ٶ�
         evv2 =vv2*Motor.P   ;                          //  ��λ��rpm/min     ��е�ٶ�
         
       
         
         SpticOld = SptickNow ;
    }
     
     
     
     return  vv2  ;                                  // X�������ʼλ��   PIC32MK qei ��֤

}



