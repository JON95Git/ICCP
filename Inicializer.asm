
_Init_MCU:

;Inicializer.c,12 :: 		void Init_MCU(){
;Inicializer.c,19 :: 		ADCON1       =  0x0D;              // Conversor AD, habilita AN0 e AN1 como analogicas
	MOVLW       13
	MOVWF       ADCON1+0 
;Inicializer.c,20 :: 		TRISA        =  0b111111;          // Seta RA0 e RA1 como entradas analógicas
	MOVLW       63
	MOVWF       TRISA+0 
;Inicializer.c,21 :: 		TRISA3_bit   =  1;
	BSF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;Inicializer.c,22 :: 		CMCON        =  0x07;              // To turn off comparators
	MOVLW       7
	MOVWF       CMCON+0 
;Inicializer.c,23 :: 		TRISB        =  0x00;              //Todo portB como saída
	CLRF        TRISB+0 
;Inicializer.c,24 :: 		PORTB        =  0xff;              // Todo o PORTB em nivel logico alto (módulo rele aciona em 0)
	MOVLW       255
	MOVWF       PORTB+0 
;Inicializer.c,25 :: 		TRISC2_bit   =  0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;Inicializer.c,26 :: 		RC2_bit      =  1;
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;Inicializer.c,27 :: 		RC1_bit      =  1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;Inicializer.c,28 :: 		TRISC1_bit   =  0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;Inicializer.c,32 :: 		RCIF_bit    =  0x00;              // Flag testada na função interrupt, quando em 0 buffer vazio
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;Inicializer.c,33 :: 		GIE_bit     =  0x01;              //Global Interrupt Enable bit, habilita a interrupção global
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Inicializer.c,34 :: 		PEIE_bit    =  0x01;              //Peripheral Interrupt Enable bit, habilita a interrupção por perifericos
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Inicializer.c,35 :: 		RCIE_bit    =  0x01;              //Habilita a interrupção por recepção da UART
	BSF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;Inicializer.c,36 :: 		RCIP_bit    =  0x00;              //Habilita baixa prioridade da porta serial
	BCF         RCIP_bit+0, BitPos(RCIP_bit+0) 
;Inicializer.c,37 :: 		IPEN_bit    =  0x01;              //Habilita a prioridade de interrupção
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;Inicializer.c,38 :: 		TXIE_bit    =  0x00;              //Desabilita a interrupção por transmissão
	BCF         TXIE_bit+0, BitPos(TXIE_bit+0) 
;Inicializer.c,43 :: 		TMR1ON_bit  =  0x01;              //Habilita o TIMER 1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;Inicializer.c,44 :: 		TMR1IE_bit  =  0x01;              //Habilita interrupção do TIMER 1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;Inicializer.c,45 :: 		TMR1IF_bit  =  0x00;              //Flag testada na interrupção do TIMER 1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Inicializer.c,46 :: 		TMR1IP_bit  =  0x01;              //Habilita alta prioridade do TIMER 1
	BSF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;Inicializer.c,48 :: 		TMR1CS_bit    =  0x00;              //Seleciona clock interno
	BCF         TMR1CS_bit+0, BitPos(TMR1CS_bit+0) 
;Inicializer.c,49 :: 		T1CKPS1_bit   =  1;                 // Configura prescaler 1:2...
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
;Inicializer.c,50 :: 		T1CKPS0_bit   =  1;                 //...interrupção a cada 102,4us
	BSF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
;Inicializer.c,51 :: 		T1RUN_bit     =  0;
	BCF         T1RUN_bit+0, BitPos(T1RUN_bit+0) 
;Inicializer.c,52 :: 		T1OSCEN_bit   =  1;
	BSF         T1OSCEN_bit+0, BitPos(T1OSCEN_bit+0) 
;Inicializer.c,53 :: 		RD16_bit      =  1;
	BSF         RD16_bit+0, BitPos(RD16_bit+0) 
;Inicializer.c,54 :: 		T1SYNC_bit    =  1;
	BSF         T1SYNC_bit+0, BitPos(T1SYNC_bit+0) 
;Inicializer.c,55 :: 		T1OSCEN_bit   =  0;
	BCF         T1OSCEN_bit+0, BitPos(T1OSCEN_bit+0) 
;Inicializer.c,58 :: 		TMR0IE_bit  =  0x01;              //Habilita interrupção do TIMER 0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;Inicializer.c,59 :: 		TMR0IF_bit  =  0x00;              //Flag testada na interrupção do TIMER 0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Inicializer.c,60 :: 		TMR0IP_bit  =  0x01;              //Habilita alta prioridade do TIMER 0
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;Inicializer.c,61 :: 		TMR0L       =  0;
	CLRF        TMR0L+0 
;Inicializer.c,63 :: 		TMR0ON_bit  =  0x01;              //Habilita o TIMER 0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;Inicializer.c,64 :: 		T08BIT_bit  =  0x01;              //Habiita timer 0 EM 16 BITS
	BSF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;Inicializer.c,65 :: 		T0CS_bit    =  0x00;              //Seleciona clock interno
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;Inicializer.c,66 :: 		T0SE_bit    =  0;
	BCF         T0SE_bit+0, BitPos(T0SE_bit+0) 
;Inicializer.c,67 :: 		PSA_bit     =  0x00;              //Habilita o Prescaler (pre contagem)
	BCF         PSA_bit+0, BitPos(PSA_bit+0) 
;Inicializer.c,68 :: 		T0PS2_bit   =  1;                 // Configura prescaler 1:2...
	BSF         T0PS2_bit+0, BitPos(T0PS2_bit+0) 
;Inicializer.c,69 :: 		T0PS1_bit   =  1;                 //...interrupção a cada 102,4us
	BSF         T0PS1_bit+0, BitPos(T0PS1_bit+0) 
;Inicializer.c,70 :: 		T0PS0_bit   =  1;
	BSF         T0PS0_bit+0, BitPos(T0PS0_bit+0) 
;Inicializer.c,79 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;Inicializer.c,83 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Inicializer.c,84 :: 		RS485Master_Init();
	CALL        _RS485Master_Init+0, 0
;Inicializer.c,86 :: 		HID_Enable(&HidReadBuff, &HidWriteBuff);
	MOVLW       Init_MCU_HidReadBuff_L0+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(Init_MCU_HidReadBuff_L0+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       Init_MCU_HidWriteBuff_L0+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(Init_MCU_HidWriteBuff_L0+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;Inicializer.c,88 :: 		I2C1_Init(100000);
	MOVLW       50
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;Inicializer.c,92 :: 		}
L_end_Init_MCU:
	RETURN      0
; end of _Init_MCU
