
_Init_MCU:

;Initializer.c,14 :: 		void Init_MCU(){
;Initializer.c,21 :: 		ADCON1       =  0x0D;              // Conversor AD, habilita AN0 e AN1 como analogicas
	MOVLW       13
	MOVWF       ADCON1+0 
;Initializer.c,22 :: 		TRISA        =  0b111111;          // Seta RA0 e RA1 como entradas analógicas
	MOVLW       63
	MOVWF       TRISA+0 
;Initializer.c,23 :: 		TRISA3_bit   =  1;
	BSF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;Initializer.c,24 :: 		CMCON        =  0x07;              // To turn off comparators
	MOVLW       7
	MOVWF       CMCON+0 
;Initializer.c,25 :: 		TRISB        =  0x00;              //Todo portB como saída
	CLRF        TRISB+0 
;Initializer.c,26 :: 		PORTB        =  0xff;              // Todo o PORTB em nivel logico alto (módulo rele aciona em 0)
	MOVLW       255
	MOVWF       PORTB+0 
;Initializer.c,27 :: 		TRISC2_bit   =  0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;Initializer.c,28 :: 		RC2_bit      =  1;
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;Initializer.c,29 :: 		RC1_bit      =  1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;Initializer.c,30 :: 		TRISC1_bit   =  0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;Initializer.c,34 :: 		RCIF_bit    =  0x00;              // Flag testada na função interrupt, quando em 0 buffer vazio
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;Initializer.c,35 :: 		GIE_bit     =  0x01;              //Global Interrupt Enable bit, habilita a interrupção global
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Initializer.c,36 :: 		PEIE_bit    =  0x01;              //Peripheral Interrupt Enable bit, habilita a interrupção por perifericos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Initializer.c,37 :: 		RCIE_bit    =  0x01;              //Habilita a interrupção por recepção da UART
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Initializer.c,38 :: 		RCIP_bit    =  0x00;              //Habilita baixa prioridade da porta serial
	BCF         RCIP_bit+0, BitPos(RCIP_bit+0) 
;Initializer.c,39 :: 		IPEN_bit    =  0x01;              //Habilita a prioridade de interrupção
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;Initializer.c,40 :: 		TXIE_bit    =  0x00;              //Desabilita a interrupção por transmissão
	BCF         TXIE_bit+0, BitPos(TXIE_bit+0) 
;Initializer.c,45 :: 		TMR1ON_bit  =  0x01;              //Habilita o TIMER 1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;Initializer.c,46 :: 		TMR1IE_bit  =  0x01;              //Habilita interrupção do TIMER 1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;Initializer.c,47 :: 		TMR1IF_bit  =  0x00;              //Flag testada na interrupção do TIMER 1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Initializer.c,48 :: 		TMR1IP_bit  =  0x01;              //Habilita alta prioridade do TIMER 1
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;Initializer.c,50 :: 		TMR1CS_bit    =  0x00;              //Seleciona clock interno
	BCF         TMR1CS_bit+0, BitPos(TMR1CS_bit+0) 
;Initializer.c,51 :: 		T1CKPS1_bit   =  1;                 // Configura prescaler 1:2...
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;Initializer.c,52 :: 		T1CKPS0_bit   =  1;                 //...interrupção a cada 102,4us
	BSF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;Initializer.c,53 :: 		T1RUN_bit     =  0;
	BCF         T1RUN_bit+0, BitPos(T1RUN_bit+0) 
;Initializer.c,54 :: 		T1OSCEN_bit   =  1;
	BSF         T1OSCEN_bit+0, BitPos(T1OSCEN_bit+0) 
;Initializer.c,55 :: 		RD16_bit      =  1;
	BSF         RD16_bit+0, BitPos(RD16_bit+0) 
;Initializer.c,56 :: 		T1SYNC_bit    =  1;
	BSF         T1SYNC_bit+0, BitPos(T1SYNC_bit+0) 
;Initializer.c,57 :: 		T1OSCEN_bit   =  0;
	BCF         T1OSCEN_bit+0, BitPos(T1OSCEN_bit+0) 
;Initializer.c,60 :: 		TMR0IE_bit  =  0x01;              //Habilita interrupção do TIMER 0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;Initializer.c,61 :: 		TMR0IF_bit  =  0x00;              //Flag testada na interrupção do TIMER 0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Initializer.c,62 :: 		TMR0IP_bit  =  0x01;              //Habilita alta prioridade do TIMER 0
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;Initializer.c,63 :: 		TMR0L       =  0;
	CLRF        TMR0L+0 
;Initializer.c,65 :: 		TMR0ON_bit  =  0x01;              //Habilita o TIMER 0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;Initializer.c,66 :: 		T08BIT_bit  =  0x01;              //Habiita timer 0 EM 16 BITS
	BSF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;Initializer.c,67 :: 		T0CS_bit    =  0x00;              //Seleciona clock interno
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;Initializer.c,68 :: 		T0SE_bit    =  0;
	BCF         T0SE_bit+0, BitPos(T0SE_bit+0) 
;Initializer.c,69 :: 		PSA_bit     =  0x00;              //Habilita o Prescaler (pre contagem)
	BCF         PSA_bit+0, BitPos(PSA_bit+0) 
;Initializer.c,70 :: 		T0PS2_bit   =  1;                 // Configura prescaler 1:2...
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;Initializer.c,71 :: 		T0PS1_bit   =  1;                 //...interrupção a cada 102,4us
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;Initializer.c,72 :: 		T0PS0_bit   =  1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;Initializer.c,81 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;Initializer.c,83 :: 		Keypad_Init();
	CALL        _Keypad_Init+0, 0
;Initializer.c,85 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Initializer.c,86 :: 		RS485Master_Init();
	CALL        _RS485Master_Init+0, 0
;Initializer.c,88 :: 		HID_Enable(&HidReadBuff, &HidWriteBuff);
	MOVLW       Init_MCU_HidReadBuff_L0+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(Init_MCU_HidReadBuff_L0+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       Init_MCU_HidWriteBuff_L0+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(Init_MCU_HidWriteBuff_L0+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;Initializer.c,90 :: 		I2C1_Init(100000);
	MOVLW       50
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;Initializer.c,94 :: 		}
L_end_Init_MCU:
	RETURN      0
; end of _Init_MCU

_Key_pad:

;Initializer.c,96 :: 		char Key_pad(){
;Initializer.c,97 :: 		char kp = Keypad_Key_Press();
	CALL        _Keypad_Key_Press+0, 0
	MOVF        R0, 0 
	MOVWF       Key_pad_kp_L0+0 
;Initializer.c,98 :: 		switch (kp)
	GOTO        L_Key_pad0
;Initializer.c,100 :: 		case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
L_Key_pad2:
	MOVLW       49
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,101 :: 		case  2: kp = 50; break; // 2
L_Key_pad3:
	MOVLW       50
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,102 :: 		case  3: kp = 51; break; // 3
L_Key_pad4:
	MOVLW       51
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,103 :: 		case  4: kp = 65; break; // A
L_Key_pad5:
	MOVLW       65
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,104 :: 		case  5: kp = 52; break; // 4
L_Key_pad6:
	MOVLW       52
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,105 :: 		case  6: kp = 53; break; // 5
L_Key_pad7:
	MOVLW       53
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,106 :: 		case  7: kp = 54; break; // 6
L_Key_pad8:
	MOVLW       54
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,107 :: 		case  8: kp = 66; break; // B
L_Key_pad9:
	MOVLW       66
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,108 :: 		case  9: kp = 55; break; // 7
L_Key_pad10:
	MOVLW       55
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,109 :: 		case 10: kp = 56; break; // 8
L_Key_pad11:
	MOVLW       56
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,110 :: 		case 11: kp = 57; break; // 9
L_Key_pad12:
	MOVLW       57
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,111 :: 		case 12: kp = 67; break; // C
L_Key_pad13:
	MOVLW       67
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,112 :: 		case 13: kp = 42; break; // *
L_Key_pad14:
	MOVLW       42
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,113 :: 		case 14: kp = 48; break; // 0
L_Key_pad15:
	MOVLW       48
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,114 :: 		case 15: kp = 35; break; // #
L_Key_pad16:
	MOVLW       35
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,115 :: 		case 16: kp = 68; break; // D
L_Key_pad17:
	MOVLW       68
	MOVWF       Key_pad_kp_L0+0 
	GOTO        L_Key_pad1
;Initializer.c,116 :: 		}//Fim do Switch do keypad
L_Key_pad0:
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad2
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad3
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad4
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad5
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad6
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad7
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad8
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad9
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad10
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad11
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad12
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad13
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad14
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad15
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad16
	MOVF        Key_pad_kp_L0+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_Key_pad17
L_Key_pad1:
;Initializer.c,117 :: 		return kp;
	MOVF        Key_pad_kp_L0+0, 0 
	MOVWF       R0 
;Initializer.c,118 :: 		}//Fim da Função Teclado
L_end_Key_pad:
	RETURN      0
; end of _Key_pad
