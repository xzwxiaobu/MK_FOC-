#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic32mk_mcm_curiosity_pro.mk)" "nbproject/Makefile-local-pic32mk_mcm_curiosity_pro.mk"
include nbproject/Makefile-local-pic32mk_mcm_curiosity_pro.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic32mk_mcm_curiosity_pro
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c ../src/config/pic32mk_mcm_curiosity_pro/initialization.c ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c ../src/newfile.c ../src/main.c "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Coordinate_transform.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/FOC_Control.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Motor.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/PI_Cale.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/SVPWM.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/vofa/vofa.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1224054987/plib_adchs.o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ${OBJECTDIR}/_ext/865762238/plib_clk.o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ${OBJECTDIR}/_ext/1433418692/initialization.o ${OBJECTDIR}/_ext/1433418692/interrupts.o ${OBJECTDIR}/_ext/1433418692/exceptions.o ${OBJECTDIR}/_ext/1360937237/newfile.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o ${OBJECTDIR}/_ext/423055883/FOC_Control.o ${OBJECTDIR}/_ext/423055883/Motor.o ${OBJECTDIR}/_ext/423055883/PI_Cale.o ${OBJECTDIR}/_ext/423055883/SVPWM.o ${OBJECTDIR}/_ext/813588705/vofa.o ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o ${OBJECTDIR}/_ext/227981847/plib_wdt.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d ${OBJECTDIR}/_ext/865762238/plib_clk.o.d ${OBJECTDIR}/_ext/1068756373/plib_evic.o.d ${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d ${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d ${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d ${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d ${OBJECTDIR}/_ext/865749003/plib_qei1.o.d ${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d ${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d ${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d ${OBJECTDIR}/_ext/1433418692/initialization.o.d ${OBJECTDIR}/_ext/1433418692/interrupts.o.d ${OBJECTDIR}/_ext/1433418692/exceptions.o.d ${OBJECTDIR}/_ext/1360937237/newfile.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o.d ${OBJECTDIR}/_ext/423055883/FOC_Control.o.d ${OBJECTDIR}/_ext/423055883/Motor.o.d ${OBJECTDIR}/_ext/423055883/PI_Cale.o.d ${OBJECTDIR}/_ext/423055883/SVPWM.o.d ${OBJECTDIR}/_ext/813588705/vofa.o.d ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o.d ${OBJECTDIR}/_ext/227981847/plib_wdt.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1224054987/plib_adchs.o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ${OBJECTDIR}/_ext/865762238/plib_clk.o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ${OBJECTDIR}/_ext/1433418692/initialization.o ${OBJECTDIR}/_ext/1433418692/interrupts.o ${OBJECTDIR}/_ext/1433418692/exceptions.o ${OBJECTDIR}/_ext/1360937237/newfile.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o ${OBJECTDIR}/_ext/423055883/FOC_Control.o ${OBJECTDIR}/_ext/423055883/Motor.o ${OBJECTDIR}/_ext/423055883/PI_Cale.o ${OBJECTDIR}/_ext/423055883/SVPWM.o ${OBJECTDIR}/_ext/813588705/vofa.o ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o ${OBJECTDIR}/_ext/227981847/plib_wdt.o

# Source Files
SOURCEFILES=../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c ../src/config/pic32mk_mcm_curiosity_pro/initialization.c ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c ../src/newfile.c ../src/main.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Coordinate_transform.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/FOC_Control.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Motor.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/PI_Cale.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/SVPWM.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/vofa/vofa.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic32mk_mcm_curiosity_pro.mk dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MK1024MCM100
MP_LINKER_FILE_OPTION=,--script="..\src\config\pic32mk_mcm_curiosity_pro\p32MK1024MCM100.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1224054987/plib_adchs.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/67c9dc3e2fc80de5259c37ecec7390558fe3766a .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1224054987" 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1224054987/plib_adchs.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/1f246b32af289ec5b951ae8c517ede9a3ade9828 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/4daf0c75cee771f245e18f3fd559b75666bb22bd .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865762238/plib_clk.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/a8f3912da3a541590c428aa61b9071a41556c4cb .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865762238" 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865762238/plib_clk.o.d" -o ${OBJECTDIR}/_ext/865762238/plib_clk.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068756373/plib_evic.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/191b5673eb18c83907b349ac0ce07f5dd99b0525 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068756373" 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068756373/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068702545/plib_gpio.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/1b149e43fb3855958bd3279df6b0e886ce47a339 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068702545" 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/604fcf3c23cce937c46af475e4e5b5f93a0a0688 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1540640169" 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/541ddd266676128ec3773b41c14341a97fb6d848 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap5.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/7bceec97dcd09435bfdc87a93baaf41399d84088 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/73c7a5404cf977ac1c4d30c251ffc0e08e688b6e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/6f28afab836df9f775f671ccec647d0d33303136 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1235120400" 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/a24ac66cfb2cda26735691bfe9234a8fe04f0c02 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ed006e6c8407b3c4cf51f95ee14e003ee1b41182 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/241c4ad48a9cc01242f9aba04421f337c57c412f .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865749003/plib_qei1.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b4deb0bd160121a940492246f4cdb2ae8014cf32 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865749003" 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o.d 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865749003/plib_qei1.o.d" -o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/76bb60f3708764bff1a9207ed67333cbec063692 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/c9637270f2de4ab44cfcf7bca93fd60f9c77e6de .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068299602/plib_uart6.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3b11a35f14ce7f0e732429b0c090cecd05bb448b .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068299602" 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163999990/xc32_monitor.o: ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3d4bb22c8ba3d4e50172bddcf953a90fd4fe7146 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1163999990" 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/initialization.o: ../src/config/pic32mk_mcm_curiosity_pro/initialization.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/256cfe53eebf1c37ca5d872aae0d2b521fd56514 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/initialization.o.d" -o ${OBJECTDIR}/_ext/1433418692/initialization.o ../src/config/pic32mk_mcm_curiosity_pro/initialization.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/interrupts.o: ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/445f4b65bf11cc94e08443744c8f961b3d0afcd5 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/interrupts.o.d" -o ${OBJECTDIR}/_ext/1433418692/interrupts.o ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/exceptions.o: ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/5da0f0f9f2a0bdb5efad778ba273a10c669b0751 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/exceptions.o.d" -o ${OBJECTDIR}/_ext/1433418692/exceptions.o ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/newfile.o: ../src/newfile.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/dac702958c1cb042d13cb2793f8a9ec1c1306222 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/newfile.o.d" -o ${OBJECTDIR}/_ext/1360937237/newfile.o ../src/newfile.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/447a922e5ce2640a00d20d16797fa6169e3e56c3 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/Coordinate_transform.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Coordinate_transform.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f83f780ce110ccf83e1e3be251467647b8154e7d .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/Coordinate_transform.o.d" -o ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Coordinate_transform.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/FOC_Control.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/FOC_Control.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b6d172371c8e13613c2edd44d8ec137d8ad16a32 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/FOC_Control.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/FOC_Control.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/FOC_Control.o.d" -o ${OBJECTDIR}/_ext/423055883/FOC_Control.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/FOC_Control.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/Motor.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Motor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/5cfbadc3326840517d1287444cbfebc2bd6d8f29 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/Motor.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/Motor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/Motor.o.d" -o ${OBJECTDIR}/_ext/423055883/Motor.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Motor.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/PI_Cale.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/PI_Cale.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/9f21b103d1fa6f7cd5ade58a5149fe4776f516ce .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/PI_Cale.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/PI_Cale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/PI_Cale.o.d" -o ${OBJECTDIR}/_ext/423055883/PI_Cale.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/PI_Cale.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/SVPWM.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/SVPWM.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/858893408d5d6709525225c598bade8ffb3a76a5 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/SVPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/SVPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/SVPWM.o.d" -o ${OBJECTDIR}/_ext/423055883/SVPWM.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/SVPWM.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/813588705/vofa.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/vofa/vofa.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/c9146d979ebdc002f8c08dfbb937e37436e9297d .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/813588705" 
	@${RM} ${OBJECTDIR}/_ext/813588705/vofa.o.d 
	@${RM} ${OBJECTDIR}/_ext/813588705/vofa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/813588705/vofa.o.d" -o ${OBJECTDIR}/_ext/813588705/vofa.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/vofa/vofa.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1978316258/plib_eeprom.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ddc909d4f90b2f6f59a7d00eec07683a8b38baa8 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1978316258" 
	@${RM} ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1978316258/plib_eeprom.o.d" -o ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/227981847/plib_wdt.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f5a75f31f4ae420b085b2cb703ae6f3adcaafa30 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/227981847" 
	@${RM} ${OBJECTDIR}/_ext/227981847/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/227981847/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/227981847/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/227981847/plib_wdt.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1224054987/plib_adchs.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/76bbc5840b055110c7e27885351643d0ede7304c .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1224054987" 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1224054987/plib_adchs.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3fde161ec29de46fae4577994e10779e6b244147 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3bfb2b03be0eafd83076f05b2c261c326ef977c4 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865762238/plib_clk.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/29a5e37efaaf41abab5d5c481ec6ba1d4424ba1f .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865762238" 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865762238/plib_clk.o.d" -o ${OBJECTDIR}/_ext/865762238/plib_clk.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068756373/plib_evic.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e1fd28cfbc2101d75a59e7b5909115b8b3930163 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068756373" 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068756373/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068702545/plib_gpio.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/fe2da2dc0dc4702a2e6576580f3aaf1a4087e466 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068702545" 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/84233f15dd80531058cae546f7b052befedcb25e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1540640169" 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/4906af9f8082fa6301390a32043d4430a7e56ff9 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap5.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3e1fe309dbfd2ea8e6f1809cd367f0f9c094c93a .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b590b60d91c0ade918fb979f5cf2b13babd5cafb .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/519c5f7e6d6f63c8045d04024f3aa2ccfecc4368 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1235120400" 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f748aa8694f98c052ec0501b688a04abecbe3900 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3a8b37d8c6bf1adbaf742e394ae58a1db562c5c8 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3f00e124777b6b2b372324df2182623bc372b32e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865749003/plib_qei1.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/a20a8fdbd889a446c9163491cb636fbeb11d6e90 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865749003" 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o.d 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865749003/plib_qei1.o.d" -o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ad5aabd163ae97329615a8a3cd77e00677a8019c .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/eadf6ed3fcbceb96512aec13f2c513d24b6a2262 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068299602/plib_uart6.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/4fc5a0c645543218778fc9ff1ecfcf8240cbb32a .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068299602" 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163999990/xc32_monitor.o: ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b88669335b924150639c047b92acb3851371a18b .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1163999990" 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/initialization.o: ../src/config/pic32mk_mcm_curiosity_pro/initialization.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f5612975e5e2151f8fd09f20747dd9a08217e15b .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/initialization.o.d" -o ${OBJECTDIR}/_ext/1433418692/initialization.o ../src/config/pic32mk_mcm_curiosity_pro/initialization.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/interrupts.o: ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/9cc71cdb1cec95885c028a6cb412e7984426efa1 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/interrupts.o.d" -o ${OBJECTDIR}/_ext/1433418692/interrupts.o ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/exceptions.o: ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3cf3a383a5238fb0bc62d2225ac30b3d53d4879d .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/exceptions.o.d" -o ${OBJECTDIR}/_ext/1433418692/exceptions.o ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/newfile.o: ../src/newfile.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f8ee784f0aeb7cf5d399015fb57417f8a5ba3456 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/newfile.o.d" -o ${OBJECTDIR}/_ext/1360937237/newfile.o ../src/newfile.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/87a64250e3ab5ea522092500470b6583605e9670 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/Coordinate_transform.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Coordinate_transform.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/851400b3bdbdf1dcd45831c1eebd4cf076d6c480 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/Coordinate_transform.o.d" -o ${OBJECTDIR}/_ext/423055883/Coordinate_transform.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Coordinate_transform.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/FOC_Control.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/FOC_Control.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/50923e819daeb3990a6a111c248178ea3da3d9a .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/FOC_Control.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/FOC_Control.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/FOC_Control.o.d" -o ${OBJECTDIR}/_ext/423055883/FOC_Control.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/FOC_Control.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/Motor.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Motor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/49067c7e581f4d8123d37ddade4a8418ddaabb8f .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/Motor.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/Motor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/Motor.o.d" -o ${OBJECTDIR}/_ext/423055883/Motor.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/Motor.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/PI_Cale.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/PI_Cale.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/84e78e4ea73d9eed5ae9128fa9bd76f586254549 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/PI_Cale.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/PI_Cale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/PI_Cale.o.d" -o ${OBJECTDIR}/_ext/423055883/PI_Cale.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/PI_Cale.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/423055883/SVPWM.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/SVPWM.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/1ec786b8ef547750cf0ae2fe409a1c468db8892e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/423055883" 
	@${RM} ${OBJECTDIR}/_ext/423055883/SVPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/423055883/SVPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/423055883/SVPWM.o.d" -o ${OBJECTDIR}/_ext/423055883/SVPWM.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/MotorControl/SVPWM.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/813588705/vofa.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/vofa/vofa.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e59389cb12d9893bce867a072b0f144ef0e11de6 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/813588705" 
	@${RM} ${OBJECTDIR}/_ext/813588705/vofa.o.d 
	@${RM} ${OBJECTDIR}/_ext/813588705/vofa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/813588705/vofa.o.d" -o ${OBJECTDIR}/_ext/813588705/vofa.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/vofa/vofa.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1978316258/plib_eeprom.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e79e36fd8842e1e531c00737211880c568b816c2 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1978316258" 
	@${RM} ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1978316258/plib_eeprom.o.d" -o ${OBJECTDIR}/_ext/1978316258/plib_eeprom.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/227981847/plib_wdt.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/826e9481f6b07b979b4175f4b493e510b8db3e16 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/227981847" 
	@${RM} ${OBJECTDIR}/_ext/227981847/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/227981847/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/227981847/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/227981847/plib_wdt.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/dcu1000/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/pic32mk_mcm_curiosity_pro/p32MK1024MCM100.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x36F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/pic32mk_mcm_curiosity_pro/p32MK1024MCM100.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/dcu_1000_xzw.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/pic32mk_mcm_curiosity_pro
	${RM} -r dist/pic32mk_mcm_curiosity_pro

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
