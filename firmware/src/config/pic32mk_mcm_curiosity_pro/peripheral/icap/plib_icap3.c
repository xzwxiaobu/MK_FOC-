/*******************************************************************************
  Input Capture (ICAP3) Peripheral Library (PLIB)

  Company:
    Microchip Technology Inc.

  File Name:
    plib_icap3.c

  Summary:
    ICAP3 Source File

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
#include "plib_icap3.h"

ICAP_OBJECT icap3Obj;
// *****************************************************************************

// *****************************************************************************
// Section: ICAP3 Implementation
// *****************************************************************************
// *****************************************************************************


void ICAP3_Initialize (void)
{
    /*Setup IC3CON    */
    /*ICM     = 1        */
    /*ICI     = 0        */
    /*ICTMR = 0*/
    /*C32     = 0        */
    /*FEDGE = 0        */
    /*SIDL     = false    */

    IC3CON = 0x1;


        IEC0SET = _IEC0_IC3IE_MASK;
}


void ICAP3_Enable (void)
{
    IC3CONSET = _IC3CON_ON_MASK;
}


void ICAP3_Disable (void)
{
    IC3CONCLR = _IC3CON_ON_MASK;
}

uint16_t ICAP3_CaptureBufferRead (void)
{
    return (uint16_t)IC3BUF;
}



void ICAP3_CallbackRegister(ICAP_CALLBACK callback, uintptr_t context)
{
    icap3Obj.callback = callback;
    icap3Obj.context = context;
}

void INPUT_CAPTURE_3_InterruptHandler(void)
{
    if( (icap3Obj.callback != NULL))
    {
        icap3Obj.callback(icap3Obj.context);
    }
    IFS0CLR = _IFS0_IC3IF_MASK;    //Clear IRQ flag

}


bool ICAP3_ErrorStatusGet (void)
{
    bool status = false;
    status = ((IC3CON >> ICAP_STATUS_OVERFLOW) & 0x1);
    return status;
}
