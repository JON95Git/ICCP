
_Lcd_I2C_Cmd:

;Lcd_I2C_Lib.c,41 :: 		void Lcd_I2C_Cmd(char out_char)
;Lcd_I2C_Lib.c,46 :: 		I2C_byte = out_char & 0xF0;
	MOVLW       240
	ANDWF       FARG_Lcd_I2C_Cmd_out_char+0, 0 
	MOVWF       Lcd_I2C_Cmd_I2C_byte_L0+0 
;Lcd_I2C_Lib.c,48 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;Lcd_I2C_Lib.c,49 :: 		I2C1_Wr(LCD_I2C_address);
	MOVF        _Lcd_I2C_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,51 :: 		I2C_byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Cmd_I2C_byte_L0+0, 3 
;Lcd_I2C_Lib.c,52 :: 		I2C_byte.F1 = 0;
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
;Lcd_I2C_Lib.c,53 :: 		I2C_byte.F0 = 0;
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
;Lcd_I2C_Lib.c,54 :: 		I2C_byte.F2 = 1;
	BSF         Lcd_I2C_Cmd_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,55 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,56 :: 		I2C_byte.F2 = 0;
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,57 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,59 :: 		I2C_byte = (out_char << 4) & 0xF0;
	MOVF        FARG_Lcd_I2C_Cmd_out_char+0, 0 
	MOVWF       Lcd_I2C_Cmd_I2C_byte_L0+0 
	RLCF        Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	RLCF        Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	RLCF        Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	RLCF        Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	MOVLW       240
	ANDWF       Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
;Lcd_I2C_Lib.c,61 :: 		I2C_byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Cmd_I2C_byte_L0+0, 3 
;Lcd_I2C_Lib.c,62 :: 		I2C_byte.F1 = 0;
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 1 
;Lcd_I2C_Lib.c,63 :: 		I2C_byte.F0 = 0;
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
;Lcd_I2C_Lib.c,64 :: 		I2C_byte.F2 = 1;
	BSF         Lcd_I2C_Cmd_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,65 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,66 :: 		I2C_byte.F2 = 0;
	BCF         Lcd_I2C_Cmd_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,67 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Cmd_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,68 :: 		I2C1_stop();
	CALL        _I2C1_Stop+0, 0
;Lcd_I2C_Lib.c,70 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Cmd0:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Cmd0
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Cmd0
	NOP
;Lcd_I2C_Lib.c,71 :: 		}//Final LCD_I2C_Cmd
L_end_Lcd_I2C_Cmd:
	RETURN      0
; end of _Lcd_I2C_Cmd

_Lcd_I2C_Init:

;Lcd_I2C_Lib.c,74 :: 		void Lcd_I2C_Init()
;Lcd_I2C_Lib.c,79 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_Lcd_I2C_Init1:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init1
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init1
	DECFSZ      R11, 1, 1
	BRA         L_Lcd_I2C_Init1
	NOP
	NOP
;Lcd_I2C_Lib.c,81 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;Lcd_I2C_Lib.c,82 :: 		I2C1_Wr(LCD_I2C_address);
	MOVF        _Lcd_I2C_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,83 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init2:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init2
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init2
	NOP
;Lcd_I2C_Lib.c,85 :: 		I2C_byte = 0x30;
	MOVLW       48
	MOVWF       Lcd_I2C_Init_I2C_byte_L0+0 
;Lcd_I2C_Lib.c,87 :: 		I2C_byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 3 
;Lcd_I2C_Lib.c,88 :: 		I2C_byte.F1 = 0;
	BCF         Lcd_I2C_Init_I2C_byte_L0+0, 1 
;Lcd_I2C_Lib.c,89 :: 		I2C_byte.F2 = 1;
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,90 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,92 :: 		I2C_byte.F2 = 0;
	BCF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,93 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,95 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init3:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init3
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init3
	NOP
;Lcd_I2C_Lib.c,97 :: 		I2C_byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 3 
;Lcd_I2C_Lib.c,98 :: 		I2C_byte.F2 = 1;
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,99 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,100 :: 		I2C_byte.F2 = 0;
	BCF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,101 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,103 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init4:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init4
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init4
	NOP
;Lcd_I2C_Lib.c,105 :: 		I2C_byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 3 
;Lcd_I2C_Lib.c,106 :: 		I2C_byte.F2 = 1;
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,107 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,108 :: 		I2C_byte.F2 = 0;
	BCF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,109 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,111 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init5:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init5
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init5
	NOP
;Lcd_I2C_Lib.c,113 :: 		I2C_byte = 0x20;
	MOVLW       32
	MOVWF       Lcd_I2C_Init_I2C_byte_L0+0 
;Lcd_I2C_Lib.c,115 :: 		I2C_byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 3 
;Lcd_I2C_Lib.c,116 :: 		I2C_byte.F1 = 0;
	BCF         Lcd_I2C_Init_I2C_byte_L0+0, 1 
;Lcd_I2C_Lib.c,117 :: 		I2C_byte.F2 = 1;
	BSF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,118 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,119 :: 		I2C_byte.F2 = 0;
	BCF         Lcd_I2C_Init_I2C_byte_L0+0, 2 
;Lcd_I2C_Lib.c,120 :: 		I2C1_Wr(I2C_byte);
	MOVF        Lcd_I2C_Init_I2C_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,122 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init6:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init6
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init6
	NOP
;Lcd_I2C_Lib.c,124 :: 		LCD_I2C_Cmd(0x28);
	MOVLW       40
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,125 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init7:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init7
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init7
	NOP
;Lcd_I2C_Lib.c,126 :: 		LCD_I2C_Cmd(0x0F);
	MOVLW       15
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,127 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init8:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init8
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init8
	NOP
;Lcd_I2C_Lib.c,128 :: 		LCD_I2C_Cmd(0x06);
	MOVLW       6
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,129 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init9:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init9
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init9
	NOP
;Lcd_I2C_Lib.c,130 :: 		LCD_I2C_Cmd(0x01);
	MOVLW       1
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,131 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Init10:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Init10
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Init10
	NOP
;Lcd_I2C_Lib.c,132 :: 		}//Final do I2C_Lcd_Init
L_end_Lcd_I2C_Init:
	RETURN      0
; end of _Lcd_I2C_Init

_Lcd_I2C_Chr_CP:

;Lcd_I2C_Lib.c,135 :: 		void Lcd_I2C_Chr_CP(char out_char)
;Lcd_I2C_Lib.c,140 :: 		byte = out_char & 0xF0;
	MOVLW       240
	ANDWF       FARG_Lcd_I2C_Chr_CP_out_char+0, 0 
	MOVWF       Lcd_I2C_Chr_CP_byte_L0+0 
;Lcd_I2C_Lib.c,142 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;Lcd_I2C_Lib.c,143 :: 		I2C1_Wr(LCD_I2C_address);
	MOVF        _Lcd_I2C_address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,145 :: 		byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Chr_CP_byte_L0+0, 3 
;Lcd_I2C_Lib.c,146 :: 		byte.F1 = 0;
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 1 
;Lcd_I2C_Lib.c,147 :: 		byte.F0 = 1;  //rs   = 0
	BSF         Lcd_I2C_Chr_CP_byte_L0+0, 0 
;Lcd_I2C_Lib.c,148 :: 		byte.F2 = 1;  //e    = 2
	BSF         Lcd_I2C_Chr_CP_byte_L0+0, 2 
;Lcd_I2C_Lib.c,149 :: 		I2C1_Wr(byte);
	MOVF        Lcd_I2C_Chr_CP_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,150 :: 		byte.F2 = 0;
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 2 
;Lcd_I2C_Lib.c,151 :: 		I2C1_Wr(byte);
	MOVF        Lcd_I2C_Chr_CP_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,153 :: 		byte = (out_char << 4) & 0xF0;
	MOVF        FARG_Lcd_I2C_Chr_CP_out_char+0, 0 
	MOVWF       Lcd_I2C_Chr_CP_byte_L0+0 
	RLCF        Lcd_I2C_Chr_CP_byte_L0+0, 1 
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 0 
	RLCF        Lcd_I2C_Chr_CP_byte_L0+0, 1 
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 0 
	RLCF        Lcd_I2C_Chr_CP_byte_L0+0, 1 
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 0 
	RLCF        Lcd_I2C_Chr_CP_byte_L0+0, 1 
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 0 
	MOVLW       240
	ANDWF       Lcd_I2C_Chr_CP_byte_L0+0, 1 
;Lcd_I2C_Lib.c,155 :: 		byte.F3 = 1; // pino base j3y
	BSF         Lcd_I2C_Chr_CP_byte_L0+0, 3 
;Lcd_I2C_Lib.c,156 :: 		byte.F1 = 0;
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 1 
;Lcd_I2C_Lib.c,157 :: 		byte.F0 = 1;
	BSF         Lcd_I2C_Chr_CP_byte_L0+0, 0 
;Lcd_I2C_Lib.c,158 :: 		byte.F2 = 1;
	BSF         Lcd_I2C_Chr_CP_byte_L0+0, 2 
;Lcd_I2C_Lib.c,159 :: 		I2C1_Wr(byte);
	MOVF        Lcd_I2C_Chr_CP_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,160 :: 		byte.F2 = 0;
	BCF         Lcd_I2C_Chr_CP_byte_L0+0, 2 
;Lcd_I2C_Lib.c,161 :: 		I2C1_Wr(byte);
	MOVF        Lcd_I2C_Chr_CP_byte_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;Lcd_I2C_Lib.c,163 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;Lcd_I2C_Lib.c,164 :: 		Delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_Lcd_I2C_Chr_CP11:
	DECFSZ      R13, 1, 1
	BRA         L_Lcd_I2C_Chr_CP11
	DECFSZ      R12, 1, 1
	BRA         L_Lcd_I2C_Chr_CP11
	NOP
;Lcd_I2C_Lib.c,165 :: 		}//Final da Lcd_I2C_Chr_CP
L_end_Lcd_I2C_Chr_CP:
	RETURN      0
; end of _Lcd_I2C_Chr_CP

_Lcd_I2C_Out_CP:

;Lcd_I2C_Lib.c,168 :: 		void Lcd_I2C_Out_CP(char *text)
;Lcd_I2C_Lib.c,170 :: 		while(*text)
L_Lcd_I2C_Out_CP12:
	MOVFF       FARG_Lcd_I2C_Out_CP_text+0, FSR0
	MOVFF       FARG_Lcd_I2C_Out_CP_text+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Lcd_I2C_Out_CP13
;Lcd_I2C_Lib.c,172 :: 		Lcd_I2C_Chr_CP(*text);
	MOVFF       FARG_Lcd_I2C_Out_CP_text+0, FSR0
	MOVFF       FARG_Lcd_I2C_Out_CP_text+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;Lcd_I2C_Lib.c,173 :: 		text++;
	INFSNZ      FARG_Lcd_I2C_Out_CP_text+0, 1 
	INCF        FARG_Lcd_I2C_Out_CP_text+1, 1 
;Lcd_I2C_Lib.c,174 :: 		}
	GOTO        L_Lcd_I2C_Out_CP12
L_Lcd_I2C_Out_CP13:
;Lcd_I2C_Lib.c,175 :: 		}//Final do Lcd_I2C_Out_CP
L_end_Lcd_I2C_Out_CP:
	RETURN      0
; end of _Lcd_I2C_Out_CP

_Lcd_I2C_Chr:

;Lcd_I2C_Lib.c,178 :: 		void Lcd_I2C_Chr(char row, char column, char out_char)
;Lcd_I2C_Lib.c,183 :: 		switch(row)
	GOTO        L_Lcd_I2C_Chr14
;Lcd_I2C_Lib.c,185 :: 		case 1:
L_Lcd_I2C_Chr16:
;Lcd_I2C_Lib.c,186 :: 		Lcd_I2C_Cmd(0x80 + (column - 1));
	DECF        FARG_Lcd_I2C_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       128
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,187 :: 		break;
	GOTO        L_Lcd_I2C_Chr15
;Lcd_I2C_Lib.c,188 :: 		case 2:
L_Lcd_I2C_Chr17:
;Lcd_I2C_Lib.c,189 :: 		Lcd_I2C_Cmd(0xC0 + (column - 1));
	DECF        FARG_Lcd_I2C_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       192
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,190 :: 		break;
	GOTO        L_Lcd_I2C_Chr15
;Lcd_I2C_Lib.c,191 :: 		case 3:
L_Lcd_I2C_Chr18:
;Lcd_I2C_Lib.c,192 :: 		Lcd_I2C_Cmd(0x94 + (column - 1));
	DECF        FARG_Lcd_I2C_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       148
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,193 :: 		break;
	GOTO        L_Lcd_I2C_Chr15
;Lcd_I2C_Lib.c,194 :: 		case 4:
L_Lcd_I2C_Chr19:
;Lcd_I2C_Lib.c,195 :: 		Lcd_I2C_Cmd(0xD4 + (column - 1));
	DECF        FARG_Lcd_I2C_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       212
	MOVWF       FARG_Lcd_I2C_Cmd_out_char+0 
	CALL        _Lcd_I2C_Cmd+0, 0
;Lcd_I2C_Lib.c,196 :: 		break;
	GOTO        L_Lcd_I2C_Chr15
;Lcd_I2C_Lib.c,197 :: 		};
L_Lcd_I2C_Chr14:
	MOVF        FARG_Lcd_I2C_Chr_row+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Lcd_I2C_Chr16
	MOVF        FARG_Lcd_I2C_Chr_row+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Lcd_I2C_Chr17
	MOVF        FARG_Lcd_I2C_Chr_row+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Lcd_I2C_Chr18
	MOVF        FARG_Lcd_I2C_Chr_row+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Lcd_I2C_Chr19
L_Lcd_I2C_Chr15:
;Lcd_I2C_Lib.c,199 :: 		Lcd_I2C_Chr_CP(out_char);
	MOVF        FARG_Lcd_I2C_Chr_out_char+0, 0 
	MOVWF       FARG_Lcd_I2C_Chr_CP_out_char+0 
	CALL        _Lcd_I2C_Chr_CP+0, 0
;Lcd_I2C_Lib.c,200 :: 		}//Final do Lcd_I2C_Chr
L_end_Lcd_I2C_Chr:
	RETURN      0
; end of _Lcd_I2C_Chr

_Lcd_I2C_Out:

;Lcd_I2C_Lib.c,203 :: 		void Lcd_I2C_Out(char row, char col, char *text)
;Lcd_I2C_Lib.c,205 :: 		while(*text)
L_Lcd_I2C_Out20:
	MOVFF       FARG_Lcd_I2C_Out_text+0, FSR0
	MOVFF       FARG_Lcd_I2C_Out_text+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Lcd_I2C_Out21
;Lcd_I2C_Lib.c,207 :: 		Lcd_I2C_Chr(row, col, *text);
	MOVF        FARG_Lcd_I2C_Out_row+0, 0 
	MOVWF       FARG_Lcd_I2C_Chr_row+0 
	MOVF        FARG_Lcd_I2C_Out_col+0, 0 
	MOVWF       FARG_Lcd_I2C_Chr_column+0 
	MOVFF       FARG_Lcd_I2C_Out_text+0, FSR0
	MOVFF       FARG_Lcd_I2C_Out_text+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_I2C_Chr_out_char+0 
	CALL        _Lcd_I2C_Chr+0, 0
;Lcd_I2C_Lib.c,208 :: 		col++;
	INCF        FARG_Lcd_I2C_Out_col+0, 1 
;Lcd_I2C_Lib.c,209 :: 		text++;
	INFSNZ      FARG_Lcd_I2C_Out_text+0, 1 
	INCF        FARG_Lcd_I2C_Out_text+1, 1 
;Lcd_I2C_Lib.c,210 :: 		}
	GOTO        L_Lcd_I2C_Out20
L_Lcd_I2C_Out21:
;Lcd_I2C_Lib.c,211 :: 		}//Final do Lcd_I2C_Out
L_end_Lcd_I2C_Out:
	RETURN      0
; end of _Lcd_I2C_Out
