
#include "definitions.h"
#include "Motor.h"
#include <string.h>
#include <math.h>
#include "FOC_Control.h"
FloatToChar fc; 

void XzwVfsend(void)
{
     
        if (nBytesReadxzw>=Vofa_GetByte)
        {
              memcpy(&fc.c_data,&rxBuffer[2] , 4);	
//              UART6_Write((uint8_t*)rxBuffer, nBytesReadxzw);
             
              
              if((rxBuffer[0]==0x55)&&(rxBuffer[6]==0xaa))
              {
                  if(rxBuffer[1]==0xa0)
                  {
                      Motor.M_State =fc.f_data ;   
//                       GPIO_RA14_Toggle();
                  }
                               
              
              }
              else
              {
                  memset(rxBuffer, 0, Vofa_GetByte); 
              }
              nBytesReadxzw =0;
        }     
        
   

}


#define VOFAnum   10
void XzwVfGet( void)
{
//        static volatile float pi =0 ;
//        static float the,this,that;
//        
//        if(pi>=2*M_PI)
//        {
//            pi=0;
//        
//        }
//        else
//        {
//            pi+=0.3;
//        }
//        
//        
//        
//        the = sinf(pi) ;
//        this = cosf(pi) ;
//        that =sinf(pi+M_PI);
         static float xxx=-10.0f ;
         xxx =xxx+0.5;
         
         if(xxx>10.0f)
         {
          xxx =-10.0f ;
         }
         
         
         
        
        static int errcnt=0 ;
        static float num[10]={0};
//        num[0]= ADC_Sample_Para.PhaseV_Curr ;
//        num[1]= ADC_Sample_Para.PhaseW_Curr ;
//        num[2]= CLARKE_ICurr.Iu ;
//        num[3]=adc_count14 ;
//        num[4]=ADC_Sample_F_Para.VBUS  ;
//        num[5]= NTC_Temp ;
//        num[6]= IF_Theta;
//        num[7]=adc_count1;
//        num[8]=adc_count0 ;
        num[0]=2*(Sigmoid(xxx)-0.5) ; 
        
        if(  num[0]<0 ||  num[0]>1)
        {
          errcnt ++;
        
        }
        
         num[1]=adc_count0  ; 
         
//         num[2]=tanf(xxx); 
         num[3]=  xxx /(1+my_abs(xxx)) ;
         num[4]= Sat(xxx,1.0f) ;
         num[5]= xxx / sqrtf(1+xxx*xxx);
         
         num[6]= 2/M_PI*(atanf((M_PI/2)*xxx) );
         
         
         
        static  unsigned char txBuf[4*VOFAnum+4]={0};   // N*4+4
        txBuf[4*VOFAnum]=0x00;//??
        txBuf[4*VOFAnum+1]=0x00;
        txBuf[4*VOFAnum+2]=0x80;
        txBuf[4*VOFAnum+3]=0x7f;

        memcpy(txBuf,(unsigned char *)num,VOFAnum*sizeof(float));   // ????????  3?float 
        UART6_Write((uint8_t*)txBuf,   (VOFAnum+1)*sizeof(float));


}







