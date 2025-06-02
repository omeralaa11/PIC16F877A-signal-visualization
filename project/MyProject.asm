
_main:

;MyProject.c,2 :: 		void main() {
;MyProject.c,4 :: 		int pwm=0;
;MyProject.c,6 :: 		PWM1_Init(10000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,7 :: 		PWM1_Set_Duty(70);
	MOVLW      70
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,8 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,9 :: 		TRISC = 0x10111011;
	MOVLW      17
	MOVWF      TRISC+0
;MyProject.c,11 :: 		PORTC = 0;
	CLRF       PORTC+0
;MyProject.c,12 :: 		TRISA= 0xff;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,13 :: 		ADCON1= 0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;MyProject.c,14 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;MyProject.c,15 :: 		while(1)
L_main0:
;MyProject.c,17 :: 		Vin=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_Vin_L0+0
	MOVF       R0+1, 0
	MOVWF      main_Vin_L0+1
;MyProject.c,19 :: 		WordToStr(Vin, buffer);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;MyProject.c,21 :: 		UART1_Write_Text(buffer);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,22 :: 		UART1_Write('\r');
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,23 :: 		UART1_Write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,24 :: 		pwm = Vin/4;
	MOVF       main_Vin_L0+0, 0
	MOVWF      R0+0
	MOVF       main_Vin_L0+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
;MyProject.c,25 :: 		PWM1_Set_Duty(pwm);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,26 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;MyProject.c,27 :: 		}
	GOTO       L_main0
;MyProject.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
