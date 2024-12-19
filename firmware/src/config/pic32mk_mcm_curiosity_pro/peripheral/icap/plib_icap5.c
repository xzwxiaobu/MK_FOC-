/*******************************************************************************
  Input Capture (ICAP5) Peripheral Library (PLIB)

  Company:
    Microchip Technology Inc.

  File Name:
    plib_icap5.c

  Summary:
    ICAP5 Source File

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
#include "plib_icap5.h"

ICAP_OBJECT icap5Obj;
// *****************************************************************************

// *****************************************************************************
// Section: ICAP5 Implementation
// *****************************************************************************
// *****************************************************************************


void ICAP5_Initialize (void)
{
    /*Setup IC5CON    */
    /*ICM     = 1        */
    /*ICI     = 0        */
    /*ICTMR = 0*/
    /*C32     = 0        */
    /*FEDGE = 0        */
    /*SIDL     = false    */

    IC5CON = 0x1;


        IEC0SET = _IEC0_IC5IE_MASK;
}


void ICAP5_Enable (void)
{
    IC5CONSET = _IC5CON_ON_MASK;
}


void ICAP5_Disable (void)
{
    IC5CONCLR = _IC5CON_ON_MASK;
}

uint16_t ICAP5_CaptureBufferRead (void)
{
    return (uint16_t)IC5BUF;
}



void ICAP5_CallbackRegister(ICAP_CALLBACK callback, uintptr_t context)
{
    icap5Obj.callback = callback;
    icap5Obj.context = context;
}

void INPUT_CAPTURE_5_InterruptHandler(void)
{
    if( (icap5Obj.callback != NULL))
    {
        icap5Obj.callback(icap5Obj.context);
    }
    IFS0CLR = _IFS0_IC5IF_MASK;    //Clear IRQ flag

}


bool ICAP5_ErrorStatusGet (void)
{
    bool status = false;
    status = ((IC5CON >> ICAP_STATUS_OVERFLOW) & 0x1);
    return status;
}
