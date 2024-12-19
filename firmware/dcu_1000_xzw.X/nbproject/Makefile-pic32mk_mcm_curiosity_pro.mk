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
SOURCEFILES_QUOTED_IF_SPACED="F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/SVPWM.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Coordinate_transform.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/FOC_Control.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Motor.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/PI_Cale.c" "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/Speed_Enconder_HALLCAL.c" ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c" ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c" ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c ../src/config/pic32mk_mcm_curiosity_pro/initialization.c ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c ../src/newfile.c "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/vofa/vofa.c" ../src/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/937536079/SVPWM.o ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o ${OBJECTDIR}/_ext/937536079/FOC_Control.o ${OBJECTDIR}/_ext/937536079/Motor.o ${OBJECTDIR}/_ext/937536079/PI_Cale.o ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o ${OBJECTDIR}/_ext/1224054987/plib_adchs.o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ${OBJECTDIR}/_ext/865762238/plib_clk.o ${OBJECTDIR}/_ext/13355528/plib_eeprom.o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ${OBJECTDIR}/_ext/804485199/plib_wdt.o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ${OBJECTDIR}/_ext/1433418692/initialization.o ${OBJECTDIR}/_ext/1433418692/interrupts.o ${OBJECTDIR}/_ext/1433418692/exceptions.o ${OBJECTDIR}/_ext/1360937237/newfile.o ${OBJECTDIR}/_ext/1843287867/vofa.o ${OBJECTDIR}/_ext/1360937237/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/937536079/SVPWM.o.d ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o.d ${OBJECTDIR}/_ext/937536079/FOC_Control.o.d ${OBJECTDIR}/_ext/937536079/Motor.o.d ${OBJECTDIR}/_ext/937536079/PI_Cale.o.d ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o.d ${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d ${OBJECTDIR}/_ext/865762238/plib_clk.o.d ${OBJECTDIR}/_ext/13355528/plib_eeprom.o.d ${OBJECTDIR}/_ext/1068756373/plib_evic.o.d ${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d ${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d ${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d ${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d ${OBJECTDIR}/_ext/865749003/plib_qei1.o.d ${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d ${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d ${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d ${OBJECTDIR}/_ext/804485199/plib_wdt.o.d ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d ${OBJECTDIR}/_ext/1433418692/initialization.o.d ${OBJECTDIR}/_ext/1433418692/interrupts.o.d ${OBJECTDIR}/_ext/1433418692/exceptions.o.d ${OBJECTDIR}/_ext/1360937237/newfile.o.d ${OBJECTDIR}/_ext/1843287867/vofa.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/937536079/SVPWM.o ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o ${OBJECTDIR}/_ext/937536079/FOC_Control.o ${OBJECTDIR}/_ext/937536079/Motor.o ${OBJECTDIR}/_ext/937536079/PI_Cale.o ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o ${OBJECTDIR}/_ext/1224054987/plib_adchs.o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ${OBJECTDIR}/_ext/865762238/plib_clk.o ${OBJECTDIR}/_ext/13355528/plib_eeprom.o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ${OBJECTDIR}/_ext/804485199/plib_wdt.o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ${OBJECTDIR}/_ext/1433418692/initialization.o ${OBJECTDIR}/_ext/1433418692/interrupts.o ${OBJECTDIR}/_ext/1433418692/exceptions.o ${OBJECTDIR}/_ext/1360937237/newfile.o ${OBJECTDIR}/_ext/1843287867/vofa.o ${OBJECTDIR}/_ext/1360937237/main.o

# Source Files
SOURCEFILES=F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/SVPWM.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Coordinate_transform.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/FOC_Control.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Motor.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/PI_Cale.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/Speed_Enconder_HALLCAL.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c ../src/config/pic32mk_mcm_curiosity_pro/initialization.c ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c ../src/newfile.c F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/vofa/vofa.c ../src/main.c



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
${OBJECTDIR}/_ext/937536079/SVPWM.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/SVPWM.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/8450411a6b2e134a2ab63f7f46459308b35d9c97 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/SVPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/SVPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/SVPWM.o.d" -o ${OBJECTDIR}/_ext/937536079/SVPWM.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/SVPWM.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/Coordinate_transform.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/Coordinate_transform.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/15639e83a74acd686456b830f63ba2f629e09379 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/Coordinate_transform.o.d" -o ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Coordinate_transform.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/FOC_Control.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/FOC_Control.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/27773614ef210b12444fd2d04bbaca31aec6a611 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/FOC_Control.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/FOC_Control.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/FOC_Control.o.d" -o ${OBJECTDIR}/_ext/937536079/FOC_Control.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/FOC_Control.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/Motor.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/Motor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/6a96104b0512b02787067ce9100aad7c9e793c8e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/Motor.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/Motor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/Motor.o.d" -o ${OBJECTDIR}/_ext/937536079/Motor.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Motor.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/PI_Cale.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/PI_Cale.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/81106126d6da7a55cf2b596008fa16cee62b55a .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/PI_Cale.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/PI_Cale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/PI_Cale.o.d" -o ${OBJECTDIR}/_ext/937536079/PI_Cale.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/PI_Cale.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/src/Speed_Enconder_HALLCAL.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/58466631a4fc463768533afd8abf2b7648981964 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1880204547" 
	@${RM} ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o.d" -o ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/Speed_Enconder_HALLCAL.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1224054987/plib_adchs.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/130389a7cc1b345ba09bffa27c15ee86922e7c3f .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1224054987" 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1224054987/plib_adchs.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/7742eb455c9c6c81b1db20b6ce120b6576d307aa .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/a9b0b426686bb54d1c34b8b5ac11fe9b3e1f88ad .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865762238/plib_clk.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/85076de1a7d59c86d5cc2cd75de39c1c2db7f4b6 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865762238" 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865762238/plib_clk.o.d" -o ${OBJECTDIR}/_ext/865762238/plib_clk.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/13355528/plib_eeprom.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/84c56daab93dd87d7fac3161d51e59b14d8f19a2 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/13355528" 
	@${RM} ${OBJECTDIR}/_ext/13355528/plib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/13355528/plib_eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/13355528/plib_eeprom.o.d" -o ${OBJECTDIR}/_ext/13355528/plib_eeprom.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068756373/plib_evic.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/8e47fe3e432bfded13809d51cf48f554ec8d2284 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068756373" 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068756373/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068702545/plib_gpio.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/9a57e6522f638d383e4758c3d8e7d37e13711163 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068702545" 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f0fd2b250b65204eaca540473d5a1f85a53ae1c8 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1540640169" 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/8bd1918924d2d131261263d0082fa1fc539fb87 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap5.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/7d9b1442be28e9d866f679a6f3c1fd75fe3cbfb3 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/d45dbab4ab52cd1842c1e6def6f359f1c13708bc .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/37735bc8c42b44bb26261c93bfc3555179b96673 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1235120400" 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e66a5542262dc0f26217768a9a63193c99025580 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/11f78bf7747a3c310562e81573912c23f534c0cd .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/5d53297cd1d9b812a6fadc481f67fb4babcdf4f8 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865749003/plib_qei1.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/9d5d6d4e691ce63b16b55ae2b45fb6538da13355 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865749003" 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o.d 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865749003/plib_qei1.o.d" -o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b96d202ec75f78672ce5d5ec0a4c893f0b9eefc2 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/562d97574a05ceb793338949ad471487c39c31b4 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068299602/plib_uart6.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e0e947b36318abde97878edcb6f45fdd11ecc770 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068299602" 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/804485199/plib_wdt.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/bd97169963c3cac0d21ab3a41bfa8cac9e30a489 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/804485199" 
	@${RM} ${OBJECTDIR}/_ext/804485199/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/804485199/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/804485199/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/804485199/plib_wdt.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163999990/xc32_monitor.o: ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/47d1dfc4fe12f078ac6c1abbd5be7833ea5398d0 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1163999990" 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/initialization.o: ../src/config/pic32mk_mcm_curiosity_pro/initialization.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/7775e0a012ee98412aa8d1397b56dcd2e739356c .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/initialization.o.d" -o ${OBJECTDIR}/_ext/1433418692/initialization.o ../src/config/pic32mk_mcm_curiosity_pro/initialization.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/interrupts.o: ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e5d3609cf8e7df6f8a5b0786ae079f418fa6da49 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/interrupts.o.d" -o ${OBJECTDIR}/_ext/1433418692/interrupts.o ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/exceptions.o: ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/db4bff22399aaff08977c4afa4ac6e2ee807c873 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/exceptions.o.d" -o ${OBJECTDIR}/_ext/1433418692/exceptions.o ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/newfile.o: ../src/newfile.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/f9142b2f0e3d7fd0576707ccfc13221e4a2ee882 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/newfile.o.d" -o ${OBJECTDIR}/_ext/1360937237/newfile.o ../src/newfile.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1843287867/vofa.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/vofa/vofa.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/1b6e17ef56fd2f41df7051f9e95557c8b07dad3d .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1843287867" 
	@${RM} ${OBJECTDIR}/_ext/1843287867/vofa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1843287867/vofa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1843287867/vofa.o.d" -o ${OBJECTDIR}/_ext/1843287867/vofa.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/vofa/vofa.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ffa4b92a88db176135a44f9d8093a3e988dbe8f0 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/937536079/SVPWM.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/SVPWM.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/5fc779b7e8184cc764b129ae367b4bb121514f4b .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/SVPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/SVPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/SVPWM.o.d" -o ${OBJECTDIR}/_ext/937536079/SVPWM.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/SVPWM.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/Coordinate_transform.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/Coordinate_transform.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/867a8bcf2a609a9ee444a603bd4937880bf7f4ce .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/Coordinate_transform.o.d" -o ${OBJECTDIR}/_ext/937536079/Coordinate_transform.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Coordinate_transform.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/FOC_Control.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/FOC_Control.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/24a2b3d15fdaa252b3738ac695f58ac5cafe70d7 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/FOC_Control.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/FOC_Control.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/FOC_Control.o.d" -o ${OBJECTDIR}/_ext/937536079/FOC_Control.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/FOC_Control.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/Motor.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/Motor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/d3c3714a97561e55ac7ffe5290889b299d7b0bb9 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/Motor.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/Motor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/Motor.o.d" -o ${OBJECTDIR}/_ext/937536079/Motor.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/Motor.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/937536079/PI_Cale.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/MotorControl/PI_Cale.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/c05298af1f9337aab6d5cc42d14c263adaf1d70c .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/937536079" 
	@${RM} ${OBJECTDIR}/_ext/937536079/PI_Cale.o.d 
	@${RM} ${OBJECTDIR}/_ext/937536079/PI_Cale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/937536079/PI_Cale.o.d" -o ${OBJECTDIR}/_ext/937536079/PI_Cale.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/MotorControl/PI_Cale.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/src/Speed_Enconder_HALLCAL.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/badfe7a1f4a8813a8924dd0fb30a1c72e63b1567 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1880204547" 
	@${RM} ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o.d" -o ${OBJECTDIR}/_ext/1880204547/Speed_Enconder_HALLCAL.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/Speed_Enconder_HALLCAL.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1224054987/plib_adchs.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/470302059015ee28de6447f5502db44662d0af01 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1224054987" 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1224054987/plib_adchs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1224054987/plib_adchs.o.d" -o ${OBJECTDIR}/_ext/1224054987/plib_adchs.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/adchs/plib_adchs.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/452988cc15bdc1a45adaf6d72960d774f0667b56 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac2.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068833501/plib_cdac3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/14f062097851ece48649a92e403a207c06f28a18 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068833501" 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068833501/plib_cdac3.o.d" -o ${OBJECTDIR}/_ext/1068833501/plib_cdac3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/cdac/plib_cdac3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865762238/plib_clk.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/d5ca85d8029bd0b82c33d0b08c67013b7a12694d .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865762238" 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/865762238/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865762238/plib_clk.o.d" -o ${OBJECTDIR}/_ext/865762238/plib_clk.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/clk/plib_clk.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/13355528/plib_eeprom.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/84ed4c8893579f3bbcf5b8f27e3b695532b5ef42 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/13355528" 
	@${RM} ${OBJECTDIR}/_ext/13355528/plib_eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/13355528/plib_eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/13355528/plib_eeprom.o.d" -o ${OBJECTDIR}/_ext/13355528/plib_eeprom.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/eeprom/plib_eeprom.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068756373/plib_evic.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/cd6917809daa10bee0bce4cd37d7243076442885 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068756373" 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068756373/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068756373/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1068756373/plib_evic.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/evic/plib_evic.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068702545/plib_gpio.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b8dc4e0976f51d88d1da3d696e2ac687e6fdf810 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068702545" 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068702545/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068702545/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1068702545/plib_gpio.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/gpio/plib_gpio.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/fd66efadae2ce1c01b5b46f01d4968da61f4304a .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1540640169" 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/1540640169/plib_i2c1_master.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/i2c/master/plib_i2c1_master.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/fac6010fcb6424157cff6c0738f786aa06bbfc98 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap4.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap5.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e72fb5af8bbc4d96d05a406c21081ae0bc4cf61e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap5.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap5.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap5.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap5.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068655703/plib_icap3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ee239c5b568d79787c76a77f92f5fde595a3e19 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068655703" 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068655703/plib_icap3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068655703/plib_icap3.o.d" -o ${OBJECTDIR}/_ext/1068655703/plib_icap3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/icap/plib_icap3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/5fbdb1bf0d3481b2db325e85f3dc30e71a2293fc .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1235120400" 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o.d" -o ${OBJECTDIR}/_ext/1235120400/plib_mcpwm.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/mcpwm/plib_mcpwm.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ac1de43942dcb0e1e37a3ffaaba60b32fe077d02 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/e54e239c7f8aee7740342992477bf8b263f69d19 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/2675f3cb38f15244e92d2112625b9149e050e68e .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068476585" 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o.d" -o ${OBJECTDIR}/_ext/1068476585/plib_ocmp4.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/ocmp/plib_ocmp4.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865749003/plib_qei1.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3c3517253518cde6ff3799f74a4970514a00316 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865749003" 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o.d 
	@${RM} ${OBJECTDIR}/_ext/865749003/plib_qei1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865749003/plib_qei1.o.d" -o ${OBJECTDIR}/_ext/865749003/plib_qei1.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/qei/plib_qei1.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr2.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/4297fb41b778aac6681f5cf16b21c16489aba954 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr2.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr2.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/865745863/plib_tmr3.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/daeb2322b961d796d7ac0eddbe4127debf94ac6b .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/865745863" 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d 
	@${RM} ${OBJECTDIR}/_ext/865745863/plib_tmr3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/865745863/plib_tmr3.o.d" -o ${OBJECTDIR}/_ext/865745863/plib_tmr3.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/tmr/plib_tmr3.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1068299602/plib_uart6.o: ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/416cb633ea941bb1091b521a0837ea9ed5ca9f53 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1068299602" 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1068299602/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1068299602/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1068299602/plib_uart6.o ../src/config/pic32mk_mcm_curiosity_pro/peripheral/uart/plib_uart6.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/804485199/plib_wdt.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/980e288e3544a0d172c0b37595456057dbdcd1b0 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/804485199" 
	@${RM} ${OBJECTDIR}/_ext/804485199/plib_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/804485199/plib_wdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/804485199/plib_wdt.o.d" -o ${OBJECTDIR}/_ext/804485199/plib_wdt.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt/plib_wdt.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163999990/xc32_monitor.o: ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/4e966a7b3d42470c98acac26dbcd1ac6fa97ba19 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1163999990" 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1163999990/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1163999990/xc32_monitor.o ../src/config/pic32mk_mcm_curiosity_pro/stdio/xc32_monitor.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/initialization.o: ../src/config/pic32mk_mcm_curiosity_pro/initialization.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/a400f0675cc1cc8491d631a7b3ae4084ee6f7131 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/initialization.o.d" -o ${OBJECTDIR}/_ext/1433418692/initialization.o ../src/config/pic32mk_mcm_curiosity_pro/initialization.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/interrupts.o: ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/b56adc9e80a54487bc2288b69dfe233f94ac7b3c .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/interrupts.o.d" -o ${OBJECTDIR}/_ext/1433418692/interrupts.o ../src/config/pic32mk_mcm_curiosity_pro/interrupts.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1433418692/exceptions.o: ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/3dd6e1270b37794aae0a35fcafa37fa3bf188a73 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1433418692" 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1433418692/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1433418692/exceptions.o.d" -o ${OBJECTDIR}/_ext/1433418692/exceptions.o ../src/config/pic32mk_mcm_curiosity_pro/exceptions.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/newfile.o: ../src/newfile.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/8dfee03d5f5a608c8bf4f282eb0d4c725fbb9cff .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/newfile.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/newfile.o.d" -o ${OBJECTDIR}/_ext/1360937237/newfile.o ../src/newfile.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1843287867/vofa.o: F:/RJ/mk/dcu\ 1000/ocmp_compare_mode/firmware/vofa/vofa.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/2921eb72cc86cf06ac0c2c5ac410be394f035c81 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1843287867" 
	@${RM} ${OBJECTDIR}/_ext/1843287867/vofa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1843287867/vofa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1843287867/vofa.o.d" -o ${OBJECTDIR}/_ext/1843287867/vofa.o "F:/RJ/mk/dcu 1000/ocmp_compare_mode/firmware/vofa/vofa.c"    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/pic32mk_mcm_curiosity_pro/ad5a907a7380b843847b82423ac49897f21f8c90 .generated_files/flags/pic32mk_mcm_curiosity_pro/5f7af28fcbb6002a8be8aace9a6957d3400d1990
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/config/pic32mk_mcm_curiosity_pro" -I"../MotorControl" -I"../mpu6050" -I"../src/config/pic32mk_mcm_curiosity_pro/peripheral/wdt" -I"../vofa" -mcodecov -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mk_mcm_curiosity_pro=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wformat=2 -Werror-implicit-function-declaration -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-format-attribute -Wno-deprecated-declarations -Wpacked -Wredundant-decls -Wnested-externs -Winline -Wlong-long -Wunreachable-code -Wmissing-noreturn -mdfp="${DFP_DIR}"  
	
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
