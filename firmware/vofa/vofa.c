
#include "definitions.h"
#include "Motor.h"
#include <string.h>
#include <math.h>
#include "FOC_Control.h"
FloatToChar fc; 

static volatile uint16_t Vred ,Vgreen,Vblue;
static volatile int step;
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
                        Vred =(uint16_t)(fc.f_data) ;   
                        OCMP4_CompareSecondaryValueSet (Vred);
                    //                       GPIO_RA14_Toggle();
                    }

                     if(rxBuffer[1]==0xa1)
                    {
                        Vgreen =(uint16_t)(fc.f_data) ;   
                        OCMP2_CompareSecondaryValueSet ( Vgreen); 
                    //                       GPIO_RA14_Toggle();
                    }

                    if(rxBuffer[1]==0xa2)
                   {
                      Vblue =(uint16_t)(fc.f_data) ; 
                      OCMP3_CompareSecondaryValueSet ( Vblue); 
                   //                       GPIO_RA14_Toggle();
                   }
                    
                    if(rxBuffer[1]==0xa3)
                     {
                        step=(int)(fc.f_data) ; 
                        RGB_ledControl(step) ;
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
         static float Wxxx=-10.0f ;
         Wxxx =Wxxx+0.5;
         
         if(Wxxx>10.0f)
         {
          Wxxx =-10.0f ;
         }
         
         
         
        
        static int errcnt=0 ;
        static float num[10]={0};
//        num[0]= ADC_Sample_Para.PhaseV_Curr ;
//        num[1]= ADC_Sample_Para.PhaseW_Curr ;
        num[2]= adc_count1 ;
        num[3]= adc_count0 ;
//        num[2]= CLARKE_ICurr.Iu ;
//        num[3]=adc_count14 ;
//        num[4]=ADC_Sample_F_Para.VBUS  ;
//        num[5]= NTC_Temp ;
//        num[6]= IF_Theta;
//        num[7]=adc_count1;
//        num[8]=adc_count0 ;
//        num[0]=2*(Sigmoid(Wxxx)-0.5) ; 
        
        if(  num[0]<0 ||  num[0]>1)
        {
          errcnt ++;
        
        }
        
//         num[2]= PARK_PCurr.Theta  ; 
//         num[3]= IPARK_PVdq.Theta; 
//         num[2]=tanf(xxx); 
//         num[3]=  Wxxx /(1+my_abs(Wxxx)) ;
//         num[4]= Sat(Wxxx,1.0f) ;
//         num[5]= Wxxx / sqrtf(1+Wxxx*Wxxx);
//         
//         num[6]= 2/M_PI*(atanf((M_PI/2)*Wxxx) );
         
            num[4]= IF_Theta   ;
            num[5]= CLARKE_ICurr.Iv ;
            num[6]= CLARKE_ICurr.Iw;

         
         num[7]= NTC_Temp;
         num[8]= ADC_Sample_F_Para.VBUS;
         
           num[0]= PARK_PCurr.Ds ;      //Get_Postion(1);
           num[1]= PARK_PCurr.Qs ;
         
//            int32_t v , p;
//            float_t  vv ,pp;
//            v= (int32_t) (VEL1CNT) ;
//            p= (int32_t) (POS1CNT) ;
//            vv =(float_t) v;
//            pp =(float_t) p;
//          num[0]= vv ;
////          num[1]= pp ;
          
        
        static  unsigned char txBuf[4*VOFAnum+4]={0};   // N*4+4
        txBuf[4*VOFAnum]=0x00;//??
        txBuf[4*VOFAnum+1]=0x00;
        txBuf[4*VOFAnum+2]=0x80;
        txBuf[4*VOFAnum+3]=0x7f;

        memcpy(txBuf,(unsigned char *)num,VOFAnum*sizeof(float));   // ????????  3?float 
        UART6_Write((uint8_t*)txBuf,   (VOFAnum+1)*sizeof(float));


}


void  RGB_ledControl( int MODE) // {MODE =1  红色  ;  2 =蓝色   3=绿色   4 =黄色  5=紫色   6=白色  7= 青色  8=橘黄色  9=黄绿色  10 =天空蓝
{
    if(MODE==1)
        {
                OCMP4_CompareSecondaryValueSet (30000);
                OCMP2_CompareSecondaryValueSet (0);
                OCMP3_CompareSecondaryValueSet (0);
        }
    else if(MODE==2)
        {
                OCMP4_CompareSecondaryValueSet (0);
                OCMP2_CompareSecondaryValueSet (0);
                OCMP3_CompareSecondaryValueSet (30000);
        }   
    else if(MODE==3)
        {
                OCMP4_CompareSecondaryValueSet (0);
                OCMP2_CompareSecondaryValueSet (30000);
                OCMP3_CompareSecondaryValueSet (0);
        }
    else if(MODE==4)
      {
              OCMP4_CompareSecondaryValueSet (30000);
              OCMP2_CompareSecondaryValueSet (8888);
              OCMP3_CompareSecondaryValueSet (0);
      }    
    else if(MODE==5)
      {
              OCMP4_CompareSecondaryValueSet (18888);
              OCMP2_CompareSecondaryValueSet (3000);
              OCMP3_CompareSecondaryValueSet (28888);
      }    
  
    else if(MODE==6)
        {
               OCMP4_CompareSecondaryValueSet (30000);
               OCMP2_CompareSecondaryValueSet (30000);
               OCMP3_CompareSecondaryValueSet (30000);
        }
    
    else if(MODE==7)
        {
               OCMP4_CompareSecondaryValueSet (0);
               OCMP2_CompareSecondaryValueSet (30000);
               OCMP3_CompareSecondaryValueSet (30000);
        }
    else if(MODE==8)
        {
           OCMP4_CompareSecondaryValueSet (30000);
           OCMP2_CompareSecondaryValueSet (4888);
           OCMP3_CompareSecondaryValueSet (0);
        }

    else if(MODE==9)
        {
           OCMP4_CompareSecondaryValueSet (15000);
           OCMP2_CompareSecondaryValueSet (15000);
           OCMP3_CompareSecondaryValueSet (0);
        }
    else if(MODE==10)
        {
           OCMP4_CompareSecondaryValueSet (0);
           OCMP2_CompareSecondaryValueSet (15000);
           OCMP3_CompareSecondaryValueSet (15000);
        }
    else 
        {
            OCMP4_CompareSecondaryValueSet (0);
            OCMP2_CompareSecondaryValueSet (0);
            OCMP3_CompareSecondaryValueSet (0);
        }


}



