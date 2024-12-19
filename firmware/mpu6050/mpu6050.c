
#include "mpu6050.h"
#include "definitions.h"                // SYS function prototypes


/**
  * @brief   д���ݵ�MPU6050�Ĵ���
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
  * @brief   ��MPU6050�Ĵ�����ȡ����
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
 * @brief  ���Ĵ����������ṩ���ϲ�Ľӿ�
 * @param  slave_addr: �ӻ���ַ
 * @param 	reg_addr:�Ĵ�����ַ
 * @param len��Ҫ��ȡ�ĳ���
 *	@param data_ptr:ָ��Ҫ�洢���ݵ�ָ��
 * @retval ����Ϊ0��������Ϊ��0
 */
//_Bool  I2C1_Read(uint8_t reg_add,unsigned char*Read,uint8_t num)
//{
////    I2C_BufferRead(Read,reg_add,num);
//    I2C1_Read((uint16_t)reg_add ,(uint8_t)Read ,(size_t)num);
//}

/**
 * @brief  д�Ĵ����������ṩ���ϲ�Ľӿ�
 * @param  slave_addr: �ӻ���ַ
 * @param 	reg_addr:�Ĵ�����ַ
 * @param len��д��ĳ���
 *	@param data_ptr:ָ��Ҫд�������
 * @retval ����Ϊ0��������Ϊ��0
 */
//void MPU6050_WriteReg(uint8_t reg_add,uint8_t reg_dat)
//{
////    I2C_ByteWrite(reg_dat,reg_add);
//}






/**
  * @brief   ��ʼ��MPU6050оƬ
  * @param   
  * @retval  
  */
void MPU6050_Init(void)
{
  int i=0,j=0;
  //�ڳ�ʼ��֮ǰҪ��ʱһ��ʱ�䣬��û����ʱ����ϵ�����ϵ����ݿ��ܻ����
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
  * @brief   ��ȡMPU6050��ID
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
//    I2C1_Read(MPU6050_RA_WHO_AM_I,&Re,1);    //��������ַ
	if(Re !=0x68)
	{
//		printf("MPU6050 dectected error!\r\n��ⲻ��MPU6050ģ�飬����ģ���뿪����Ľ���");
		return 0;
	}
	else
	{
//		printf("MPU6050 ID = %d\r\n",Re);
		return 1;
	}
		
}
/**
  * @brief   ��ȡMPU6050�ļ��ٶ�����
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
  * @brief   ��ȡMPU6050�ĽǼ��ٶ�����
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
  * @brief   ��ȡMPU6050��ԭʼ�¶�����
  * @param   
  * @retval  
  */
 MPU6050ReadTemp(short *tempData)
{
	uint8_t buf[2];
    I2C1_Read(MPU6050_RA_TEMP_OUT_H,buf,2);     //��ȡ�¶�ֵ
    *tempData = (buf[0] << 8) | buf[1];
}


/**
  * @brief   ��ȡMPU6050���¶����ݣ�ת�������϶�
  * @param   
  * @retval  
  */
void MPU6050_ReturnTemp(float *Temperature)
{
	short temp3;
	uint8_t buf[2];
	
	I2C1_Read(MPU6050_RA_TEMP_OUT_H,buf,2);     //��ȡ�¶�ֵ
  temp3= (buf[0] << 8) | buf[1];	
	*Temperature=((double) temp3/340.0)+36.53;

}
