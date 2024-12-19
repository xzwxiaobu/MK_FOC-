#ifndef __COORDINATE_TRANSFORM_H
#define __COORDINATE_TRANSFORM_H



typedef struct {
    float		Iu;			//三相电流A
    float 	    Iv;			//三相电流B
    float		Iw;			//三相电路C
    float		Alpha;	//二相静止坐标系 Alpha 轴
    float		Beta;		//二相静止坐标系 Beta 轴
} CLARKE, *M_CLARKE;

typedef struct {
    float 	Alpha;		//二相静止坐标系 Alpha 轴
    float 	Beta;			//二相静止坐标系 Beta 轴
    float	Theta;		//电机电角度
    float 	Ds;				//电机二相旋转坐标系下的d轴电流
    float 	Qs;				//电机二相旋转坐标系下的q轴电流
} PARK, *M_PARK;

typedef struct {
    float 	Alpha;		//二相静止坐标系 Alpha 轴
    float 	Beta;			//二相静止坐标系 Beta 轴
    float	 	Theta;		//电机电角度
    float 	Ds;				//电机二相旋转坐标系下的d轴电流
    float 	Qs;				//电机二相旋转坐标系下的q轴电流
} IPARK, *M_IPARK;

typedef struct {
    float		Vu;			//????A
    float 	    Vv;			//????B
    float		Vw;			//????C
    float		Alpha;	   //??????? Alpha ?
    float		Beta;		//??????? Beta ?
} ICLARKE, *M_ICLARKE;

#define  CLARKE_DEFAULTS {0,0,0,0,0}  	// CLARK初始化参数
#define  PARK_DEFAULTS {0,0,0,0,0}  		// PARK初始化参数
#define  IPARK_DEFAULTS {0,0,0,0,0}   	// IPARK初始化参数
#define  ICLARKE_DEFAULTS {0,0,0,0,0}   	// ICLARK初始化参数


void CLARKE_Cale(M_CLARKE pv);		//Clark变换
void PARK_Cale(M_PARK pv);			//Park变换
void IPARK_Cale(M_IPARK pv);		//Park反变换
void ICLARKE_Cale(M_ICLARKE pv);		//Park反变换


#endif

