
_main:

;ICCP 3.c,10 :: 		void main (){
;ICCP 3.c,13 :: 		Init_MCU();         //Iniciaiza os registradores e funções do microcontrolador
	CALL        _Init_MCU+0, 0
;ICCP 3.c,14 :: 		Lcd_I2C_Init();
	CALL        _Lcd_I2C_Init+0, 0
;ICCP 3.c,15 :: 		Lcd_I2C_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;ICCP 3.c,16 :: 		Lcd_I2C_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;ICCP 3.c,17 :: 		Lcd_I2C_Out(1,5, "I.C.C.P");
	MOVLW       1
	MOVWF       FARG_Lcd_I2C_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_I2C_Out_col+0 
	MOVLW       ?lstr1_ICCP_323+0
	MOVWF       FARG_Lcd_I2C_Out_text+0 
	MOVLW       hi_addr(?lstr1_ICCP_323+0)
	MOVWF       FARG_Lcd_I2C_Out_text+1 
	CALL        _Lcd_I2C_Out+0, 0
;ICCP 3.c,18 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;ICCP 3.c,19 :: 		Lcd_I2C_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;ICCP 3.c,21 :: 		for(;;)
L_main1:
;ICCP 3.c,28 :: 		write_lcd(converte_timer(read_clock()));
	MOVLW       FLOC__main+0
	MOVWF       R0 
	MOVLW       hi_addr(FLOC__main+0)
	MOVWF       R1 
	CALL        _read_clock+0, 0
	MOVLW       14
	MOVWF       R0 
	MOVLW       FARG_converte_timer_dados_convert+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_converte_timer_dados_convert+0)
	MOVWF       FSR1H 
	MOVLW       FLOC__main+0
	MOVWF       FSR0 
	MOVLW       hi_addr(FLOC__main+0)
	MOVWF       FSR0H 
L_main4:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	MOVLW       FLOC__main+0
	MOVWF       R0 
	MOVLW       hi_addr(FLOC__main+0)
	MOVWF       R1 
	CALL        _converte_timer+0, 0
	MOVLW       14
	MOVWF       R0 
	MOVLW       FARG_write_lcd_read_dates+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_write_lcd_read_dates+0)
	MOVWF       FSR1H 
	MOVLW       FLOC__main+0
	MOVWF       FSR0 
	MOVLW       hi_addr(FLOC__main+0)
	MOVWF       FSR0H 
L_main5:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	CALL        _write_lcd+0, 0
;ICCP 3.c,31 :: 		}//Fim do loop
	GOTO        L_main1
;ICCP 3.c,32 :: 		}//Fim da main
L_end_main:
	GOTO        $+0
; end of _main
