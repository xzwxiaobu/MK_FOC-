/* 
 * File:   vofa.h
 * Author: 031379
 *
 * Created on June 27, 2024, 4:20 PM
 */

#ifndef VOFA_H
#define	VOFA_H

#ifdef	__cplusplus
extern "C" {
#endif



//#include"newfile.h"

//#include  "dsp.h"
#include <stdint.h>

#define Vofa_GetByte   7   
    
typedef union 		//??????????
{	
	float f_data;
	uint8_t c_data[4];
}FloatToChar;

extern  FloatToChar fc;    


void XzwVfsend(void);
void XzwVfGet(void);
void  RGB_ledControl( int MODE) ;
#ifdef	__cplusplus
}
#endif

#endif	/* VOFA_H */

