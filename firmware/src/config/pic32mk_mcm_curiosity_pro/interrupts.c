/*******************************************************************************
 System Interrupts File

  Company:
    Microchip Technology Inc.

  File Name:
    interrupt.c

  Summary:
    Interrupt vectors mapping

  Description:
    This file maps all the interrupt vectors to their corresponding
    implementations. If a particular module interrupt is used, then its ISR
    definition can be found in corresponding PLIB source file. If a module
    interrupt is not used, then its ISR implementation is mapped to dummy
    handler.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
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

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "interrupts.h"
#include "definitions.h"


// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector Functions
// *****************************************************************************
// *****************************************************************************


void TIMER_3_InterruptHandler( void );
void INPUT_CAPTURE_3_InterruptHandler( void );
void INPUT_CAPTURE_4_InterruptHandler( void );
void INPUT_CAPTURE_5_InterruptHandler( void );
void I2C1_BUS_InterruptHandler( void );
void I2C1_MASTER_InterruptHandler( void );
void ADC_DATA0_InterruptHandler( void );
void ADC_DATA1_InterruptHandler( void );
void UART6_FAULT_InterruptHandler( void );
void UART6_RX_InterruptHandler( void );
void UART6_TX_InterruptHandler( void );
void PWM1_InterruptHandler( void );



/* All the handlers are defined here.  Each will call its PLIB-specific function. */
void __ISR(_TIMER_3_VECTOR, ipl1SRS) TIMER_3_Handler (void)
{
    TIMER_3_InterruptHandler();
}

void __ISR(_INPUT_CAPTURE_3_VECTOR, ipl1SRS) INPUT_CAPTURE_3_Handler (void)
{
    INPUT_CAPTURE_3_InterruptHandler();
}

void __ISR(_INPUT_CAPTURE_4_VECTOR, ipl1SRS) INPUT_CAPTURE_4_Handler (void)
{
    INPUT_CAPTURE_4_InterruptHandler();
}

void __ISR(_INPUT_CAPTURE_5_VECTOR, ipl1SRS) INPUT_CAPTURE_5_Handler (void)
{
    INPUT_CAPTURE_5_InterruptHandler();
}

void __ISR(_I2C1_BUS_VECTOR, ipl1SRS) I2C1_BUS_Handler (void)
{
    I2C1_BUS_InterruptHandler();
}

void __ISR(_I2C1_MASTER_VECTOR, ipl1SRS) I2C1_MASTER_Handler (void)
{
    I2C1_MASTER_InterruptHandler();
}

void __ISR(_ADC_DATA0_VECTOR, ipl2SRS) ADC_DATA0_Handler (void)
{
    ADC_DATA0_InterruptHandler();
}

void __ISR(_ADC_DATA1_VECTOR, ipl1SRS) ADC_DATA1_Handler (void)
{
    ADC_DATA1_InterruptHandler();
}

void __ISR(_UART6_FAULT_VECTOR, ipl1SRS) UART6_FAULT_Handler (void)
{
    UART6_FAULT_InterruptHandler();
}

void __ISR(_UART6_RX_VECTOR, ipl1SRS) UART6_RX_Handler (void)
{
    UART6_RX_InterruptHandler();
}

void __ISR(_UART6_TX_VECTOR, ipl1SRS) UART6_TX_Handler (void)
{
    UART6_TX_InterruptHandler();
}

void __ISR(_PWM1_VECTOR, ipl1SRS) PWM1_Handler (void)
{
    PWM1_InterruptHandler();
}




/*******************************************************************************
 End of File
*/
