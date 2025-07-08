/*******************************************************************************
  ADCHS Peripheral Library Interface Source File

  Company
    Microchip Technology Inc.

  File Name
    plib_adchs.c

  Summary
    ADCHS peripheral library source.

  Description
    This file implements the ADCHS peripheral library.

*******************************************************************************/

// DOM-IGNORE-BEGIN
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
// DOM-IGNORE-END
#include "device.h"
#include "plib_adchs.h"
#include "definitions.h"                // SYS function prototypes
#include "math.h" 
#include "FOC_Control.h"


#define ADCHS_CHANNEL_32  (32U)

// *****************************************************************************
// *****************************************************************************
// Section: ADCHS Implementation
// *****************************************************************************
// *****************************************************************************

/* Object to hold callback function and context */
ADCHS_CALLBACK_OBJECT ADCHS_CallbackObj[53];



void ADCHS_Initialize()
{
# if 1
    ADCCON1bits.ON = 0;
    ADC0CFG = DEVADC0;
    ADC0TIME = 0x3020001;
    ADC1CFG = DEVADC1;
    ADC1TIME = 0x3020001;
    ADC7CFG = DEVADC7;


     ADCCON1 = 0x600000;  // 
     ADCCON2 = 0x20001;
     ADCCON3 = 0x1000000;

     ADCTRGMODE = 0x0;
//     ADCTRGMODE = 0x2030000;
//     ADCCON1bits.STRGSRC


    ADCTRG1 = 0xa0a;         // adc0?adc1 ??? 
    ADCTRG2 = 0x0;    
    ADCTRG3 = 0xa000000;       // an11   c11
    ADCTRG4 = 0xa0a0a0a;       // an15  e12- 15
    
//    ADCTRG3bits.TRGSRC11 = 0b01010;       // an11 ac11 
//    ADCTRG4bits.TRGSRC12 = 0b01010;     
//    ADCTRG4bits.TRGSRC13 = 0b01010; 
//    ADCTRG4bits.TRGSRC14 = 0b01010; 
    ADCTRG5 = 0xa00000a;   //  an16  g9    an 19   g6
    ADCTRG6 = 0xa0a;     //   an20   e9      an21  e8
    ADCTRG7 = 0x0; 

    ADCTRGSNS = 0x0;

    ADCIMCON1 = 0x0;
    ADCIMCON2 = 0x0; 
    ADCIMCON3 = 0x0; 
    ADCIMCON4 = 0x0; 

    /* Input scan */
    ADCCSS1 = 0; // Clear all bits
    ADCCSS2 = 0;



    /* Result interrupt enable */
    ADCGIRQEN1 = 0x1;
    ADCGIRQEN2 = 0x0;
    /* Interrupt Enable */
    IEC3SET = 0x400;
    IEC4SET = 0x0;



    /* Turn ON ADC */
    ADCCON1bits.ON = 1;
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage

    /* ADC 0 */
    ADCANCONbits.ANEN0 = 1;      // Enable the clock to analog bias
    while(!ADCANCONbits.WKRDY0); // Wait until ADC is ready
    ADCCON3bits.DIGEN0 = 1;      // Enable ADC

    /* ADC 1 */
    ADCANCONbits.ANEN1 = 1;      // Enable the clock to analog bias
    while(!ADCANCONbits.WKRDY1); // Wait until ADC is ready
    ADCCON3bits.DIGEN1 = 1;      // Enable ADC

        /* ADC 1 */
    ADCANCONbits.ANEN7 = 1;      // Enable the clock to analog bias
    while(!ADCANCONbits.WKRDY7); // Wait until ADC is ready
    ADCCON3bits.DIGEN7 = 1;      // Enable ADC
#endif  
  
#if 0
    
    /* Configure ADCCON1 */
ADCCON1 = 0; // No ADCCON1 features are enabled including: Stop-in-Idle, turbo,
// CVD mode, Fractional mode and scan trigger source.
ADCCON1bits.SELRES = 3; // ADC7 resolution is 12 bits
ADCCON1bits.STRGSRC = 1; // Select scan trigger.
/* Configure ADCCON2 */
ADCCON2bits.SAMC = 5; // ADC7 sampling time = 5 * TAD7
ADCCON2bits.ADCDIV = 1; // ADC7 clock freq is half of control clock = TAD7
/* Initialize warm up time register */
ADCANCON = 0;
ADCANCONbits.WKUPCLKCNT = 5; // Wakeup exponent = 32 * TADx
/* Clock setting */
ADCCON3bits.ADCSEL = 0; // Select input clock source
ADCCON3bits.CONCLKDIV = 1; // Control clock frequency is half of input clock
ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
//ADC0TIMEbits.ADCDIV = 1; // ADC0 clock frequency is half of control clock = TAD0
//ADC0TIMEbits.SAMC = 5; // ADC0 sampling time = 5 * TAD0
//ADC0TIMEbits.SELRES = 3; // ADC0 resolution is 12 bits
/* Select analog input for ADC modules, no presync trigger, not sync sampling */
ADCTRGMODEbits.SH0ALT = 0; // ADC0 = AN0
/* Select ADC input mode */
ADCIMCON2bits.SIGN23 = 0; // unsigned data format
ADCIMCON2bits.DIFF23 = 0; // Single ended mode
ADCIMCON2bits.SIGN19= 0; // unsigned data format
ADCIMCON2bits.DIFF19 = 0; // Single ended mode
//ADCIMCON1bits.SIGN40 = 0; // unsigned data format
//ADCIMCON1bits.DIFF40 = 0; // Single ended mode
/* Configure ADCGIRQENx */
ADCGIRQEN1 = 0; // No interrupts are used.
ADCGIRQEN2 = 0;
/* Configure ADCCSSx */
ADCCSS1 = 0; // Clear all bits
ADCCSS2 = 0;
//ADCCSS1bits.CSS0 = 1; // AN0 (Class 1) set for scan
//ADCCSS1bits.CSS8 = 1; // AN8 (Class 2) set for scan
ADCCSS1bits.CSS23 = 1; // AN40 (Class 3) set for scan
ADCCSS1bits.CSS19 = 1;
//ADCCSS2bits.CSS50 = 1;



/* Configure ADCCMPCONx */
ADCCMPCON1 = 0; // No digital comparators are used. Setting the ADCCMPCONx
ADCCMPCON2 = 0; // register to '0' ensures that the comparator is disabled.
ADCCMPCON3 = 0; // Other registers are ?don't care?.
ADCCMPCON4 = 0;
//ADCCMPCON5 = 0;
//ADCCMPCON6 = 0;
/* Configure ADCFLTRx */
ADCFLTR1 = 0; // No oversampling filters are used.
ADCFLTR2 = 0;
ADCFLTR3 = 0;
ADCFLTR4 = 0;
//ADCFLTR5 = 0;
//ADCFLTR6 = 0
//    
  
  /* Set up the trigger sources */
//ADCTRG1bits.TRGSRC0 = 3; // Set AN0 (Class 1) to trigger from scan source  //rg6re9
ADCTRG6bits.TRGSRC23 = 3; // Set AN8 (Class 2) to trigger from scan source
ADCTRG5bits.TRGSRC19 = 3; // Set AN8 (Class 2) to trigger from scan source


// AN40 (Class 3) always uses scan trigger source
/* Early interrupt */
ADCEIEN1 = 0; // No early interrupt
ADCEIEN2 = 0;
/* Turn the ADC on */
ADCCON1bits.ON = 1;
/* Wait for voltage reference to be stable */
//while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
/* Enable clock to analog circuit */
//ADCANCONbits.ANEN0 = 1; // Enable the clock to analog bias ADC0
ADCANCONbits.ANEN7 = 1; // Enable, ADC7
/* Wait for ADC to be ready */
//while(!ADCANCONbits.WKRDY0); // Wait until ADC0 is ready
while(!ADCANCONbits.WKRDY7); // Wait until ADC7 is ready
/* Enable the ADC module */
//ADCCON3bits.DIGEN0 = 1; // Enable ADC0
ADCCON3bits.DIGEN7 = 1; // Enable ADC7      
        
 #endif   
    
    

}


/* Enable ADCHS channels */
void ADCHS_ModulesEnable (ADCHS_MODULE_MASK moduleMask)
{
    ADCCON3 |= (moduleMask << 16);
}

/* Disable ADCHS channels */
void ADCHS_ModulesDisable (ADCHS_MODULE_MASK moduleMask)
{
    ADCCON3 &= ~(moduleMask << 16);
}


void ADCHS_ChannelResultInterruptEnable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCGIRQEN1 |= 0x01 << channel;
    }
    else
    {
        ADCGIRQEN2 |= 0x01 << (channel - 32);
    }
}

void ADCHS_ChannelResultInterruptDisable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCGIRQEN1 &= ~(0x01 << channel);
    }
    else
    {
        ADCGIRQEN2 &= ~(0x01 << (channel - 32));
    }
}

void ADCHS_ChannelEarlyInterruptEnable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCEIEN1 |= (0x01 << channel);
    }
    else
    {
        ADCEIEN2 |= (0x01 << (channel - 32));
    }
}

void ADCHS_ChannelEarlyInterruptDisable (ADCHS_CHANNEL_NUM channel)
{
    if (channel < ADCHS_CHANNEL_32)
    {
        ADCEIEN1 &= ~(0x01 << channel);
    }
    else
    {
        ADCEIEN2 &= ~(0x01 << (channel - 32));
    }
}

void ADCHS_GlobalEdgeConversionStart(void)
{
    ADCCON3bits.GSWTRG = 1;
}

void ADCHS_GlobalLevelConversionStart(void)
{
    ADCCON3bits.GLSWTRG = 1;
}

void ADCHS_GlobalLevelConversionStop(void)
{
    ADCCON3bits.GLSWTRG = 0;
}

void ADCHS_ChannelConversionStart(ADCHS_CHANNEL_NUM channel)
{
    ADCCON3bits.ADINSEL = channel;
    ADCCON3bits.RQCNVRT = 1;
}


/*Check if conversion result is available */
bool ADCHS_ChannelResultIsReady(ADCHS_CHANNEL_NUM channel)
{
    bool status = false;
    if (channel < ADCHS_CHANNEL_32)
    {
        status = (ADCDSTAT1 >> channel) & 0x01;
    }
    else
    {
        status = (ADCDSTAT2 >> (channel - 32)) & 0x01;
    }
    return status;
}

/* Read the conversion result */
uint16_t ADCHS_ChannelResultGet(ADCHS_CHANNEL_NUM channel)
{
    return (uint16_t) (*((&ADCDATA0) + (channel << 2)));

}

void ADCHS_CallbackRegister(ADCHS_CHANNEL_NUM channel, ADCHS_CALLBACK callback, uintptr_t context)
{
    ADCHS_CallbackObj[channel].callback_fn = callback;
    ADCHS_CallbackObj[channel].context = context;
}




bool ADCHS_EOSStatusGet(void)
{
    return (bool)(ADCCON2bits.EOSRDY);
}

void ADC_DATA0_InterruptHandler(void)
{
    if (ADCHS_CallbackObj[0].callback_fn != NULL)
    {
      ADCHS_CallbackObj[0].callback_fn(ADCHS_CH0, ADCHS_CallbackObj[0].context);
    }


    IFS3CLR = _IFS3_AD1D0IF_MASK;
}
void ADC_DATA1_InterruptHandler(void)
{
    if (ADCHS_CallbackObj[1].callback_fn != NULL)
    {
      ADCHS_CallbackObj[1].callback_fn(ADCHS_CH1, ADCHS_CallbackObj[1].context);
    }


    IFS3CLR = _IFS3_AD1D1IF_MASK;
}
void ADC_DATA19_InterruptHandler(void)
{
    if (ADCHS_CallbackObj[19].callback_fn != NULL)
    {
      ADCHS_CallbackObj[19].callback_fn(ADCHS_CH19, ADCHS_CallbackObj[19].context);
    }


    IFS3CLR = _IFS3_AD1D19IF_MASK;
}

uint16_t adc_count0,adc_count1,  adc_count12,  adc_count13,  adc_count14 ,adc_count11,adc_count15,adc_count20,adc_count21;
volatile bool result_ready = false;
volatile bool result_ready1 = false;
ADC_Sample		ADC_Sample_Para 	= ADC_Sample_DEFAULTS;
ADC_Sample_F	ADC_Sample_F_Para   = ADC_Sample_F_DEFAULTS;

static volatile int faultdect ;
void ADC_ResultHandler(ADCHS_CHANNEL_NUM channel, uintptr_t context)
{

       uint32_t nBytes = 0;   
       static volatile  uint32_t    Motoradccnt0,   Motoradccnt1  ,Motoradccnt12 , Motoradccnt13,\
                                    Motoradccnt14 ,  Motoradccnt15 ,Motoradccnt11 ,Motoradccnt20, 
                                    Motoradccnt21;    
        static volatile  uint32_t    ticOldxx;  
        static volatile  uint32_t    tickNowxx;  
        tickNowxx =  getSysTick(); 


        
 #if 0                                                                                                     
        #define adccnttime 1000
        if((int32_t)(tickNowxx - ticOldxx) >= adccnttime)  	  //20k=50微秒   1ms 20次  验证ok 每次+-2次
        { 	
            ticOldxx = tickNowxx;	
            
            nBytes = sprintf((char*)txBuffer, "\r\n ADCcnt=%d,%d,%d,%d,%d,%d\r\n"  , Motoradccnt0,Motoradccnt1,Motoradccnt11,Motoradccnt15,Motoradccnt20,Motoradccnt21 );
            UART6_Write((uint8_t*)txBuffer,   nBytes);
            Motoradccnt0 =0;   Motoradccnt1 =0;  Motoradccnt13 =0;  Motoradccnt12 =0;
            Motoradccnt14 =0; Motoradccnt11=0;   Motoradccnt15=0;   Motoradccnt20 =0; Motoradccnt21=0;
     
        }
#endif 
     
    /* Read the ADC result xzw */
    if(ADCDSTAT1bits.ARDY0== 1)            // Iw 
    {
        adc_count0 = ADCHS_ChannelResultGet(ADCHS_CH0);    Motoradccnt0++;
    }
    
    if(ADCDSTAT1bits.ARDY1== 1)         //Iv
    {
         adc_count1 = ADCHS_ChannelResultGet(ADCHS_CH1);   Motoradccnt1++;
    }    
        
        
        
        
        
     if(ADCDSTAT1bits.ARDY11== 1)
    {
        adc_count11 = ADCHS_ChannelResultGet(ADCHS_CH11);  Motoradccnt11++;// rc11  ric
    }    
     
    if(ADCDSTAT1bits.ARDY12== 1)
    {
        adc_count12 = ADCHS_ChannelResultGet(ADCHS_CH12);  Motoradccnt12++;//E12   vbus
    }

    if(ADCDSTAT1bits.ARDY13== 1)
    {
         adc_count13 = ADCHS_ChannelResultGet(ADCHS_CH13); Motoradccnt13++;//E13  temp 
    }

    if(ADCDSTAT1bits.ARDY14== 1)
    {
         adc_count14 = ADCHS_ChannelResultGet(ADCHS_CH14);  Motoradccnt14++;//E14 VU
    }
      if(ADCDSTAT1bits.ARDY15== 1)
    {
         adc_count15 = ADCHS_ChannelResultGet(ADCHS_CH15);  Motoradccnt15++;//E15 VV
    }  
        
    if(ADCDSTAT1bits.ARDY20== 1)
    {
     adc_count20 = ADCHS_ChannelResultGet(ADCHS_CH20);  Motoradccnt20++;//E9    VW
    }   
    if(ADCDSTAT1bits.ARDY21== 1)
    {
     adc_count21 = ADCHS_ChannelResultGet(ADCHS_CH21);  Motoradccnt21++;//E8
    }    
        
   
     Get_ADC() ;
 
    
    if(Motor.M_State==2)
    {
         UVW_Axis_dq();	
         IF_Start_Control();	
//         QT_Motor();		
//         FOC_Svpwm_dq();
         faultdect++;
//        if(faultdect>=200)  //10ms
//        {
//           faultdect =0 ;
//           Fault_Detection();	
//        }
   
    }
   
//    FOC_Control_Selected() ;
    result_ready = true;
   (LATAINV= (1<<14)) ;   //测试adc 调度 翻转 
 
    PWMCON1bits.TRGIEN =0;

   
    
    
}


void ADC_ResultHandler1(ADCHS_CHANNEL_NUM channel, uintptr_t context)
{    
//    faultdect++;
//    if(faultdect>=200)
//    {
//      faultdect =0 ;
//      Fault_Detection();	
//    }
    
//    /* Read the ADC result */
//    if(ADCDSTAT1bits.ARDY1== 1)
//    {
//         adc_count1 = ADCHS_ChannelResultGet(ADCHS_CH1);
//    }
//     if(ADCDSTAT1bits.ARDY0== 1)
//    {
//        adc_count0 = ADCHS_ChannelResultGet(ADCHS_CH0);
//    }
//
//     (LATAINV= (1<<14)) ; 
//    PWMCON2bits.TRGIEN =0;
//    result_ready1 = true;
//    Get_ADC() ;
}


void ADC_Sample_Offset(void)
{
    u8 i = 0;
    u8 j = 0;
    u32 Sum1 = 0;
    u32 Sum2 = 0;

    for(i=0; i<200; i++)
    {
        for(j=0; j<20; j++)
        {
            ADC_Sample_Para.Offset_PhaseV_Curr = adc_count1;
            ADC_Sample_Para.Offset_PhaseW_Curr = adc_count0;

//            delay_1ms(1);
        }
        Sum1 += ADC_Sample_Para.Offset_PhaseV_Curr;
        Sum2 += ADC_Sample_Para.Offset_PhaseW_Curr;
    }
    ADC_Sample_F_Para.Offset_PhaseV_Curr = Sum1/200 - 2048;
    ADC_Sample_F_Para.Offset_PhaseW_Curr = Sum2/200 - 2048;
}

//????????
void ADC_SAMPLE(void)
{   

	ADC_Sample_Para.PhaseV_Curr = (1.65f - (float)( adc_count1 - ADC_Sample_F_Para.Offset_PhaseV_Curr)/4096*3.3f)*I_Gain;
	ADC_Sample_Para.PhaseW_Curr = (1.65f - (float)( adc_count0 - ADC_Sample_F_Para.Offset_PhaseW_Curr)/4096*3.3f)*I_Gain;

	ADC_Sample_Para.VBUS = (float)adc_count12/4096*3.35f*Vbus_Gain;  
	ADC_Sample_Para.Temperature = (float)adc_count13;

}

//?????????
void ADC_Sample_Deal(void)
{
//	ADC_Sample_F_Para.PhaseV_Curr = LPF_I_RUN_B*ADC_Sample_F_Para.PhaseV_Curr + LPF_I_RUN_A*ADC_Sample_Para.PhaseV_Curr;
//	ADC_Sample_F_Para.PhaseW_Curr = LPF_I_RUN_B*ADC_Sample_F_Para.PhaseW_Curr + LPF_I_RUN_A*ADC_Sample_Para.PhaseW_Curr;
	ADC_Sample_F_Para.VBUS =  ADC_Sample_F_Para.VBUS*LPF_I_STOP_B + ADC_Sample_Para.VBUS*LPF_I_STOP_A;
	ADC_Sample_F_Para.Temperature = ADC_Sample_F_Para.Temperature*LPF_I_STOP_B + ADC_Sample_Para.Temperature*LPF_I_STOP_A;
}

//??????????xzw
void Get_ADC(void)
{
	ADC_SAMPLE();
	ADC_Sample_Deal();
}


/* USER CODE BEGIN 1 */
//????
//???ADC???
uint8_t NTC_ERROR = 0;
float NTC_Temp;
void temp_trans(uint16_t ADC_value, float* temp)
{
	uint16_t 	Rt = 0;   													        //NTC??
	float VR = 0;																	//???
	
	VR = (float)ADC_value/4096*3.35f; 												//??????
	Rt = (3.35f - VR)*NTC_R1/VR;														//??Rt
	if((Rt < NTC_R0) && (Rt > NTC_R2))												//?25?~100???
	{
		*temp = 1/(1/NTC_T0 + log((float)Rt/NTC_R0)/ NTC_B) - NTC_Ka;			   //????
		NTC_ERROR = 0;
	}
	else
	{
		if(Rt > NTC_R0)
			NTC_ERROR = 1;			//??25?
		else
			NTC_ERROR = 2;			//??100?
	}
}








