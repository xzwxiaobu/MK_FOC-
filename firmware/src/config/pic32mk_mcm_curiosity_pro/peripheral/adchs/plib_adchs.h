/*******************************************************************************
  ADCHS Peripheral Library Interface Header File

  Company
    Microchip Technology Inc.

  File Name
    plib_adchs.h

  Summary
    ADCHS peripheral library interface.

  Description
    This file defines the interface to the ADCHS peripheral library.  This
    library provides access to and control of the associated peripheral
    instance.

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

#ifndef PLIB_ADCHS_H    // Guards against multiple inclusion
#define PLIB_ADCHS_H


// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

/*  This section lists the other files that are included in this file.
*/

#include "plib_adchs_common.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif

// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Data Types
// *****************************************************************************
// *****************************************************************************
/*  The following data type definitions are used by the functions in this
    interface and should be considered part it.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Interface Routines
// *****************************************************************************
// *****************************************************************************
/* The following functions make up the methods (set of possible operations) of
   this interface.
*/

void ADCHS_Initialize (void);

void ADCHS_ModulesEnable (ADCHS_MODULE_MASK modulesMask);
void ADCHS_ModulesDisable (ADCHS_MODULE_MASK modulesMask);

void ADCHS_GlobalEdgeConversionStart(void);
void ADCHS_GlobalLevelConversionStart(void);
void ADCHS_GlobalLevelConversionStop(void);
void ADCHS_ChannelConversionStart(ADCHS_CHANNEL_NUM channel);

void ADCHS_ChannelResultInterruptEnable (ADCHS_CHANNEL_NUM channel);
void ADCHS_ChannelResultInterruptDisable (ADCHS_CHANNEL_NUM channel);
void ADCHS_ChannelEarlyInterruptEnable (ADCHS_CHANNEL_NUM channel);
void ADCHS_ChannelEarlyInterruptDisable (ADCHS_CHANNEL_NUM channel);

bool ADCHS_ChannelResultIsReady(ADCHS_CHANNEL_NUM channel);
uint16_t ADCHS_ChannelResultGet(ADCHS_CHANNEL_NUM channel);


void ADCHS_CallbackRegister(ADCHS_CHANNEL_NUM channel, ADCHS_CALLBACK callback, uintptr_t context);

bool ADCHS_EOSStatusGet(void);

void ADC_ResultHandler(ADCHS_CHANNEL_NUM channel, uintptr_t context) ;
void ADC_ResultHandler1(ADCHS_CHANNEL_NUM channel, uintptr_t context) ;

extern uint16_t adc_count0, adc_count1 ,adc_count12,  adc_count13,  adc_count14 ,adc_count11,adc_count15,adc_count20,adc_count21;   // ????? adc 




/* USER CODE BEGIN Private defines */
#define LPF_I_STOP_A		0.00314159265f			//????10Hz
#define LPF_I_STOP_B		0.99685840735f

#define LPF_I_RUN_A			0.37699f			//????1200Hz
#define LPF_I_RUN_B			0.62301f
	
#define LPF_U_A					0.015465039f			//????100Hz
#define LPF_U_B					0.984534961f	

#define I_Gain					16.66666666666667f	//??????
#define Vbus_Gain				16.0f								//????????????

#define Ts_VS						0.000025f

#define NTC_R0 				 	10000 											//10K, NTC??25????
#define NTC_T0 				 	298.15f											//???????? 25+273.15f
#define NTC_B 				 	3455 												//B?
#define NTC_Ka  			 	273.15f 										//K?,?????????????
#define NTC_R1 					3300												//???????????
#define NTC_R2					974													//0.974K,NTC??100????

typedef struct {
	float VBUS;		//????
	float	Temperature;		//??
	
	float PhaseV_Curr;		//V???
	float PhaseW_Curr;		//W???
    float PhaseDrive_GND;
	int16_t		Offset_PhaseV_Curr;		//V??????
	int16_t 	Offset_PhaseW_Curr;		//W??????
	} ADC_Sample;

    
    
#define ADC_Sample_DEFAULTS		{0,0,0,0,0,0}			//?????

typedef struct {
	float VBUS;		//????
	float Temperature;
	
	float PhaseV_Curr;
	float PhaseW_Curr;

	int16_t	  Offset_PhaseV_Curr;
	int16_t 	Offset_PhaseW_Curr;
	} ADC_Sample_F;

#define ADC_Sample_F_DEFAULTS		{0,0,0,0,0,0}				//?????

typedef struct {
	float Yn;
	float Yn_last;
	float Xn;
	float Xn_last;
	float Tau;
	} V_Comp, *P_Vcomp;

#define Voltage_Compensation_DEFAULTS		{0,0,0,0,0}

extern uint16_t	ADC_Value[7];	//ADC????
extern uint8_t 	NTC_ERROR;		//NTC????
extern float 		NTC_Temp;
extern ADC_Sample			ADC_Sample_Para;
extern ADC_Sample_F		    ADC_Sample_F_Para;


//extern uint16_t	ADC0[200];	//ADC????
//extern uint16_t	ADC1[200];	//ADC????
/* USER CODE END Private defines */



/* USER CODE BEGIN Prototypes */
void ADC_Sample_Offset(void);										//????
void Get_ADC(void);															//?????????
void temp_trans(uint16_t ADC_value, float* temp);		//NTC????



// *****************************************************************************

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

}
#endif
// DOM-IGNORE-END

#endif //PLIB_ADCHS_H

/**
 End of File
*/
