/*******************************************************************************
  Motor Control PWM (MCPWM) Peripheral Library (PLIB)

  Company:
    Microchip Technology Inc.

  File Name:
    plib_mcpwm.c

  Summary:
    MCPWM Source File

  Description:
    None

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
#include "device.h"
#include "plib_mcpwm.h"

// *****************************************************************************

// *****************************************************************************
// Section: MCPWM Implementation
// *****************************************************************************
// *****************************************************************************
MCPWM_CH_OBJECT mcpwmObj[12];

void MCPWM_Initialize (void)
{
    #if 1
    /* PTCON register  */
    /*  SEVTPS  = 0 */
    /*  PCLKDIV = 0 */
    /*  SEIEN   = false */
    PTCON = 0x0;

    /* STCON register  */
    /*  SEVTPS  = 0 */
    /*  SCLKDIV = 0 */
    /*  SSEIEN = false */
    STCON = 0x0;

    PTPER = 3000;
    STPER = 2000;
    SEVTCMP = 10;
    SSEVTCMP = 10;

    /*********** Channel 1 Configurations **********/
    /* PWMCON1 register  */
    /*  MTBS   = 0 */
    /*  PTDIR  =  0 */
    /*  ECAM   =  1 */
    /*  DTCP   =  0 */
    /*  DTC    =  2 */
    /*  ITB    = 0 */
    /*  PWMHIEN =  true */
    /*  PWMLIEN = false */
    /*  TRGIEN = false */
    /*  CLIEN = false */
    /*  FLTIEN = false */
    PWMCON1 = 0x80480;

    /* IOCON1 register  */
    /*  SWAP    = 0*/
    /*  PMOD    = 0*/
    /*  POLH    = 0*/
    /*  POLL    = 0*/
    /*  FLTDAT  = 0b00 */
    /*  FLTMOD  = 3 */
    /*  FLTPOL  = 0  */
    /*  FLTSRC  = 0  */
    /*  CLDAT  = 0b00 */
    /*  CLMOD  = 0 */
    /*  CLPOL  = 0  */
    /*  CLSRC  = 0  */
    IOCON1 = 0x3c000;

    PDC1 =1000;
    SDC1 = 0;
    PHASE1 = 0;

    /* Dead Time */
    DTR1 = 20;
    ALTDTR1 = 20;

    /* Trigger Generator */
    TRGCON1 = 0x7400;
    TRGCON1bits.STRGSEL = 0x00;     PTCONbits.PTEN =0 ; TRGCON1bits.DTM =0x00;
    TRGCON1bits.STRGIS= 0x0;           
    TRGCON1bits.TRGDIV = 0 ;       TRGCON1bits.TRGSEL =1 ;
    TRIG1 =  2980;
    STRIG1 = 0;
    /* leading edge blanking */
    /* LEBCON1 register  */
    /*  CLLEBEN    = false  */
    /*  FLTLEBEN   = false */
    /*  PLF        = 0  */
    /*  PLR        = 0  */
    /*  PHF        = 0  */
    /*  PHR        = 0  */
    LEBCON1 = 0x0;
    LEBDLY1 = 10;

    /* Enable interrupt */
    IEC5SET = _IEC5_PWM1IE_MASK;
    mcpwmObj[0].callback = NULL;

     /*********** Channel 2 Configurations **********/
    /* PWMCON1 register  */
    /*  MTBS   = 0 */
    /*  PTDIR  =  0 */
    /*  ECAM   =  1 */
    /*  DTCP   =  0 */
    /*  DTC    =  2 */
    /*  ITB    = 0 */
    /*  PWMHIEN =  true */
    /*  PWMLIEN = false */
    /*  TRGIEN = false */
    /*  CLIEN = false */
    /*  FLTIEN = false */
    PWMCON2 = 0x80480;

    /* IOCON1 register  */
    /*  SWAP    = 0*/
    /*  PMOD    = 0*/
    /*  POLH    = 0*/
    /*  POLL    = 0*/
    /*  FLTDAT  = 0b00 */
    /*  FLTMOD  = 3 */
    /*  FLTPOL  = 0  */
    /*  FLTSRC  = 0  */
    /*  CLDAT  = 0b00 */
    /*  CLMOD  = 0 */
    /*  CLPOL  = 0  */
    /*  CLSRC  = 0  */
    IOCON2 = 0x3c000;

    PDC2 = 1000;
    SDC2 = 0;
    PHASE2 = 0;

    /* Dead Time */
    DTR2 = 20;
    ALTDTR2 = 20;

//    /* Trigger Generator */
//    TRGCON2 = 0x7400;
//    TRGCON2bits.STRGSEL = 0x00;     PTCONbits.PTEN =0 ; TRGCON2bits.DTM =0x00;
//    TRGCON2bits.STRGIS= 0x0;           
//    TRGCON2bits.TRGDIV = 0 ;       TRGCON2bits.TRGSEL =1 ;
//
//    TRIG2 =  1500;
//    STRIG2 = 0;
    /* leading edge blanking */
    /* LEBCON2 register  */
    /*  CLLEBEN    = false  */
    /*  FLTLEBEN   = false */
    /*  PLF        = 0  */
    /*  PLR        = 0  */
    /*  PHF        = 0  */
    /*  PHR        = 0  */
    LEBCON2 = 0x0;
    LEBDLY2 = 10;
    

    
     /*********** Channel 1 Configurations **********/
    /* PWMCON1 register  */
    /*  MTBS   = 0 */
    /*  PTDIR  =  0 */
    /*  ECAM   =  1 */
    /*  DTCP   =  0 */
    /*  DTC    =  2 */
    /*  ITB    = 0 */
    /*  PWMHIEN =  true */
    /*  PWMLIEN = false */
    /*  TRGIEN = false */
    /*  CLIEN = false */
    /*  FLTIEN = false */
    PWMCON3 = 0x80480;

    /* IOCON1 register  */
    /*  SWAP    = 0*/
    /*  PMOD    = 0*/
    /*  POLH    = 0*/
    /*  POLL    = 0*/
    /*  FLTDAT  = 0b00 */
    /*  FLTMOD  = 3 */
    /*  FLTPOL  = 0  */
    /*  FLTSRC  = 0  */
    /*  CLDAT  = 0b00 */
    /*  CLMOD  = 0 */
    /*  CLPOL  = 0  */
    /*  CLSRC  = 0  */
    IOCON3 = 0x3c000;

    PDC3 = 1000;
    SDC3 = 0;
    PHASE3 = 3000;

    /* Dead Time */
    DTR3 = 20;
    ALTDTR3 = 20;

    /* Trigger Generator */
//    TRGCON3 = 0x7400;
//    TRGCON3bits.STRGSEL = 0x00;     PTCONbits.PTEN =0 ; TRGCON3bits.DTM =0x00;
//    TRGCON3bits.STRGIS= 0x0;           
//    TRGCON3bits.TRGDIV = 0 ;       TRGCON3bits.TRGSEL = 0 ;
//
//    TRIG3 =1500;
////    STRIG1 = 0;
////    TRIG1 = 0;
//    STRIG3 = 0;
    /* leading edge blanking */
    /* LEBCON2 register  */
    /*  CLLEBEN    = false  */
    /*  FLTLEBEN   = false */
    /*  PLF        = 0  */
    /*  PLR        = 0  */
    /*  PHF        = 0  */
    /*  PHR        = 0  */
    LEBCON3 = 0x0;
    LEBDLY3= 10;
  #endif 
    
  # if 0 
    
    /* Set PWM Period on Primary Time Base */
    /* Enable PWM Module */

PTPER = 1000;                                                                                       
/* Set relative offsets between the PWM waveforms to PERIOD/2 */
PHASE1 = 0; PHASE2 = 0; PHASE3 = 0;
PHASE7 = 0; PHASE8 = 0; PHASE9 = 0; /* One-half of PWM period */
/* Set Symmetric Duty Cycles */
PDC1 = 400; PDC2 = 300; PDC3 = 700;
PDC7 = 500; PDC8 = 600; PDC9 = 900;
/* Set Dead time control to disabled and Edge-Aligned mode enabled */
PWMCON1 = PWMCON7 = 0x00000080; 
PWMCON2 = PWMCON8 = 0x00000080; 
PWMCON3 = PWMCON9 = 0x00000080; 

/* Set PWM mode to Redundant output mode and fault mode to disabled*/
/* Set PWMxL to I/O Function */
IOCON1 = IOCON7 = 0x00038400;
IOCON2 = IOCON8 = 0x00038400;
IOCON3 = IOCON9 = 0x00038400;


/* Write Unlock Sequence to allow write access to CFGCON register */
 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA; 
/*Remap PWM7H to PWM1L*/
 CFGCONbits.PWMAPIN1=1;
 CFGCONbits.PWMAPIN2=1;
 CFGCONbits.PWMAPIN3=1;
 
/*Lock Write access to CFGCON register */
SYSKEY = 0;
/* Set Primary Time Base*/
/* 1:1 Prescaler */
PTCON = 0x0000;
/* Enable PWM Module */
//PTCON = 0x8000;

 #endif   
    
    
 
}


void MCPWM_Start(void)
{
    /* Enable MCPWM module */
    PTCONbits.PTEN = 0x1;
}

void MCPWM_Stop(void)
{
    /* Disable MCPWM module */
    PTCONbits.PTEN = 0x0;
}

void MCPWM_PrimaryPeriodSet(uint16_t period)
{
    PTPER = period;
}

uint16_t MCPWM_PrimaryPeriodGet(void)
{
    return PTPER;
}


void MCPWM_SecondaryPeriodSet(uint16_t period)
{
    STPER = period;
}

uint16_t MCPWM_SecondaryPeriodGet(void)
{
    return STPER;
}

void MCPWM_ChannelPrimaryDutySet(MCPWM_CH_NUM channel, uint16_t duty)
{
    *(&PDC1 + (0x40 * (channel))) = duty;
}

void MCPWM_ChannelSecondaryDutySet(MCPWM_CH_NUM channel, uint16_t duty)
{
    *(&SDC1 + (0x40 * (channel))) = duty;
}

void MCPWM_ChannelDeadTimeSet(MCPWM_CH_NUM channel, uint16_t high_deadtime, uint16_t low_deadtime)
{
    *(&DTR1 + (0x40 * (channel))) = (high_deadtime & 0x3FFF);
    *(&ALTDTR1 + (0x40 * (channel))) = (low_deadtime & 0x3FFF);
}

void MCPWM_ChannelPrimaryTriggerSet(MCPWM_CH_NUM channel, uint16_t trigger)
{
    *(&TRIG1 + (0x40 * (channel))) = trigger;
}

void MCPWM_ChannelSecondaryTriggerSet(MCPWM_CH_NUM channel, uint16_t trigger)
{
    *(&STRIG1 + (0x40 * (channel))) = trigger;
}

void MCPWM_ChannelLeadingEdgeBlankingDelaySet(MCPWM_CH_NUM channel, uint16_t delay)
{
    *(&LEBDLY1 + (0x40 * (channel))) = delay;
}

void MCPWM_ChannelPinsOverrideEnable(MCPWM_CH_NUM channel)
{
    *(&IOCON1 + (0x40 * (channel))) |= _IOCON1_OVRENL_MASK | _IOCON1_OVRENH_MASK;
}

void MCPWM_ChannelPinsOverrideDisable(MCPWM_CH_NUM channel)
{
    *(&IOCON1 + (0x40 * (channel))) &= ~(_IOCON1_OVRENL_MASK | _IOCON1_OVRENH_MASK);
}

void MCPWM_ChannelPinsOwnershipEnable(MCPWM_CH_NUM channel)
{
    *(&IOCON1 + (0x40 * (channel))) |= _IOCON1_PENH_MASK | _IOCON1_PENL_MASK;
}

void MCPWM_ChannelPinsOwnershipDisable(MCPWM_CH_NUM channel)
{
    *(&IOCON1 + (0x40 * (channel))) &= ~(_IOCON1_PENH_MASK | _IOCON1_PENL_MASK);
}



void PWM1_InterruptHandler(void)
{
    MCPWM_CH_STATUS status;
    status = (MCPWM_CH_STATUS)(PWMCON1 & MCPWM_STATUS_MASK);
    if (PWMCON1bits.PWMHIEN && PWMCON1bits.PWMHIF)
    {
        PWMCON1bits.PWMHIF = 0;
    }
    if (PWMCON1bits.PWMLIEN && PWMCON1bits.PWMLIF)
    {
        PWMCON1bits.PWMLIF = 0;
    }
    if (PWMCON1bits.TRGIEN && PWMCON1bits.TRGIF)
    {
        PWMCON1bits.TRGIF = 0;
    }
    if (PWMCON1bits.CLIEN && PWMCON1bits.CLIF)
    {
        PWMCON1bits.CLIEN = 0;
        PWMCON1bits.CLIF = 0;
    }
    if (PWMCON1bits.FLTIEN && PWMCON1bits.FLTIF)
    {
        PWMCON1bits.FLTIEN = 0;
        PWMCON1bits.FLTIF = 0;
    }

    IFS5CLR = _IFS5_PWM1IF_MASK;    //Clear IRQ flag


    if( (mcpwmObj[0].callback != NULL))
    {
        mcpwmObj[0].callback(status, mcpwmObj[0].context);
    }
}


void MCPWM_CallbackRegister(MCPWM_CH_NUM channel, MCPWM_CH_CALLBACK callback, uintptr_t context)
{
    mcpwmObj[channel].callback = callback;
    mcpwmObj[channel].context = context;
}



