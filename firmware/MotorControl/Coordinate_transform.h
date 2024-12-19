#ifndef __COORDINATE_TRANSFORM_H
#define __COORDINATE_TRANSFORM_H



typedef struct {
    float		Iu;			//�������A
    float 	    Iv;			//�������B
    float		Iw;			//�����·C
    float		Alpha;	//���ྲֹ����ϵ Alpha ��
    float		Beta;		//���ྲֹ����ϵ Beta ��
} CLARKE, *M_CLARKE;

typedef struct {
    float 	Alpha;		//���ྲֹ����ϵ Alpha ��
    float 	Beta;			//���ྲֹ����ϵ Beta ��
    float	Theta;		//�����Ƕ�
    float 	Ds;				//���������ת����ϵ�µ�d�����
    float 	Qs;				//���������ת����ϵ�µ�q�����
} PARK, *M_PARK;

typedef struct {
    float 	Alpha;		//���ྲֹ����ϵ Alpha ��
    float 	Beta;			//���ྲֹ����ϵ Beta ��
    float	 	Theta;		//�����Ƕ�
    float 	Ds;				//���������ת����ϵ�µ�d�����
    float 	Qs;				//���������ת����ϵ�µ�q�����
} IPARK, *M_IPARK;

typedef struct {
    float		Vu;			//????A
    float 	    Vv;			//????B
    float		Vw;			//????C
    float		Alpha;	   //??????? Alpha ?
    float		Beta;		//??????? Beta ?
} ICLARKE, *M_ICLARKE;

#define  CLARKE_DEFAULTS {0,0,0,0,0}  	// CLARK��ʼ������
#define  PARK_DEFAULTS {0,0,0,0,0}  		// PARK��ʼ������
#define  IPARK_DEFAULTS {0,0,0,0,0}   	// IPARK��ʼ������
#define  ICLARKE_DEFAULTS {0,0,0,0,0}   	// ICLARK��ʼ������


void CLARKE_Cale(M_CLARKE pv);		//Clark�任
void PARK_Cale(M_PARK pv);			//Park�任
void IPARK_Cale(M_IPARK pv);		//Park���任
void ICLARKE_Cale(M_ICLARKE pv);		//Park���任


#endif

