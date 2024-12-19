#include "FOC_Control.h"

/*
**Clarkb变换
**Ia+Ib+Ic=0
**等幅值变换
**Alpha=Iu
**Beta=sqrt(3)/3*Iu+x*sqrt(3)/3*Iv
*/

void CLARKE_Cale(M_CLARKE pv)
{
    pv->Alpha = -(pv->Iv + pv->Iw);
    pv->Beta =  0.5773502691896f*(pv->Iv - pv->Iw);
}

/*
**Park变换   sinf   cosf
*/
void PARK_Cale(M_PARK pv)
{
    pv->Ds = cosf(pv->Theta) * pv->Alpha +  sinf(pv->Theta) * pv->Beta;
    pv->Qs = cosf(pv->Theta) * pv->Beta  -  sinf(pv->Theta) * pv->Alpha;
}


/*
**IPark变换
*/
void IPARK_Cale(M_IPARK pv)
{
    pv->Alpha = cosf(pv->Theta) * pv->Ds - sinf(pv->Theta) * pv->Qs;
    pv->Beta =  sinf(pv->Theta) * pv->Ds + cosf(pv->Theta) * pv->Qs;
}




/**ICLARKE
*/

void ICLARKE_Cale(M_ICLARKE pv)
{
  
  pv->Vu=pv->Beta;
	
  pv->Vv=((-pv->Beta)+Sqrt_OF_3*3*pv->Alpha)/2;
	
	
  pv->Vw=((-pv->Beta)-Sqrt_OF_3*3*pv->Alpha)/2;
	
	
}






