
_envia_slave:

;RS_485.c,9 :: 		void envia_slave(struct RS485_data dados_escravo)
;RS_485.c,11 :: 		RS485Master_Send (dados_escravo.msg, dados_escravo.length_msg, dados_escravo.address);
	MOVF        FARG_envia_slave_dados_escravo+0, 0 
	MOVWF       FARG_RS485Master_Send_data_buffer+0 
	MOVLW       0
	MOVWF       FARG_RS485Master_Send_data_buffer+1 
	MOVF        FARG_envia_slave_dados_escravo+1, 0 
	MOVWF       FARG_RS485Master_Send_datalen+0 
	MOVF        FARG_envia_slave_dados_escravo+2, 0 
	MOVWF       FARG_RS485Master_Send_slave_address+0 
	CALL        _RS485Master_Send+0, 0
;RS_485.c,13 :: 		}
L_end_envia_slave:
	RETURN      0
; end of _envia_slave

_key_RS485:

;RS_485.c,15 :: 		void key_RS485(char key)
;RS_485.c,19 :: 		switch (key)
	GOTO        L_key_RS4850
;RS_485.c,21 :: 		case  49:
L_key_RS4852:
;RS_485.c,22 :: 		dados_escravo.msg = "01 ";
	MOVLW       ?lstr_1_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,23 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,24 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,25 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS4853:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS4853
	CALL        _envia_slave+0, 0
;RS_485.c,26 :: 		break; // 1
	GOTO        L_key_RS4851
;RS_485.c,28 :: 		case  50:
L_key_RS4854:
;RS_485.c,29 :: 		dados_escravo.msg = "02 ";
	MOVLW       ?lstr_2_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,30 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,31 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,32 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS4855:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS4855
	CALL        _envia_slave+0, 0
;RS_485.c,33 :: 		break; // 2
	GOTO        L_key_RS4851
;RS_485.c,35 :: 		case  51:
L_key_RS4856:
;RS_485.c,36 :: 		dados_escravo.msg = "03 ";
	MOVLW       ?lstr_3_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,37 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,38 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,39 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS4857:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS4857
	CALL        _envia_slave+0, 0
;RS_485.c,40 :: 		break; // 3
	GOTO        L_key_RS4851
;RS_485.c,42 :: 		case  52:
L_key_RS4858:
;RS_485.c,43 :: 		dados_escravo.msg = "04 ";
	MOVLW       ?lstr_4_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,44 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,45 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,46 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS4859:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS4859
	CALL        _envia_slave+0, 0
;RS_485.c,47 :: 		break; // 4
	GOTO        L_key_RS4851
;RS_485.c,49 :: 		case  53:
L_key_RS48510:
;RS_485.c,50 :: 		dados_escravo.msg = "05 ";
	MOVLW       ?lstr_5_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,51 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,52 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,53 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS48511:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS48511
	CALL        _envia_slave+0, 0
;RS_485.c,54 :: 		break; // 5
	GOTO        L_key_RS4851
;RS_485.c,56 :: 		case  54:
L_key_RS48512:
;RS_485.c,57 :: 		dados_escravo.msg = "06 ";
	MOVLW       ?lstr_6_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,58 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,59 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,60 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS48513:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS48513
	CALL        _envia_slave+0, 0
;RS_485.c,61 :: 		break; // 6
	GOTO        L_key_RS4851
;RS_485.c,63 :: 		case  55:
L_key_RS48514:
;RS_485.c,64 :: 		dados_escravo.msg = "07 ";
	MOVLW       ?lstr_7_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,65 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,66 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,67 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS48515:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS48515
	CALL        _envia_slave+0, 0
;RS_485.c,68 :: 		break; // 7
	GOTO        L_key_RS4851
;RS_485.c,70 :: 		case  56:
L_key_RS48516:
;RS_485.c,71 :: 		dados_escravo.msg = "08 ";
	MOVLW       ?lstr_8_RS_485+0
	MOVWF       key_RS485_dados_escravo_L0+0 
;RS_485.c,72 :: 		dados_escravo.length_msg = 3;
	MOVLW       3
	MOVWF       key_RS485_dados_escravo_L0+1 
;RS_485.c,73 :: 		dados_escravo.address = 'C';
	MOVLW       67
	MOVWF       key_RS485_dados_escravo_L0+2 
;RS_485.c,74 :: 		envia_slave(dados_escravo);
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_envia_slave_dados_escravo+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_envia_slave_dados_escravo+0)
	MOVWF       FSR1H 
	MOVLW       key_RS485_dados_escravo_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(key_RS485_dados_escravo_L0+0)
	MOVWF       FSR0H 
L_key_RS48517:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_key_RS48517
	CALL        _envia_slave+0, 0
;RS_485.c,75 :: 		break; // 8
	GOTO        L_key_RS4851
;RS_485.c,78 :: 		}//Fim do Switch do keypad
L_key_RS4850:
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS4852
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS4854
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS4856
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS4858
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS48510
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS48512
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS48514
	MOVF        FARG_key_RS485_key+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_key_RS48516
L_key_RS4851:
;RS_485.c,80 :: 		}
L_end_key_RS485:
	RETURN      0
; end of _key_RS485
