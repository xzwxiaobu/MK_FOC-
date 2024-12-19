/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include"newfile.h"
//#include  "dsp.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include "FOC_Control.h"


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************



float input_voltage;
/* Save PWM period */
uint16_t period;

volatile  static  int result[3];
      

  volatile static uint32_t  Postion ;
  volatile static uint32_t  Speed;
  static volatile  int kk =00;
   volatile bool Init_Over ;
  int32_t j;
 #define DUTY_INCREMENT (15U)
/* This function is called after PWM0 counter event */
void PWM_PeriodHandler(uint32_t status, uintptr_t context)  // ??????? ?? 20k
{   
    
    /* duty cycle values */
    static uint16_t duty0 = 0U;

    /* Increment duty cycle values */
    static bool up=true;
    if(j%20== 0 )
    {
   
        if(up==true){
           OCMP4_CompareSecondaryValueSet (duty0); 
            duty0 += DUTY_INCREMENT;
            if(duty0>25000)
            {
             up=false;
            }
        }
        
         if(up==false){
        OCMP4_CompareSecondaryValueSet (duty0); 
            duty0 -= DUTY_INCREMENT;
            if(duty0==0)
            {
             up=true;
            }
        }
            
     }

    j++;
       if(j== 30000)
        {

               j=0;
              
        }

 
}
 

void QEI1PeriodHandler(QEI_STATUS status, uintptr_t context)
{

//   POS1CNT =0;
//   Postion =0 ;
  
}

static volatile uint16_t capturedValue[2];
static volatile uint16_t xw;
static volatile uint8_t captureIndex = 0;
static volatile uint8_t xzweIndex = 0;
// bool volatile  ic1;
static volatile  bool ic3=false;
void INPUT_CAPTURE_XZW(uintptr_t context)
{    
      uint32_t nBytes = 0;    
      ICAP3_CaptureBufferRead();
      ICAP4_CaptureBufferRead();  
      ICAP5_CaptureBufferRead();
      capturedValue[captureIndex++] = getSysTick();
      
 
      xzweIndex++;
      xw =getSysTick();
 
        static volatile  uint32_t    ticOld5;  
        static volatile  uint32_t    tickNow5;  
        tickNow5=xw;
      
      if(xzweIndex >=1)
      {
               xzweIndex =0 ;
//               nBytes = sprintf((char*)txBuffer, "\r\nxzwPulse Width Count = %dms \r\n" ,( uint32_t) tickNow5-ticOld5);
//               UART6_Write((uint8_t*)txBuffer,   nBytes);
//           printf("xzwPulse Width Count = %d\r\n",(capturedValue[1] - capturedValue[0]));
      
        ticOld5 = tickNow5;
      }
      
  
         {   
      
        if ( captureIndex > 1){
            
//             nBytes = sprintf((char*)txBuffer, "Pulse Width Count = %d\r\n" , (capturedValue[1] - capturedValue[0]) );
//             UART6_Write((uint8_t*)txBuffer,   nBytes);
            
            captureIndex = 0;
            }
        
        
        
        }               
     ic3=true;
}


#define KEY1_PRES		1
#define KEY2_PRES		2
#define	KEY3_PRES		3
#define KEY4_PRES		4

void check_key_xzwFoc_Mode(void)
{
   
}
        #define NUM_OF_SAMPLES (100)

 const uint16_t sine_wave[NUM_OF_SAMPLES] = {
        0x800, 0x840, 0x880, 0x8C0, 0x8FF, 0x93C, 0x979, 0x9B4, 0x9ED, 0xA25,
        0xA5A, 0xA8D, 0xABD, 0xAEA, 0xB15, 0xB3C, 0xB61, 0xB81, 0xB9F, 0xBB8,
        0xBCE, 0xBE0, 0xBEE, 0xBF8, 0xBFE, 0xC00, 0xBFE, 0xBF8, 0xBEE, 0xBE0,
        0xBCE, 0xBB8, 0xB9F, 0xB81, 0xB61, 0xB3C, 0xB15, 0xAEA, 0xABD, 0xA8D,
        0xA5A, 0xA25, 0x9ED, 0x9B4, 0x979, 0x93C, 0x8FF, 0x8C0, 0x880, 0x840,
        0x800, 0x7C0, 0x780, 0x740, 0x701, 0x6C4, 0x687, 0x64C, 0x613, 0x5DB,
        0x5A6, 0x573, 0x543, 0x516, 0x4EB, 0x4C4, 0x49F, 0x47F, 0x461, 0x448,
        0x432, 0x420, 0x412, 0x408, 0x402, 0x400, 0x402, 0x408, 0x412, 0x420,
        0x432, 0x448, 0x461, 0x47F, 0x49F, 0x4C4, 0x4EB, 0x516, 0x543, 0x573,
        0x5A6, 0x5DB, 0x613, 0x64C, 0x687, 0x6C4, 0x701, 0x740, 0x780, 0x7C0
};



int main ( void )
{
    uint32_t nBytes = 0;    
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    
    EVIC_INT_Disable();
  
    
    TMR2_Start();                                        // xzw  ??0.5ms??   ?oc???? 
    TMR3_CallbackRegister( Time3 , (uintptr_t) NULL);    // xzw  ??????    1ms
    TMR3_Start();
    

    /* Active low output */
    OCMP4_Enable();                                     //  30000??? ??? 500????? 
    /* Active high output */
    OCMP2_Enable();
    /* toggled output */
    OCMP3_Enable();
 
//   QEI1_CallbackRegister(QEI1PeriodHandler, (uintptr_t)NULL) ;
     QEI1_Start()  ;    
  
//    /* 输出 比较 time2   30000 最大值*/
    OCMP4_CompareSecondaryValueSet (27000);     //Ra7       30000max
    OCMP2_CompareSecondaryValueSet (6000);     //RB1         600020
    OCMP3_CompareSecondaryValueSet (1800);     //Rd3
    
//    ICAP3_Enable(); 
//    ICAP4_Enable();
//    ICAP5_Enable();
//    ICAP3_CallbackRegister (INPUT_CAPTURE_XZW ,(uintptr_t)NULL);          //ra12 ic3 
//    ICAP4_CallbackRegister (INPUT_CAPTURE_XZW ,(uintptr_t)NULL);       //ra11  ic4
//    ICAP5_CallbackRegister (INPUT_CAPTURE_XZW ,(uintptr_t)NULL);      //rb2 -ic5
    
     
//    MCPWM_CallbackRegister(MCPWM_CH_1, PWM_PeriodHandler, (uintptr_t)NULL);   //  xzw ?????? ?? ??     
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, 0);         // b15  1L ??? down       B14  1h  ??? up
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_2, 0);         // b13  2L                B12  2h
    MCPWM_ChannelPrimaryDutySet(MCPWM_CH_3, 0);        //  B11  3L                b10  3H
    MCPWM_Start();


    ADCHS_CallbackRegister(ADCHS_CH0, ADC_ResultHandler, (uintptr_t)NULL);    //A0
//    ADCHS_CallbackRegister(ADCHS_CH1, ADC_ResultHandler1, (uintptr_t)NULL);   //A1

     /* Register a callback for write events */
    UART6_WriteCallbackRegister(usartWriteEventHandler, (uintptr_t) NULL);    //ra4 tx  ra15rx
    /* Register a callback for read events */
    UART6_ReadCallbackRegister(usartReadEventHandler, (uintptr_t) NULL);              
    
    UART6_WriteThresholdSet(UART6_WriteBufferSizeGet());   
    /* Enable notifications */
    UART6_WriteNotificationEnable(true, false);
        
    /* For demonstration purpose, set a threshold value to receive a callback after every 5 characters are received */
    UART6_ReadThresholdSet(7);  // 收到 7个字符 中断回调  
    /* Enable RX event notifications */
    UART6_ReadNotificationEnable(true, false);
        
   
#if 0
    GPIO_RA14_Clear();
    EEPROM_OPERATION_STATE state = EEPROM_OPERATION_WORD_WRITE_READ_CMP;
    /* Read the data from EEPROM */
    APP_EepromWordRead(APP_EEPROM_ADDRESS);

    /* Verify the programmed data */
  if( memcmp( writeData, readData, sizeof( writeData )) ==0)
    {
                                                   
    }
   else
   {
            /* Bulk erase EEPROM */
            EEPROM_BulkErase();
            while ( EEPROM_IsBusy() == true );    //17ms 

            /* Read the data from EEPROM */
            APP_EepromWordRead(APP_EEPROM_ADDRESS);

            /* Fill the writeData with 0xFFFFFFFF */
            memset(&writeData, 0xFFFFFFFF, sizeof(writeData));  

            if ( memcmp( writeData, readData, sizeof( writeData ) )==0 )
            {
                
                APP_EepromWordWrite(APP_EEPROM_ADDRESS);  //7ms

                /* Read the data from EEPROM */
                APP_EepromWordRead(APP_EEPROM_ADDRESS);
                
                
                 if ( memcmp( writeData, readData, sizeof( writeData ) )==0 )
                   {
                      state = EEPROM_OPERATION_SUCCESS; 
                      GPIO_RA14_Set()  ;
                    }
                
                 else
                 {
                     state = EEPROM_OPERATION_ERROR;
                     GPIO_RA14_Clear();
                 
                 
                 }
              
            }
            else
            {
                state = EEPROM_OPERATION_ERROR;
                GPIO_RA14_Clear();
            }

    }
    
  #endif  
    EVIC_INT_Enable();
    /* adc  漂零矫正 */
    ADC_Sample_Offset();							//????
    Motor_Init() ;
    M_STOP(); 
    Init_Over=1 ;
    WDT_Enable( );
    volatile static  uint8_t sample_number = 0 ;
    while ( true )
    {  
        /* 8192ms  没有喂狗 软件复位 xzw*/
        WDT_Clear();
        
        /*500ms   RB0作为主程序的 指示灯 指示主程序mainloop不卡死 */
        static volatile  uint32_t    ticOld;  
        static volatile  uint32_t    tickNow;  
        tickNow =  getSysTick(); 
        static volatile  bool    tickflag;
        if((int32_t)(tickNow - ticOld) >= 500)  		
        { 	
            ticOld= tickNow;
            tickflag=!tickflag ;
            GPIO_RB0_Toggle();
            temp_trans(ADC_Sample_F_Para.Temperature, &NTC_Temp);		
        
        }    
        
//        if(tickflag!=0)
        {
            
           CDAC2_DataWrite(adc_count0);
           CDAC3_DataWrite(adc_count1);
//                     CDAC3_DataWrite(4095);   //A8
//                     CDAC2_DataWrite(2048);   //c10
            sample_number++;

            if (sample_number >= 100)
            {
               sample_number = 0;
            }
        
        }
//        else
//        {
////           CDAC2_DataWrite(0);
////           CDAC3_DataWrite(0);
//        
//        }


        
        /*200ms QEI  验证无误xzw  */
        static volatile  uint32_t    ticOld1;  
        static volatile  uint32_t    tickNow1;  
        tickNow1 =  getSysTick(); 
        if((int32_t)(tickNow1 - ticOld1) >= 500)   
        { 	
            ticOld1 = tickNow1;
            int32_t v , p;
            float_t  vv ,pp;
            v= (int32_t) (VEL1CNT) ;
            p= (int32_t) (POS1CNT) ;
            vv =(float_t) v;
            pp =(float_t) p;
//         

//             nBytes = sprintf((char*)txBuffer, "\r\n Postion =  %f rpm\r\n" "\r\n Speed =%f rad/s\r\n", pp/4000,(vv)/4000*2*M_PI*2 );
//             UART6_Write((uint8_t*)txBuffer,   nBytes);
////   
//             nBytes = sprintf((char*)txBuffer, "\r\n ADC0 =  %d\r\n" "\r\n ADC1 =  %d\r\n" , adc_count11  , adc_count21);
//             UART6_Write((uint8_t*)txBuffer,   nBytes);
//           
//             nBytes = sprintf((char*)txBuffer, "\r\n ADC11 =  %d\r\n" "\r\n ADC12 =  %d\r\n" "\r\n ADC15 =  %d\r\n",  adc_count11 , adc_count12,adc_count15);
//             UART6_Write((uint8_t*)txBuffer,   nBytes);
//          
//
//             nBytes = sprintf((char*)txBuffer, "\r\n TEMP=  %f\r\n"  "\r\n VBUS=  %f\r\n",  NTC_Temp ,ADC_Sample_F_Para.VBUS );
//             UART6_Write((uint8_t*)txBuffer,   nBytes);
             
  
          }   
       
       /* VOFA+ 显示数据  xzw */
        static volatile  uint32_t    ticOld2;  
        static volatile  uint32_t    tickNow2;  
        tickNow2 =  getSysTick(); 

       
        #define ictime 100
        if((int32_t)(tickNow2 - ticOld2) >= ictime)  	  //20k=50微秒   1ms 20次 
        { 	
            ticOld2 = tickNow2;	
//            XzwVfGet(); //??????????

        }    

       
           /* vofa+ 解析上位机数据*/
//          XzwVfsend(); // 解析 vofa 上传的数据 
          
          
        /* 使能 xzw  run   stop foc*/  
        GPIO_RC1_InputEnable();
        static volatile  uint32_t  WW ;
        WW = GPIO_RC1_Get() ;
        static volatile int runoncetime  ;
        if(1)   // 使能  run  GPIO_RC1_Get()==0
        {     
             runoncetime++;
             if(runoncetime ==5)
             {  

                M_RUN() ;  // 检测一次 使能一次mcpwm 
                Motor.M_State=2;
             }

        }
        else
        {
//           M_STOP();      // 禁止mcpwm  把占空比 调制为0 ，清空相关 控制变量    
           runoncetime =0; 
        }
       
        
       
        
        GPIO_RC2_InputEnable();
        static volatile  uint32_t  spp ;
         spp= GPIO_RC2_Get() ;
        static volatile int stoponcetime  ;
        if(GPIO_RC2_Get()==0)   // 使能  run 
        {     
             stoponcetime++;
             if(stoponcetime ==5)
             {
                   M_STOP() ;  // 检测一次 使能一次mcpwm 
                   Motor.M_State=0;
             }

        }
        else
        {
//           M_STOP();      // 禁止mcpwm  把占空比 调制为0 ，清空相关 控制变量    
           stoponcetime =0; 
        }
        

//        IIC1_HANDLE();
          
          
    }         
       
               
          
               
 
    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/
