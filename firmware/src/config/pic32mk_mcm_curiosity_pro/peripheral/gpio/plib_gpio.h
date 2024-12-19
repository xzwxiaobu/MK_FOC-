/*******************************************************************************
  GPIO PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_gpio.h

  Summary:
    GPIO PLIB Header File

  Description:
    This library provides an interface to control and interact with Parallel
    Input/Output controller (GPIO) module.

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

#ifndef PLIB_GPIO_H
#define PLIB_GPIO_H

#include <device.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Data types and constants
// *****************************************************************************
// *****************************************************************************


/*** Macros for GPIO_RG10 pin ***/
#define GPIO_RG10_Set()               (LATGSET = (1<<10))
#define GPIO_RG10_Clear()             (LATGCLR = (1<<10))
#define GPIO_RG10_Toggle()            (LATGINV= (1<<10))
#define GPIO_RG10_OutputEnable()      (TRISGCLR = (1<<10))
#define GPIO_RG10_InputEnable()       (TRISGSET = (1<<10))
#define GPIO_RG10_Get()               ((PORTG >> 10) & 0x1)
#define GPIO_RG10_PIN                  GPIO_PIN_RG10

/*** Macros for GPIO_RB0 pin ***/
#define GPIO_RB0_Set()               (LATBSET = (1<<0))
#define GPIO_RB0_Clear()             (LATBCLR = (1<<0))
#define GPIO_RB0_Toggle()            (LATBINV= (1<<0))
#define GPIO_RB0_OutputEnable()      (TRISBCLR = (1<<0))
#define GPIO_RB0_InputEnable()       (TRISBSET = (1<<0))
#define GPIO_RB0_Get()               ((PORTB >> 0) & 0x1)
#define GPIO_RB0_PIN                  GPIO_PIN_RB0

/*** Macros for GPIO_RC0 pin ***/
#define GPIO_RC0_Set()               (LATCSET = (1<<0))
#define GPIO_RC0_Clear()             (LATCCLR = (1<<0))
#define GPIO_RC0_Toggle()            (LATCINV= (1<<0))
#define GPIO_RC0_OutputEnable()      (TRISCCLR = (1<<0))
#define GPIO_RC0_InputEnable()       (TRISCSET = (1<<0))
#define GPIO_RC0_Get()               ((PORTC >> 0) & 0x1)
#define GPIO_RC0_PIN                  GPIO_PIN_RC0

/*** Macros for GPIO_RC1 pin ***/
#define GPIO_RC1_Set()               (LATCSET = (1<<1))
#define GPIO_RC1_Clear()             (LATCCLR = (1<<1))
#define GPIO_RC1_Toggle()            (LATCINV= (1<<1))
#define GPIO_RC1_OutputEnable()      (TRISCCLR = (1<<1))
#define GPIO_RC1_InputEnable()       (TRISCSET = (1<<1))
#define GPIO_RC1_Get()               ((PORTC >> 1) & 0x1)
#define GPIO_RC1_PIN                  GPIO_PIN_RC1

/*** Macros for GPIO_RC2 pin ***/
#define GPIO_RC2_Set()               (LATCSET = (1<<2))
#define GPIO_RC2_Clear()             (LATCCLR = (1<<2))
#define GPIO_RC2_Toggle()            (LATCINV= (1<<2))
#define GPIO_RC2_OutputEnable()      (TRISCCLR = (1<<2))
#define GPIO_RC2_InputEnable()       (TRISCSET = (1<<2))
#define GPIO_RC2_Get()               ((PORTC >> 2) & 0x1)
#define GPIO_RC2_PIN                  GPIO_PIN_RC2

/*** Macros for GPIO_RG11 pin ***/
#define GPIO_RG11_Set()               (LATGSET = (1<<11))
#define GPIO_RG11_Clear()             (LATGCLR = (1<<11))
#define GPIO_RG11_Toggle()            (LATGINV= (1<<11))
#define GPIO_RG11_OutputEnable()      (TRISGCLR = (1<<11))
#define GPIO_RG11_InputEnable()       (TRISGSET = (1<<11))
#define GPIO_RG11_Get()               ((PORTG >> 11) & 0x1)
#define GPIO_RG11_PIN                  GPIO_PIN_RG11

/*** Macros for GPIO_RF13 pin ***/
#define GPIO_RF13_Set()               (LATFSET = (1<<13))
#define GPIO_RF13_Clear()             (LATFCLR = (1<<13))
#define GPIO_RF13_Toggle()            (LATFINV= (1<<13))
#define GPIO_RF13_OutputEnable()      (TRISFCLR = (1<<13))
#define GPIO_RF13_InputEnable()       (TRISFSET = (1<<13))
#define GPIO_RF13_Get()               ((PORTF >> 13) & 0x1)
#define GPIO_RF13_PIN                  GPIO_PIN_RF13

/*** Macros for GPIO_RF12 pin ***/
#define GPIO_RF12_Set()               (LATFSET = (1<<12))
#define GPIO_RF12_Clear()             (LATFCLR = (1<<12))
#define GPIO_RF12_Toggle()            (LATFINV= (1<<12))
#define GPIO_RF12_OutputEnable()      (TRISFCLR = (1<<12))
#define GPIO_RF12_InputEnable()       (TRISFSET = (1<<12))
#define GPIO_RF12_Get()               ((PORTF >> 12) & 0x1)
#define GPIO_RF12_PIN                  GPIO_PIN_RF12

/*** Macros for GPIO_RA14 pin ***/
#define GPIO_RA14_Set()               (LATASET = (1<<14))
#define GPIO_RA14_Clear()             (LATACLR = (1<<14))
#define GPIO_RA14_Toggle()            (LATAINV= (1<<14))
#define GPIO_RA14_OutputEnable()      (TRISACLR = (1<<14))
#define GPIO_RA14_InputEnable()       (TRISASET = (1<<14))
#define GPIO_RA14_Get()               ((PORTA >> 14) & 0x1)
#define GPIO_RA14_PIN                  GPIO_PIN_RA14


// *****************************************************************************
/* GPIO Port

  Summary:
    Identifies the available GPIO Ports.

  Description:
    This enumeration identifies the available GPIO Ports.

  Remarks:
    The caller should not rely on the specific numbers assigned to any of
    these values as they may change from one processor to the next.

    Not all ports are available on all devices.  Refer to the specific
    device data sheet to determine which ports are supported.
*/

typedef enum
{
    GPIO_PORT_A = 0,
    GPIO_PORT_B = 1,
    GPIO_PORT_C = 2,
    GPIO_PORT_D = 3,
    GPIO_PORT_E = 4,
    GPIO_PORT_F = 5,
    GPIO_PORT_G = 6,
} GPIO_PORT;

typedef enum
{
    GPIO_INTERRUPT_ON_MISMATCH,
    GPIO_INTERRUPT_ON_RISING_EDGE,
    GPIO_INTERRUPT_ON_FALLING_EDGE,
    GPIO_INTERRUPT_ON_BOTH_EDGES,
}GPIO_INTERRUPT_STYLE;

// *****************************************************************************
/* GPIO Port Pins

  Summary:
    Identifies the available GPIO port pins.

  Description:
    This enumeration identifies the available GPIO port pins.

  Remarks:
    The caller should not rely on the specific numbers assigned to any of
    these values as they may change from one processor to the next.

    Not all pins are available on all devices.  Refer to the specific
    device data sheet to determine which pins are supported.
*/

typedef enum
{
    GPIO_PIN_RA0 = 0,
    GPIO_PIN_RA1 = 1,
    GPIO_PIN_RA4 = 4,
    GPIO_PIN_RA7 = 7,
    GPIO_PIN_RA8 = 8,
    GPIO_PIN_RA10 = 10,
    GPIO_PIN_RA11 = 11,
    GPIO_PIN_RA12 = 12,
    GPIO_PIN_RA14 = 14,
    GPIO_PIN_RA15 = 15,
    GPIO_PIN_RB0 = 16,
    GPIO_PIN_RB1 = 17,
    GPIO_PIN_RB2 = 18,
    GPIO_PIN_RB3 = 19,
    GPIO_PIN_RB4 = 20,
    GPIO_PIN_RB5 = 21,
    GPIO_PIN_RB6 = 22,
    GPIO_PIN_RB7 = 23,
    GPIO_PIN_RB8 = 24,
    GPIO_PIN_RB9 = 25,
    GPIO_PIN_RB10 = 26,
    GPIO_PIN_RB11 = 27,
    GPIO_PIN_RB12 = 28,
    GPIO_PIN_RB13 = 29,
    GPIO_PIN_RB14 = 30,
    GPIO_PIN_RB15 = 31,
    GPIO_PIN_RC0 = 32,
    GPIO_PIN_RC1 = 33,
    GPIO_PIN_RC2 = 34,
    GPIO_PIN_RC6 = 38,
    GPIO_PIN_RC7 = 39,
    GPIO_PIN_RC8 = 40,
    GPIO_PIN_RC9 = 41,
    GPIO_PIN_RC10 = 42,
    GPIO_PIN_RC11 = 43,
    GPIO_PIN_RC12 = 44,
    GPIO_PIN_RC13 = 45,
    GPIO_PIN_RC15 = 47,
    GPIO_PIN_RD1 = 49,
    GPIO_PIN_RD2 = 50,
    GPIO_PIN_RD3 = 51,
    GPIO_PIN_RD4 = 52,
    GPIO_PIN_RD5 = 53,
    GPIO_PIN_RD6 = 54,
    GPIO_PIN_RD8 = 56,
    GPIO_PIN_RD12 = 60,
    GPIO_PIN_RD13 = 61,
    GPIO_PIN_RD14 = 62,
    GPIO_PIN_RD15 = 63,
    GPIO_PIN_RE0 = 64,
    GPIO_PIN_RE1 = 65,
    GPIO_PIN_RE8 = 72,
    GPIO_PIN_RE9 = 73,
    GPIO_PIN_RE12 = 76,
    GPIO_PIN_RE13 = 77,
    GPIO_PIN_RE14 = 78,
    GPIO_PIN_RE15 = 79,
    GPIO_PIN_RF0 = 80,
    GPIO_PIN_RF1 = 81,
    GPIO_PIN_RF5 = 85,
    GPIO_PIN_RF6 = 86,
    GPIO_PIN_RF7 = 87,
    GPIO_PIN_RF9 = 89,
    GPIO_PIN_RF10 = 90,
    GPIO_PIN_RF12 = 92,
    GPIO_PIN_RF13 = 93,
    GPIO_PIN_RG0 = 96,
    GPIO_PIN_RG1 = 97,
    GPIO_PIN_RG6 = 102,
    GPIO_PIN_RG7 = 103,
    GPIO_PIN_RG8 = 104,
    GPIO_PIN_RG9 = 105,
    GPIO_PIN_RG10 = 106,
    GPIO_PIN_RG11 = 107,
    GPIO_PIN_RG12 = 108,
    GPIO_PIN_RG13 = 109,
    GPIO_PIN_RG14 = 110,
    GPIO_PIN_RG15 = 111,

    /* This element should not be used in any of the GPIO APIs.
       It will be used by other modules or application to denote that none of the GPIO Pin is used */
    GPIO_PIN_NONE = -1

} GPIO_PIN;


void GPIO_Initialize(void);

// *****************************************************************************
// *****************************************************************************
// Section: GPIO Functions which operates on multiple pins of a port
// *****************************************************************************
// *****************************************************************************

uint32_t GPIO_PortRead(GPIO_PORT port);

void GPIO_PortWrite(GPIO_PORT port, uint32_t mask, uint32_t value);

uint32_t GPIO_PortLatchRead ( GPIO_PORT port );

void GPIO_PortSet(GPIO_PORT port, uint32_t mask);

void GPIO_PortClear(GPIO_PORT port, uint32_t mask);

void GPIO_PortToggle(GPIO_PORT port, uint32_t mask);

void GPIO_PortInputEnable(GPIO_PORT port, uint32_t mask);

void GPIO_PortOutputEnable(GPIO_PORT port, uint32_t mask);

// *****************************************************************************
// *****************************************************************************
// Section: GPIO Functions which operates on one pin at a time
// *****************************************************************************
// *****************************************************************************

static inline void GPIO_PinWrite(GPIO_PIN pin, bool value)
{
    GPIO_PortWrite((GPIO_PORT)(pin>>4), (uint32_t)(0x1) << (pin & 0xF), (uint32_t)(value) << (pin & 0xF));
}

static inline bool GPIO_PinRead(GPIO_PIN pin)
{
    return (bool)(((GPIO_PortRead((GPIO_PORT)(pin>>4))) >> (pin & 0xF)) & 0x1);
}

static inline bool GPIO_PinLatchRead(GPIO_PIN pin)
{
    return (bool)((GPIO_PortLatchRead((GPIO_PORT)(pin>>4)) >> (pin & 0xF)) & 0x1);
}

static inline void GPIO_PinToggle(GPIO_PIN pin)
{
    GPIO_PortToggle((GPIO_PORT)(pin>>4), 0x1 << (pin & 0xF));
}

static inline void GPIO_PinSet(GPIO_PIN pin)
{
    GPIO_PortSet((GPIO_PORT)(pin>>4), 0x1 << (pin & 0xF));
}

static inline void GPIO_PinClear(GPIO_PIN pin)
{
    GPIO_PortClear((GPIO_PORT)(pin>>4), 0x1 << (pin & 0xF));
}

static inline void GPIO_PinInputEnable(GPIO_PIN pin)
{
    GPIO_PortInputEnable((GPIO_PORT)(pin>>4), 0x1 << (pin & 0xF));
}

static inline void GPIO_PinOutputEnable(GPIO_PIN pin)
{
    GPIO_PortOutputEnable((GPIO_PORT)(pin>>4), 0x1 << (pin & 0xF));
}


// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END
#endif // PLIB_GPIO_H
