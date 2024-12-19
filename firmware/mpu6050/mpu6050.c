
#include "mpu6050.h"
#include "definitions.h"                // SYS function prototypes


/**
  * @brief   写数据到MPU6050寄存器
  * @param   
  * @retval  
  */
void MPU6050_WriteReg(uint8_t reg_add,uint8_t reg_dat)
{
//	i2c_Start();
//	i2c_SendByte(MPU6050_SLAVE_ADDRESS);
//	i2c_WaitAck();
//	i2c_SendByte(reg_add);
//	i2c_WaitAck();
//	i2c_SendByte(reg_dat);
//	i2c_WaitAck();
//	i2c_Stop();
}


/**
  * @brief   从MPU6050寄存器读取数据
  * @param   
  * @retval  
  */
//void I2C1_Read(uint8_t reg_add,unsigned char*Read,uint8_t num)
//{
//	unsigned char i;
//	
//	i2c_Start();
//	i2c_SendByte(MPU6050_SLAVE_ADDRESS);
//	i2c_WaitAck();
//	i2c_SendByte(reg_add);
//	i2c_WaitAck();
//	
//	i2c_Start();
//	i2c_SendByte(MPU6050_SLAVE_ADDRESS+1);
//	i2c_WaitAck();
//	
//	for(i=0;i<(num-1);i++){
//		*Read=i2c_ReadByte(1);
//		Read++;
//	}
//	*Read=i2c_ReadByte(0);
//	i2c_Stop();
//}




/**
 * @brief  读寄存器，这是提供给上层的接口
 * @param  slave_addr: 从机地址
 * @param 	reg_addr:寄存器地址
 * @param len：要读取的长度
 *	@param data_ptr:指向要存储数据的指针
 * @retval 正常为0，不正常为非0
 */
//_Bool  I2C1_Read(uint8_t reg_add,unsigned char*Read,uint8_t num)
//{
////    I2C_BufferRead(Read,reg_add,num);
//    I2C1_Read((uint16_t)reg_add ,(uint8_t)Read ,(size_t)num);
//}

/**
 * @brief  写寄存器，这是提供给上层的接口
 * @param  slave_addr: 从机地址
 * @param 	reg_addr:寄存器地址
 * @param len：写入的长度
 *	@param data_ptr:指向要写入的数据
 * @retval 正常为0，不正常为非0
 */
//void MPU6050_WriteReg(uint8_t reg_add,uint8_t reg_dat)
//{
////    I2C_ByteWrite(reg_dat,reg_add);
//}






/**
  * @brief   初始化MPU6050芯片
  * @param   
  * @retval  
  */
void MPU6050_Init(void)
{
  int i=0,j=0;
  //在初始化之前要延时一段时间，若没有延时，则断电后再上电数据可能会出错
  for(i=0;i<1000;i++)
  {
    for(j=0;j<10000;j++)
    {
      ;
    }
  }
  
    uint8_t a=0x00;
    uint8_t b=0x07;
    uint8_t c=0x06;
    uint8_t d=0x00;
    uint8_t e=0x18;
    
        I2C1_CallbackRegister( APP_I2C1Callback, (uintptr_t)NULL ); 
        while((I2C1_Write(MPU6050_RA_PWR_MGMT_1,&a,1)==false)) ;
  
        I2C1_CallbackRegister( APP_I2C1Callback, (uintptr_t)NULL ); 
        while(I2C1_Write(MPU6050_RA_SMPLRT_DIV,&b,1)==false) ;
       
        I2C1_CallbackRegister( APP_I2C1Callback, (uintptr_t)NULL ); 
        while(I2C1_Write(MPU6050_RA_CONFIG,&c,1)==false) ;
       
        I2C1_CallbackRegister( APP_I2C1Callback, (uintptr_t)NULL ); 
        while(I2C1_Write(MPU6050_RA_ACCEL_CONFIG,&d,1)==false) ;
       
        I2C1_CallbackRegister( APP_I2C1Callback, (uintptr_t)NULL ); 
        while(I2C1_Write(MPU6050_RA_GYRO_CONFIG,&e,1)==false) ;
       

}

/**
  * @brief   读取MPU6050的ID
  * @param   
  * @retval  
  */
uint8_t MPU6050ReadID(void)
{
	    static volatile  uint8_t Re ;
        static volatile  uint8_t de ;
        static uint8_t i2cWrData = MPU6050_RA_WHO_AM_I;    
       I2C1_CallbackRegister( APP_I2C1Callback, (uintptr_t)NULL ); 
     
     while(  (I2C1_WriteRead(MPU6050_ADDRESS_AD0_LOW, &i2cWrData, 1 ,&Re ,1) ==false));
//    I2C1_Read(MPU6050_RA_WHO_AM_I,&Re,1);    //读器件地址
	if(Re !=0x68)
	{
//		printf("MPU6050 dectected error!\r\n检测不到MPU6050模块，请检查模块与开发板的接线");
		return 0;
	}
	else
	{
//		printf("MPU6050 ID = %d\r\n",Re);
		return 1;
	}
		
}
/**
  * @brief   读取MPU6050的加速度数据
  * @param   
  * @retval  
  */
 MPU6050ReadAcc(short *accData)
{
    uint8_t buf[6];
     I2C1_Read(MPU6050_ACC_OUT, buf, 6);
    accData[0] = (buf[0] << 8) | buf[1];
    accData[1] = (buf[2] << 8) | buf[3];
    accData[2] = (buf[4] << 8) | buf[5];
     
}

/**
  * @brief   读取MPU6050的角加速度数据
  * @param   
  * @retval  
  */
 MPU6050ReadGyro(short *gyroData)
{
    uint8_t buf[6];
    I2C1_Read(MPU6050_GYRO_OUT,buf,6);
    gyroData[0] = (buf[0] << 8) | buf[1];
    gyroData[1] = (buf[2] << 8) | buf[3];
    gyroData[2] = (buf[4] << 8) | buf[5];
}


/**
  * @brief   读取MPU6050的原始温度数据
  * @param   
  * @retval  
  */
 MPU6050ReadTemp(short *tempData)
{
	uint8_t buf[2];
    I2C1_Read(MPU6050_RA_TEMP_OUT_H,buf,2);     //读取温度值
    *tempData = (buf[0] << 8) | buf[1];
}


/**
  * @brief   读取MPU6050的温度数据，转化成摄氏度
  * @param   
  * @retval  
  */
void MPU6050_ReturnTemp(float *Temperature)
{
	short temp3;
	uint8_t buf[2];
	
	I2C1_Read(MPU6050_RA_TEMP_OUT_H,buf,2);     //读取温度值
  temp3= (buf[0] << 8) | buf[1];	
	*Temperature=((double) temp3/340.0)+36.53;

}
