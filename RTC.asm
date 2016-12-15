
_read_clock:

;RTC.c,9 :: 		struct real_time_clock read_clock (){
	MOVF        R0, 0 
	MOVWF       _read_clock_su_addr+0 
	MOVF        R1, 0 
	MOVWF       _read_clock_su_addr+1 
;RTC.c,13 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;RTC.c,14 :: 		I2C1_Wr(0xD0);
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,15 :: 		I2C1_Wr(0);
	CLRF        FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,16 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;RTC.c,17 :: 		I2C1_Wr(0xD1);
	MOVLW       209
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;RTC.c,18 :: 		read_date.seconds = I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+0 
;RTC.c,19 :: 		read_date.minutes = I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+2 
;RTC.c,20 :: 		read_date.hours   = I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+4 
;RTC.c,21 :: 		read_date.weekday = I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+6 
;RTC.c,22 :: 		read_date.days   = I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+8 
;RTC.c,23 :: 		read_date.month   = I2C1_Rd(1);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+10 
;RTC.c,24 :: 		read_date.years   = I2C1_Rd(0);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       read_clock_read_date_L0+12 
;RTC.c,25 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;RTC.c,27 :: 		return read_date;
	MOVLW       14
	MOVWF       R0 
	MOVF        _read_clock_su_addr+0, 0 
	MOVWF       FSR1 
	MOVF        _read_clock_su_addr+1, 0 
	MOVWF       FSR1H 
	MOVLW       read_clock_read_date_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(read_clock_read_date_L0+0)
	MOVWF       FSR0H 
L_read_clock0:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_read_clock0
;RTC.c,28 :: 		}
L_end_read_clock:
	RETURN      0
; end of _read_clock

_write_date_lcd:

;RTC.c,30 :: 		void write_date_lcd(struct real_time_clock read_date){
;RTC.c,33 :: 		LCD_I2C_Chr(1,6,((read_date.hours  & 0xf0) >> 4) + 0x30);
	MOVLW       1
	MOVWF       FARG_Lcd_I2C_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_I2C_Chr_column+0 
	MOVLW       240
	ANDWF       FARG_write_date_lcd_read_date+4, 0 
	MOVWF       FARG_Lcd_I2C_Chr_out_char+0 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_out_char+0, 1 
	CALL        _Lcd_I2C_Chr+0, 0
;RTC.c,34 :: 		LCD_I2C_Chr_cp  ((read_date.hours  & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_write_date_lcd_read_date+4, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,35 :: 		LCD_I2C_Chr_cp  (':');
	MOVLW       58
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,36 :: 		LCD_I2C_Chr_cp  (((read_date.minutes & 0xf0) >> 4) + 0x30);
	MOVLW       240
	ANDWF       FARG_write_date_lcd_read_date+2, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,37 :: 		LCD_I2C_Chr_cp  ((read_date.minutes  & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_write_date_lcd_read_date+2, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,38 :: 		LCD_I2C_Chr(2,5,((read_date.days  & 0xf0) >> 4) + 0x30);
	MOVLW       2
	MOVWF       FARG_Lcd_I2C_Chr_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_I2C_Chr_column+0 
	MOVLW       240
	ANDWF       FARG_write_date_lcd_read_date+8, 0 
	MOVWF       FARG_Lcd_I2C_Chr_out_char+0 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_out_char+0, 7 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_out_char+0, 1 
	CALL        _Lcd_I2C_Chr+0, 0
;RTC.c,39 :: 		LCD_I2C_Chr_cp  ((read_date.days  & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_write_date_lcd_read_date+8, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,40 :: 		LCD_I2C_Chr_cp  ('/');
	MOVLW       47
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,41 :: 		LCD_I2C_Chr_cp  (((read_date.month & 0xf0) >> 4) + 0x30);
	MOVLW       240
	ANDWF       FARG_write_date_lcd_read_date+10, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,42 :: 		LCD_I2C_Chr_cp  ((read_date.month & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_write_date_lcd_read_date+10, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,43 :: 		LCD_I2C_Chr_cp  ('/');
	MOVLW       47
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,44 :: 		LCD_I2C_Chr_cp  (((read_date. years & 0xf0) >> 4) + 0x30);
	MOVLW       240
	ANDWF       FARG_write_date_lcd_read_date+12, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	RRCF        FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	BCF         FARG_Lcd_I2C_Chr_CP_out_char+0, 7 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,45 :: 		LCD_I2C_Chr_cp  ((read_date. years & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_write_date_lcd_read_date+12, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	MOVLW       48
	ADDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 1 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,47 :: 		}
L_end_write_date_lcd:
	RETURN      0
; end of _write_date_lcd

_converte_timer:

;RTC.c,49 :: 		struct real_time_clock converte_timer (struct real_time_clock dados_convert){
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
;RTC.c,53 :: 		dados_convertidos.hours    = ((dados_convert.hours  & 0xf0) >> 4) + 0x30;
	MOVLW       240
	ANDWF       FARG_converte_timer_dados_convert+4, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R9 
;RTC.c,54 :: 		dados_convertidos.hours1    =  ((dados_convert.hours  & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_converte_timer_dados_convert+4, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R10 
;RTC.c,55 :: 		dados_convertidos.minutes  =  (((dados_convert.minutes & 0xf0) >> 4) + 0x30);
	MOVLW       240
	ANDWF       FARG_converte_timer_dados_convert+2, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R7 
;RTC.c,56 :: 		dados_convertidos.minutes1  =  ((dados_convert.minutes  & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_converte_timer_dados_convert+2, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R8 
;RTC.c,57 :: 		dados_convertidos.days     = ((dados_convert.days  & 0xf0) >> 4) + 0x30;
	MOVLW       240
	ANDWF       FARG_converte_timer_dados_convert+8, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R13 
;RTC.c,58 :: 		dados_convertidos.days1     = ((dados_convert.days  & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_converte_timer_dados_convert+8, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R14 
;RTC.c,59 :: 		dados_convertidos.month    =  (((dados_convert.month & 0xf0) >> 4) + 0x30);
	MOVLW       240
	ANDWF       FARG_converte_timer_dados_convert+10, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R15 
;RTC.c,60 :: 		dados_convertidos.month1    = ((dados_convert.month & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_converte_timer_dados_convert+10, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R16 
;RTC.c,61 :: 		dados_convertidos.years    =  (((dados_convert.years & 0xf0) >> 4) + 0x30);
	MOVLW       240
	ANDWF       FARG_converte_timer_dados_convert+12, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R17 
;RTC.c,62 :: 		dados_convertidos.years1    = ((dados_convert.years & 0x0f) + 0x30);
	MOVLW       15
	ANDWF       FARG_converte_timer_dados_convert+12, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       R18 
;RTC.c,65 :: 		return dados_convertidos;
	MOVLW       14
	MOVWF       R0 
	MOVF        R3, 0 
	MOVWF       FSR1 
	MOVF        R4, 0 
	MOVWF       FSR1H 
	MOVLW       5
	MOVWF       FSR0 
	MOVLW       0
	MOVWF       FSR0H 
L_converte_timer1:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_converte_timer1
;RTC.c,66 :: 		}
L_end_converte_timer:
	RETURN      0
; end of _converte_timer

_write_lcd:

;RTC.c,69 :: 		void write_lcd (struct real_time_clock read_dates){
;RTC.c,71 :: 		LCD_I2C_Chr(1,6, read_dates.hours);
	MOVLW       1
	MOVWF       FARG_Lcd_I2C_Chr_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_I2C_Chr_column+0 
	MOVF        FARG_write_lcd_read_dates+4, 0 
	MOVWF       FARG_Lcd_I2C_Chr_out_char+0 
	CALL        _Lcd_I2C_Chr+0, 0
;RTC.c,72 :: 		LCD_I2C_Chr_cp  (read_dates.hours1);
	MOVF        FARG_write_lcd_read_dates+5, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,73 :: 		LCD_I2C_Chr_cp  (':');
	MOVLW       58
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,74 :: 		LCD_I2C_Chr_cp  (read_dates.minutes);
	MOVF        FARG_write_lcd_read_dates+2, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,75 :: 		LCD_I2C_Chr_cp  (read_dates.minutes1);
	MOVF        FARG_write_lcd_read_dates+3, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,76 :: 		LCD_I2C_Chr(2,5, read_dates.days);
	MOVLW       2
	MOVWF       FARG_Lcd_I2C_Chr_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_I2C_Chr_column+0 
	MOVF        FARG_write_lcd_read_dates+8, 0 
	MOVWF       FARG_Lcd_I2C_Chr_out_char+0 
	CALL        _Lcd_I2C_Chr+0, 0
;RTC.c,77 :: 		LCD_I2C_Chr_cp  (read_dates.days1);
	MOVF        FARG_write_lcd_read_dates+9, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,78 :: 		LCD_I2C_Chr_cp  ('/');
	MOVLW       47
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,79 :: 		LCD_I2C_Chr_cp  (read_dates.month);
	MOVF        FARG_write_lcd_read_dates+10, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,80 :: 		LCD_I2C_Chr_cp  (read_dates.month1);
	MOVF        FARG_write_lcd_read_dates+11, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,81 :: 		LCD_I2C_Chr_cp  ('/');
	MOVLW       47
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,82 :: 		LCD_I2C_Chr_cp  (read_dates. years);
	MOVF        FARG_write_lcd_read_dates+12, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,83 :: 		LCD_I2C_Chr_cp  (read_dates. years1);
	MOVF        FARG_write_lcd_read_dates+13, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;RTC.c,86 :: 		}
L_end_write_lcd:
	RETURN      0
; end of _write_lcd
