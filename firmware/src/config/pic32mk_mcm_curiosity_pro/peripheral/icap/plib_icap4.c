/*******************************************************************************
  Input Capture (ICAP4) Peripheral Library (PLIB)

  Company:
    Microchip Technology Inc.

  File Name:
    plib_icap4.c

  Summary:
    ICAP4 Source File

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
#include "plib_icap4.h"

ICAP_OBJECT icap4Obj;
// *****************************************************************************

// *****************************************************************************
// Section: ICAP4 Implementation
// *****************************************************************************
// *****************************************************************************


void ICAP4_Initialize (void)
{
    /*Setup IC4CON    */
    /*ICM     = 1        */
    /*ICI     = 0        */
    /*ICTMR = 0*/
    /*C32     = 0        */
    /*FEDGE = 0        */
    /*SIDL     = false    */

    IC4CON = 0x1;


        IEC0SET = _IEC0_IC4IE_MASK;
}


void ICAP4_Enable (void)
{
    IC4CONSET = _IC4CON_ON_MASK;
}


void ICAP4_Disable (void)
{
    IC4CONCLR = _IC4CON_ON_MASK;
}

uint16_t ICAP4_CaptureBufferRead (void)
{
    return (uint16_t)IC4BUF;
}



void ICAP4_CallbackRegister(ICAP_CALLBACK callback, uintptr_t context)
{
    icap4Obj.callback = callback;
    icap4Obj.context = context;
}

void INPUT_CAPTURE_4_InterruptHandler(void)
{
    if( (icap4Obj.callback != NULL))
    {
        icap4Obj.callback(icap4Obj.context);
    }
    IFS0CLR = _IFS0_IC4IF_MASK;    //Clear IRQ flag

}


bool ICAP4_ErrorStatusGet (void)
{
    bool status = false;
    status = ((IC4CON >> ICAP_STATUS_OVERFLOW) & 0x1);
    return status;
}
