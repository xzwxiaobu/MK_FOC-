
#include  "FOC_Control.h"
#include  "definitions.h"
#include "Motor.h"                // SYS function prototypes


float  Get_Postion (void )     // 注意单位 rpm       这是上电初始位置位置xzw   rpm方式 或者 rad 方式 
{
    
     int32_t  p;
     float_t  pp ,ppp, epp;
     int32_t enconder ;
     
     enconder = Encoder_lines ;
     p= (int32_t) (POS1CNT) ;
     
     pp =p / enconder ;               //pp  为rpm 圈
     ppp = pp*PIX2 ;                 // ppp 为弧度  
     epp  = ppp*Motor.P ;
     
     return  epp  ;                  // X相对于起始位置   PIC32MK qei 验证

}



float  Get_Speed ( int32_t Timecnt )     //  放在
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
         vv1=  (vv)/enconder*PIX2*(1000/Timecnt)  ;       //  单位是rad/s       机械速度
         vv2 = (vv)/enconder*(1000/Timecnt)*60 ;          //  单位是rpm/min     机械速度
         evv1= vv1*Motor.P   ;                           //  单位是rad/s      机械速度
         evv2 =vv2*Motor.P   ;                          //  单位是rpm/min     机械速度
         
       
         
         SpticOld = SptickNow ;
    }
     
     
     
     return  vv2  ;                                  // X相对于起始位置   PIC32MK qei 验证

}



