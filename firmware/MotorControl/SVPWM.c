#include "FOC_Control.h"

SVPWM        								 SVPWM_dq = SVPWM_DEFAULTS;

/*
**SVPWM计算
// SVPWM是7段式矢量调试，扇区与输出电压占空比经过简化后为对称输出，1和4，2和5，3和6对称
// 文档给出是按照7段式SVPWM一点点按照矢量调制原理推到，中间推到有Uabc的三相电压
// T1和T1作用时间，Txyz时间最终等效Tabc三相输入占空比,
// Udc/√3=1，  单位1
// 调制利用率等于(1-0.04)=0.96=96%
// Ualpha和Ubeta是和uq ud等幅值变换
*/

/*
void SVPWM_Cale(M_SVPWM	pv)
{
	pv->u1 = pv->Ubeta;			// 相当于二相静止坐标--到三相静止变换出Uabc
	pv->u2 = pv->Ubeta*0.5f + pv->Ualpha*0.8660254f;
	pv->u3 = pv->u2 - pv->u1;

	//根据三相电压符号计算矢量扇区
	pv->VecSector = 3;
	pv->VecSector = (pv->u2 > 0) ? (pv->VecSector-1) : pv->VecSector;
	pv->VecSector = (pv->u3 > 0) ? (pv->VecSector-1) : pv->VecSector;
	pv->VecSector = (pv->u1 < 0) ? (7-pv->VecSector) : pv->VecSector;

	//根据矢量扇区计算矢量占空比Tabc
	if((pv->VecSector == 1) || (pv->VecSector == 4))
	{
		pv->Ta = pv->u2;
		pv->Tb = pv->u1 - pv->u3;
		pv->Tc = -pv->u2;
	}
	else if((pv->VecSector == 2) || (pv->VecSector ==5))
	{
		pv->Ta = pv->u3 + pv->u2;
		pv->Tb = pv->u1;
		pv->Tc = -pv->u1;
	}
	else if((pv->VecSector ==3) || (pv->VecSector == 6))
	{
		pv->Ta = pv->u3;
		pv->Tb = -pv->u3;
		pv->Tc = -(pv->u1 + pv->u2);
	}
	else					//异常状态下的判断出的扇区 0---7或者其他就执行0电压矢量
	{
		pv->Ta = 0;
		pv->Tb = 0;
		pv->Tc = 0;
	}

	//Tabc是带正负的浮点型数据，电压， pv->Tabc/Svpwm_Km是标幺值计算，将Tabc计算成-1 —— +1
	//将占空比调节为-1 —— +1， 再将PWM的半周期占空比值提出 （-1 —— +1 ）X 50% + 50% = 0 —— 100%
	TIM1->CCR1  = (u16)((pv->Ta * Svpwm_Km_Backw * TIM1_Period_Half) + TIM1_Period_Half);
	TIM1->CCR2  = (u16)((pv->Tb * Svpwm_Km_Backw * TIM1_Period_Half) + TIM1_Period_Half);
	TIM1->CCR3  = (u16)((pv->Tc * Svpwm_Km_Backw * TIM1_Period_Half) + TIM1_Period_Half);
}
*/

/*
void SVPWM_Cale(M_SVPWM	pv)
{
	pv->u1 = pv->Ubeta;
	pv->u2 = 0.866025f*pv->Ualpha  - 0.5f*pv->Ubeta;
	pv->u3 = -0.866025f*pv->Ualpha  - 0.5f*pv->Ubeta;

	pv->VecSector = 4*((pv->u3 > 0) ? 1:0) + 2*((pv->u2 > 0) ? 1:0) + ((pv->u1 > 0) ? 1:0);

	if(pv->VecSector == 3)							//sector 1
	{
		pv->Ta = Svpwm_Km_Backw * TS * pv->u2;
		pv->Tb = Svpwm_Km_Backw * TS * pv->u1;

		MODIFY_TX_TY(pv->Ta, pv->Tb, pv->Tc, TS);

		pv->T0 = TS - pv->Ta - pv->Tb;

		TIM1->CCR1 = (u16)(pv->T0/2/TS*TIM1_Period);
		TIM1->CCR2 = (u16)((pv->T0/2 + pv->Ta)/TS*TIM1_Period);
		TIM1->CCR3 = (u16)((pv->T0/2 + pv->Ta + pv->Tb)/TS*TIM1_Period);
	}
	else if(pv->VecSector == 1)					//sector 2
	{
		pv->Ta = Svpwm_Km_Backw * TS * (-pv->u2);
		pv->Tb = Svpwm_Km_Backw * TS * (-pv->u3);

		MODIFY_TX_TY(pv->Ta, pv->Tb, pv->Tc, TS);

		pv->T0 = TS - pv->Ta - pv->Tb;

		TIM1->CCR1 = (u16)((pv->T0/2 + pv->Ta)/TS*TIM1_Period);
		TIM1->CCR2 = (u16)(pv->T0/2/TS*TIM1_Period);
		TIM1->CCR3 = (u16)((pv->T0/2 + pv->Ta + pv->Tb)/TS*TIM1_Period);
	}
	else if(pv->VecSector == 5)					//sector 3
	{
		pv->Ta = Svpwm_Km_Backw * TS * pv->u1;
		pv->Tb = Svpwm_Km_Backw * TS * pv->u3;

		MODIFY_TX_TY(pv->Ta, pv->Tb, pv->Tc, TS);

		pv->T0 = TS - pv->Ta - pv->Tb;

		TIM1->CCR1 = (u16)((pv->T0/2 + pv->Ta + pv->Tb)/TS*TIM1_Period);
		TIM1->CCR2 = (u16)(pv->T0/2/TS*TIM1_Period);
		TIM1->CCR3 = (u16)((pv->T0/2 + pv->Ta)/TS*TIM1_Period);
	}
	else if(pv->VecSector == 4)					//sector 4
	{
		pv->Ta = Svpwm_Km_Backw * TS * (-pv->u1);
		pv->Tb = Svpwm_Km_Backw * TS * (-pv->u2);

		MODIFY_TX_TY(pv->Ta, pv->Tb, pv->Tc, TS);

		pv->T0 = TS - pv->Ta - pv->Tb;

		TIM1->CCR1 = (u16)((pv->T0/2 + pv->Ta + pv->Tb)/TS*TIM1_Period);
		TIM1->CCR2 = (u16)((pv->T0/2 + pv->Ta)/TS*TIM1_Period);
		TIM1->CCR3 = (u16)(pv->T0/2/TS*TIM1_Period);
	}
	else if(pv->VecSector == 6)					//sector 5
	{
		pv->Ta = Svpwm_Km_Backw * TS * pv->u3;
		pv->Tb = Svpwm_Km_Backw * TS * pv->u2;

		MODIFY_TX_TY(pv->Ta, pv->Tb, pv->Tc, TS);

		pv->T0 = TS - pv->Ta - pv->Tb;

		TIM1->CCR1 = (u16)((pv->T0/2 + pv->Ta)/TS*TIM1_Period);
		TIM1->CCR2 = (u16)((pv->T0/2 + pv->Ta + pv->Tb)/TS*TIM1_Period);
		TIM1->CCR3 = (u16)(pv->T0/2/TS*TIM1_Period);
	}
	else if(pv->VecSector == 2)					//sector 6
	{
		pv->Ta = Svpwm_Km_Backw * TS * (-pv->u3);
		pv->Tb = Svpwm_Km_Backw * TS * (-pv->u1);

		MODIFY_TX_TY(pv->Ta, pv->Tb, pv->Tc, TS);

		pv->T0 = TS - pv->Ta - pv->Tb;

		TIM1->CCR1 = (u16)(pv->T0/2/TS*TIM1_Period);
		TIM1->CCR2 = (u16)((pv->T0/2 + pv->Ta + pv->Tb)/TS*TIM1_Period);
		TIM1->CCR3 = (u16)((pv->T0/2 + pv->Ta)/TS*TIM1_Period);
	}
	else
	{
		TIM1->CCR1 = 0;
		TIM1->CCR2 = 0;
		TIM1->CCR3 = 0;
	}
}
*/


//中点平移SVPWM
//参考：https://zhuanlan.zhihu.com/p/514378119
void SVPWM_Cale(M_SVPWM	pv)
{   
    uint16_t  un ,vn ,wn ;
    float Vmax_pu = 0,Vmin_pu = 0,Vcom_pu;

    float oneOverDcBus_invV = 1.0f/ADC_Sample_F_Para.VBUS;
//		float oneOverDcBus_invV = 1.0f/Standard_Work_Voltage_V;

    float Valpha_pu = pv->Ualpha *oneOverDcBus_invV;
    float Vbeta_pu =  pv->Ubeta  *oneOverDcBus_invV;

    float Va_tmp = (float)(0.5f) * Valpha_pu;
    float Vb_tmp = SVGEN_SQRT3_OVER_2 * Vbeta_pu;

    float Va_pu = Valpha_pu;
    float Vb_pu = -Va_tmp + Vb_tmp;						// -0.5*Valpha + sqrt(3)/2 * Vbeta
    float Vc_pu = -Va_tmp - Vb_tmp;						// -0.5*Valpha - sqrt(3)/2 * Vbeta

 
	  pv->u1=Va_pu*ADC_Sample_F_Para.VBUS;
  	  pv->u2=Vb_pu*ADC_Sample_F_Para.VBUS;	
	  pv->u3=Vc_pu*ADC_Sample_F_Para.VBUS;
	
	
    // Find Vmax and Vmin
    if(Va_pu > Vb_pu)
    {
        Vmax_pu = Va_pu;
        Vmin_pu = Vb_pu;
    }
    else
    {
        Vmax_pu = Vb_pu;
        Vmin_pu = Va_pu;
    }

    if(Vc_pu > Vmax_pu)
    {
        Vmax_pu = Vc_pu;
    }
    else if(Vc_pu < Vmin_pu)
    {
        Vmin_pu = Vc_pu;
    }

    Vcom_pu = (float)0.5f * (Vmax_pu + Vmin_pu);			// Compute Vcom = 0.5*(Vmax+Vmin)

    // Subtract common-mode term to achieve SV modulation
    pv->Ta = (Va_pu - Vcom_pu);   //+ - 0.5
    pv->Tb = (Vb_pu - Vcom_pu);
    pv->Tc = (Vc_pu - Vcom_pu);

//    TIM1->CCR1 = (u16)((Limit_Sat(pv->Ta, 0.5f, -0.5f)+ 0.5f)*TIM1_Period);  // 8400 满载的  
//    TIM1->CCR2 = (u16)((Limit_Sat(pv->Tb, 0.5f, -0.5f)+ 0.5f)*TIM1_Period);
//    TIM1->CCR3 = (u16)((Limit_Sat(pv->Tc, 0.5f, -0.5f)+ 0.5f)*TIM1_Period);
//    
    
        un= (uint16_t)((Limit_Sat(pv->Ta, 0.5f, -0.5f)+ 0.5f)* MCPWM_Period);  //  3000
        vn= (uint16_t)((Limit_Sat(pv->Tb, 0.5f, -0.5f)+ 0.5f)* MCPWM_Period);  //  3000
        wn= (uint16_t)((Limit_Sat(pv->Tc, 0.5f, -0.5f)+ 0.5f)* MCPWM_Period);  //  3000
        
        
//
//        
        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, un);          //b15  1L ??? down       B14  1h  ??? up adc    mk ?act +- inv?
        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_2, vn);         // b13  2L                B12  2h
        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_3, wn); 	    //  B11  3L                b10  3H
		 

        
//        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_1, 1500);          //b15  1L ??? down       B14  1h  ??? up adc    mk ?act +- inv?
//        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_2, 1500);         // b13  2L                B12  2h
//        MCPWM_ChannelPrimaryDutySet(MCPWM_CH_3, 1500); 	    //  B11  3L                b10  3H 
        
        
        
//		pv->u1=TIM1->CCR1*ADC_Sample_F_Para.VBUS;
//  	pv->u2=TIM1->CCR2*ADC_Sample_F_Para.VBUS;	
//	    pv->u3=TIM1->CCR3*ADC_Sample_F_Para.VBUS;
		
		
		
		
    return;
}




