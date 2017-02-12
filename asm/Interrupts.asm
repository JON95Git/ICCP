
_interrupt:

;Interrupts.c,26 :: 		void interrupt () {
;Interrupts.c,31 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;Interrupts.c,32 :: 		if (HID_Read())
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt0
;Interrupts.c,34 :: 		recebe_dados(HidReadBuff[0]);
	MOVF        1280, 0 
	MOVWF       FARG_recebe_dados_read_buff+0 
	CALL        _recebe_dados+0, 0
;Interrupts.c,35 :: 		}
L_interrupt0:
;Interrupts.c,37 :: 		if (TMR0IF_bit == 1)          //Verifica se houve interrupção do TIMER 0, usada nas entradas
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt1
;Interrupts.c,40 :: 		SAIDA_1 = (ENTRADA_1 == 1 && flagB1 == 0) ? ~ SAIDA_1 : SAIDA_1; flagB1 = 1;
	BTFSS       RA2_bit+0, BitPos(RA2_bit+0) 
	GOTO        L_interrupt4
	BTFSC       interrupt_flagB1_L0+0, BitPos(interrupt_flagB1_L0+0) 
	GOTO        L_interrupt4
L__interrupt79:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__interrupt82
	BSF         ?FLOC___interruptT6+0, BitPos(?FLOC___interruptT6+0) 
	GOTO        L__interrupt83
L__interrupt82:
	BCF         ?FLOC___interruptT6+0, BitPos(?FLOC___interruptT6+0) 
L__interrupt83:
	GOTO        L_interrupt5
L_interrupt4:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__interrupt84
	BCF         ?FLOC___interruptT6+0, BitPos(?FLOC___interruptT6+0) 
	GOTO        L__interrupt85
L__interrupt84:
	BSF         ?FLOC___interruptT6+0, BitPos(?FLOC___interruptT6+0) 
L__interrupt85:
L_interrupt5:
	BTFSC       ?FLOC___interruptT6+0, BitPos(?FLOC___interruptT6+0) 
	GOTO        L__interrupt86
	BCF         RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__interrupt87
L__interrupt86:
	BSF         RB2_bit+0, BitPos(RB2_bit+0) 
L__interrupt87:
	BSF         interrupt_flagB1_L0+0, BitPos(interrupt_flagB1_L0+0) 
;Interrupts.c,41 :: 		flagB1  = (ENTRADA_1 == 0 && flagB1 == 1) ? 0: flagB1;
	BTFSC       RA2_bit+0, BitPos(RA2_bit+0) 
	GOTO        L_interrupt8
	BTFSS       interrupt_flagB1_L0+0, BitPos(interrupt_flagB1_L0+0) 
	GOTO        L_interrupt8
L__interrupt78:
	BCF         ?FLOC___interruptT10+0, BitPos(?FLOC___interruptT10+0) 
	GOTO        L_interrupt9
L_interrupt8:
	BTFSC       interrupt_flagB1_L0+0, BitPos(interrupt_flagB1_L0+0) 
	GOTO        L__interrupt88
	BCF         ?FLOC___interruptT10+0, BitPos(?FLOC___interruptT10+0) 
	GOTO        L__interrupt89
L__interrupt88:
	BSF         ?FLOC___interruptT10+0, BitPos(?FLOC___interruptT10+0) 
L__interrupt89:
L_interrupt9:
	BTFSC       ?FLOC___interruptT10+0, BitPos(?FLOC___interruptT10+0) 
	GOTO        L__interrupt90
	BCF         interrupt_flagB1_L0+0, BitPos(interrupt_flagB1_L0+0) 
	GOTO        L__interrupt91
L__interrupt90:
	BSF         interrupt_flagB1_L0+0, BitPos(interrupt_flagB1_L0+0) 
L__interrupt91:
;Interrupts.c,43 :: 		SAIDA_2 = (ENTRADA_2 == 1 && flagB2 == 0) ? ~ SAIDA_2 : SAIDA_2; flagB2 = 1;
	BTFSS       RA3_bit+0, BitPos(RA3_bit+0) 
	GOTO        L_interrupt12
	BTFSC       interrupt_flagB2_L0+0, BitPos(interrupt_flagB2_L0+0) 
	GOTO        L_interrupt12
L__interrupt77:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L__interrupt92
	BSF         ?FLOC___interruptT15+0, BitPos(?FLOC___interruptT15+0) 
	GOTO        L__interrupt93
L__interrupt92:
	BCF         ?FLOC___interruptT15+0, BitPos(?FLOC___interruptT15+0) 
L__interrupt93:
	GOTO        L_interrupt13
L_interrupt12:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L__interrupt94
	BCF         ?FLOC___interruptT15+0, BitPos(?FLOC___interruptT15+0) 
	GOTO        L__interrupt95
L__interrupt94:
	BSF         ?FLOC___interruptT15+0, BitPos(?FLOC___interruptT15+0) 
L__interrupt95:
L_interrupt13:
	BTFSC       ?FLOC___interruptT15+0, BitPos(?FLOC___interruptT15+0) 
	GOTO        L__interrupt96
	BCF         RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L__interrupt97
L__interrupt96:
	BSF         RB3_bit+0, BitPos(RB3_bit+0) 
L__interrupt97:
	BSF         interrupt_flagB2_L0+0, BitPos(interrupt_flagB2_L0+0) 
;Interrupts.c,44 :: 		flagB2  = (ENTRADA_2 == 0 && flagB2 == 1) ? 0: flagB2;
	BTFSC       RA3_bit+0, BitPos(RA3_bit+0) 
	GOTO        L_interrupt16
	BTFSS       interrupt_flagB2_L0+0, BitPos(interrupt_flagB2_L0+0) 
	GOTO        L_interrupt16
L__interrupt76:
	BCF         ?FLOC___interruptT19+0, BitPos(?FLOC___interruptT19+0) 
	GOTO        L_interrupt17
L_interrupt16:
	BTFSC       interrupt_flagB2_L0+0, BitPos(interrupt_flagB2_L0+0) 
	GOTO        L__interrupt98
	BCF         ?FLOC___interruptT19+0, BitPos(?FLOC___interruptT19+0) 
	GOTO        L__interrupt99
L__interrupt98:
	BSF         ?FLOC___interruptT19+0, BitPos(?FLOC___interruptT19+0) 
L__interrupt99:
L_interrupt17:
	BTFSC       ?FLOC___interruptT19+0, BitPos(?FLOC___interruptT19+0) 
	GOTO        L__interrupt100
	BCF         interrupt_flagB2_L0+0, BitPos(interrupt_flagB2_L0+0) 
	GOTO        L__interrupt101
L__interrupt100:
	BSF         interrupt_flagB2_L0+0, BitPos(interrupt_flagB2_L0+0) 
L__interrupt101:
;Interrupts.c,46 :: 		SAIDA_3 = (ENTRADA_3 == 1 && flagB3 == 0) ? ~ SAIDA_3 : SAIDA_3; flagB3 = 1;
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_interrupt20
	BTFSC       interrupt_flagB3_L0+0, BitPos(interrupt_flagB3_L0+0) 
	GOTO        L_interrupt20
L__interrupt75:
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__interrupt102
	BSF         ?FLOC___interruptT24+0, BitPos(?FLOC___interruptT24+0) 
	GOTO        L__interrupt103
L__interrupt102:
	BCF         ?FLOC___interruptT24+0, BitPos(?FLOC___interruptT24+0) 
L__interrupt103:
	GOTO        L_interrupt21
L_interrupt20:
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__interrupt104
	BCF         ?FLOC___interruptT24+0, BitPos(?FLOC___interruptT24+0) 
	GOTO        L__interrupt105
L__interrupt104:
	BSF         ?FLOC___interruptT24+0, BitPos(?FLOC___interruptT24+0) 
L__interrupt105:
L_interrupt21:
	BTFSC       ?FLOC___interruptT24+0, BitPos(?FLOC___interruptT24+0) 
	GOTO        L__interrupt106
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__interrupt107
L__interrupt106:
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
L__interrupt107:
	BSF         interrupt_flagB3_L0+0, BitPos(interrupt_flagB3_L0+0) 
;Interrupts.c,47 :: 		flagB3  = (ENTRADA_3 == 0 && flagB3 == 1) ? 0: flagB3;
	BTFSC       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_interrupt24
	BTFSS       interrupt_flagB3_L0+0, BitPos(interrupt_flagB3_L0+0) 
	GOTO        L_interrupt24
L__interrupt74:
	BCF         ?FLOC___interruptT28+0, BitPos(?FLOC___interruptT28+0) 
	GOTO        L_interrupt25
L_interrupt24:
	BTFSC       interrupt_flagB3_L0+0, BitPos(interrupt_flagB3_L0+0) 
	GOTO        L__interrupt108
	BCF         ?FLOC___interruptT28+0, BitPos(?FLOC___interruptT28+0) 
	GOTO        L__interrupt109
L__interrupt108:
	BSF         ?FLOC___interruptT28+0, BitPos(?FLOC___interruptT28+0) 
L__interrupt109:
L_interrupt25:
	BTFSC       ?FLOC___interruptT28+0, BitPos(?FLOC___interruptT28+0) 
	GOTO        L__interrupt110
	BCF         interrupt_flagB3_L0+0, BitPos(interrupt_flagB3_L0+0) 
	GOTO        L__interrupt111
L__interrupt110:
	BSF         interrupt_flagB3_L0+0, BitPos(interrupt_flagB3_L0+0) 
L__interrupt111:
;Interrupts.c,49 :: 		SAIDA_4 = (ENTRADA_4 == 1 && flagB4 == 0) ? ~ SAIDA_4 : SAIDA_4; flagB4 = 1;
	BTFSS       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_interrupt28
	BTFSC       interrupt_flagB4_L0+0, BitPos(interrupt_flagB4_L0+0) 
	GOTO        L_interrupt28
L__interrupt73:
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__interrupt112
	BSF         ?FLOC___interruptT33+0, BitPos(?FLOC___interruptT33+0) 
	GOTO        L__interrupt113
L__interrupt112:
	BCF         ?FLOC___interruptT33+0, BitPos(?FLOC___interruptT33+0) 
L__interrupt113:
	GOTO        L_interrupt29
L_interrupt28:
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__interrupt114
	BCF         ?FLOC___interruptT33+0, BitPos(?FLOC___interruptT33+0) 
	GOTO        L__interrupt115
L__interrupt114:
	BSF         ?FLOC___interruptT33+0, BitPos(?FLOC___interruptT33+0) 
L__interrupt115:
L_interrupt29:
	BTFSC       ?FLOC___interruptT33+0, BitPos(?FLOC___interruptT33+0) 
	GOTO        L__interrupt116
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__interrupt117
L__interrupt116:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
L__interrupt117:
	BSF         interrupt_flagB4_L0+0, BitPos(interrupt_flagB4_L0+0) 
;Interrupts.c,50 :: 		flagB4  = (ENTRADA_4 == 0 && flagB4 == 1) ? 0: flagB4;
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_interrupt32
	BTFSS       interrupt_flagB4_L0+0, BitPos(interrupt_flagB4_L0+0) 
	GOTO        L_interrupt32
L__interrupt72:
	BCF         ?FLOC___interruptT37+0, BitPos(?FLOC___interruptT37+0) 
	GOTO        L_interrupt33
L_interrupt32:
	BTFSC       interrupt_flagB4_L0+0, BitPos(interrupt_flagB4_L0+0) 
	GOTO        L__interrupt118
	BCF         ?FLOC___interruptT37+0, BitPos(?FLOC___interruptT37+0) 
	GOTO        L__interrupt119
L__interrupt118:
	BSF         ?FLOC___interruptT37+0, BitPos(?FLOC___interruptT37+0) 
L__interrupt119:
L_interrupt33:
	BTFSC       ?FLOC___interruptT37+0, BitPos(?FLOC___interruptT37+0) 
	GOTO        L__interrupt120
	BCF         interrupt_flagB4_L0+0, BitPos(interrupt_flagB4_L0+0) 
	GOTO        L__interrupt121
L__interrupt120:
	BSF         interrupt_flagB4_L0+0, BitPos(interrupt_flagB4_L0+0) 
L__interrupt121:
;Interrupts.c,52 :: 		SAIDA_5 = (ENTRADA_5 == 1 && flagB5 == 0) ? ~ SAIDA_5 : SAIDA_5; flagB5 = 1;
	BTFSS       RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_interrupt36
	BTFSC       interrupt_flagB5_L0+0, BitPos(interrupt_flagB5_L0+0) 
	GOTO        L_interrupt36
L__interrupt71:
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__interrupt122
	BSF         ?FLOC___interruptT42+0, BitPos(?FLOC___interruptT42+0) 
	GOTO        L__interrupt123
L__interrupt122:
	BCF         ?FLOC___interruptT42+0, BitPos(?FLOC___interruptT42+0) 
L__interrupt123:
	GOTO        L_interrupt37
L_interrupt36:
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__interrupt124
	BCF         ?FLOC___interruptT42+0, BitPos(?FLOC___interruptT42+0) 
	GOTO        L__interrupt125
L__interrupt124:
	BSF         ?FLOC___interruptT42+0, BitPos(?FLOC___interruptT42+0) 
L__interrupt125:
L_interrupt37:
	BTFSC       ?FLOC___interruptT42+0, BitPos(?FLOC___interruptT42+0) 
	GOTO        L__interrupt126
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__interrupt127
L__interrupt126:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
L__interrupt127:
	BSF         interrupt_flagB5_L0+0, BitPos(interrupt_flagB5_L0+0) 
;Interrupts.c,53 :: 		flagB5  = (ENTRADA_5 == 0 && flagB5 == 1) ? 0: flagB5;
	BTFSC       RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_interrupt40
	BTFSS       interrupt_flagB5_L0+0, BitPos(interrupt_flagB5_L0+0) 
	GOTO        L_interrupt40
L__interrupt70:
	BCF         ?FLOC___interruptT46+0, BitPos(?FLOC___interruptT46+0) 
	GOTO        L_interrupt41
L_interrupt40:
	BTFSC       interrupt_flagB5_L0+0, BitPos(interrupt_flagB5_L0+0) 
	GOTO        L__interrupt128
	BCF         ?FLOC___interruptT46+0, BitPos(?FLOC___interruptT46+0) 
	GOTO        L__interrupt129
L__interrupt128:
	BSF         ?FLOC___interruptT46+0, BitPos(?FLOC___interruptT46+0) 
L__interrupt129:
L_interrupt41:
	BTFSC       ?FLOC___interruptT46+0, BitPos(?FLOC___interruptT46+0) 
	GOTO        L__interrupt130
	BCF         interrupt_flagB5_L0+0, BitPos(interrupt_flagB5_L0+0) 
	GOTO        L__interrupt131
L__interrupt130:
	BSF         interrupt_flagB5_L0+0, BitPos(interrupt_flagB5_L0+0) 
L__interrupt131:
;Interrupts.c,55 :: 		SAIDA_6= (ENTRADA_6 == 1 && flagB6 == 0) ? ~ SAIDA_6 : SAIDA_6; flagB6 = 1;
	BTFSS       RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_interrupt44
	BTFSC       interrupt_flagB6_L0+0, BitPos(interrupt_flagB6_L0+0) 
	GOTO        L_interrupt44
L__interrupt69:
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__interrupt132
	BSF         ?FLOC___interruptT51+0, BitPos(?FLOC___interruptT51+0) 
	GOTO        L__interrupt133
L__interrupt132:
	BCF         ?FLOC___interruptT51+0, BitPos(?FLOC___interruptT51+0) 
L__interrupt133:
	GOTO        L_interrupt45
L_interrupt44:
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__interrupt134
	BCF         ?FLOC___interruptT51+0, BitPos(?FLOC___interruptT51+0) 
	GOTO        L__interrupt135
L__interrupt134:
	BSF         ?FLOC___interruptT51+0, BitPos(?FLOC___interruptT51+0) 
L__interrupt135:
L_interrupt45:
	BTFSC       ?FLOC___interruptT51+0, BitPos(?FLOC___interruptT51+0) 
	GOTO        L__interrupt136
	BCF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__interrupt137
L__interrupt136:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
L__interrupt137:
	BSF         interrupt_flagB6_L0+0, BitPos(interrupt_flagB6_L0+0) 
;Interrupts.c,56 :: 		flagB6  = (ENTRADA_6 == 0 && flagB6 == 1) ? 0: flagB6;
	BTFSC       RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_interrupt48
	BTFSS       interrupt_flagB6_L0+0, BitPos(interrupt_flagB6_L0+0) 
	GOTO        L_interrupt48
L__interrupt68:
	BCF         ?FLOC___interruptT55+0, BitPos(?FLOC___interruptT55+0) 
	GOTO        L_interrupt49
L_interrupt48:
	BTFSC       interrupt_flagB6_L0+0, BitPos(interrupt_flagB6_L0+0) 
	GOTO        L__interrupt138
	BCF         ?FLOC___interruptT55+0, BitPos(?FLOC___interruptT55+0) 
	GOTO        L__interrupt139
L__interrupt138:
	BSF         ?FLOC___interruptT55+0, BitPos(?FLOC___interruptT55+0) 
L__interrupt139:
L_interrupt49:
	BTFSC       ?FLOC___interruptT55+0, BitPos(?FLOC___interruptT55+0) 
	GOTO        L__interrupt140
	BCF         interrupt_flagB6_L0+0, BitPos(interrupt_flagB6_L0+0) 
	GOTO        L__interrupt141
L__interrupt140:
	BSF         interrupt_flagB6_L0+0, BitPos(interrupt_flagB6_L0+0) 
L__interrupt141:
;Interrupts.c,58 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Interrupts.c,59 :: 		}
L_interrupt1:
;Interrupts.c,62 :: 		if (TMR1IF_bit == 1)          //Verifica se houve interrupção do TIMER 1
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt50
;Interrupts.c,65 :: 		x++;
	INCF        _x+0, 1 
;Interrupts.c,66 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Interrupts.c,67 :: 		}
L_interrupt50:
;Interrupts.c,70 :: 		if (RCIF_bit == 1)                // Verifica se houve interrupção da serial
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupt51
;Interrupts.c,72 :: 		recebe_dados(UART_Read());
	CALL        _UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_recebe_dados_read_buff+0 
	CALL        _recebe_dados+0, 0
;Interrupts.c,73 :: 		RCIF_bit = 0;
	BCF         RCIF_bit+0, BitPos(RCIF_bit+0) 
;Interrupts.c,74 :: 		}
L_interrupt51:
;Interrupts.c,75 :: 		}
L_end_interrupt:
L__interrupt81:
	RETFIE      1
; end of _interrupt

_recebe_dados:

;Interrupts.c,77 :: 		void recebe_dados(char read_buff) {
;Interrupts.c,80 :: 		SAIDA_1 = (read_buff  ==  '1' ) ?  ~ SAIDA_1  :  SAIDA_1;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados52
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__recebe_dados143
	BSF         ?FLOC___recebe_dadosT61+0, BitPos(?FLOC___recebe_dadosT61+0) 
	GOTO        L__recebe_dados144
L__recebe_dados143:
	BCF         ?FLOC___recebe_dadosT61+0, BitPos(?FLOC___recebe_dadosT61+0) 
L__recebe_dados144:
	GOTO        L_recebe_dados53
L_recebe_dados52:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__recebe_dados145
	BCF         ?FLOC___recebe_dadosT61+0, BitPos(?FLOC___recebe_dadosT61+0) 
	GOTO        L__recebe_dados146
L__recebe_dados145:
	BSF         ?FLOC___recebe_dadosT61+0, BitPos(?FLOC___recebe_dadosT61+0) 
L__recebe_dados146:
L_recebe_dados53:
	BTFSC       ?FLOC___recebe_dadosT61+0, BitPos(?FLOC___recebe_dadosT61+0) 
	GOTO        L__recebe_dados147
	BCF         RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L__recebe_dados148
L__recebe_dados147:
	BSF         RB2_bit+0, BitPos(RB2_bit+0) 
L__recebe_dados148:
;Interrupts.c,82 :: 		SAIDA_2 = (read_buff  ==  '2' ) ?  ~ SAIDA_2  :  SAIDA_2;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados54
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L__recebe_dados149
	BSF         ?FLOC___recebe_dadosT64+0, BitPos(?FLOC___recebe_dadosT64+0) 
	GOTO        L__recebe_dados150
L__recebe_dados149:
	BCF         ?FLOC___recebe_dadosT64+0, BitPos(?FLOC___recebe_dadosT64+0) 
L__recebe_dados150:
	GOTO        L_recebe_dados55
L_recebe_dados54:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L__recebe_dados151
	BCF         ?FLOC___recebe_dadosT64+0, BitPos(?FLOC___recebe_dadosT64+0) 
	GOTO        L__recebe_dados152
L__recebe_dados151:
	BSF         ?FLOC___recebe_dadosT64+0, BitPos(?FLOC___recebe_dadosT64+0) 
L__recebe_dados152:
L_recebe_dados55:
	BTFSC       ?FLOC___recebe_dadosT64+0, BitPos(?FLOC___recebe_dadosT64+0) 
	GOTO        L__recebe_dados153
	BCF         RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L__recebe_dados154
L__recebe_dados153:
	BSF         RB3_bit+0, BitPos(RB3_bit+0) 
L__recebe_dados154:
;Interrupts.c,84 :: 		SAIDA_3 = (read_buff  ==  '3' ) ?  ~ SAIDA_3  :  SAIDA_3;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados56
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__recebe_dados155
	BSF         ?FLOC___recebe_dadosT67+0, BitPos(?FLOC___recebe_dadosT67+0) 
	GOTO        L__recebe_dados156
L__recebe_dados155:
	BCF         ?FLOC___recebe_dadosT67+0, BitPos(?FLOC___recebe_dadosT67+0) 
L__recebe_dados156:
	GOTO        L_recebe_dados57
L_recebe_dados56:
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__recebe_dados157
	BCF         ?FLOC___recebe_dadosT67+0, BitPos(?FLOC___recebe_dadosT67+0) 
	GOTO        L__recebe_dados158
L__recebe_dados157:
	BSF         ?FLOC___recebe_dadosT67+0, BitPos(?FLOC___recebe_dadosT67+0) 
L__recebe_dados158:
L_recebe_dados57:
	BTFSC       ?FLOC___recebe_dadosT67+0, BitPos(?FLOC___recebe_dadosT67+0) 
	GOTO        L__recebe_dados159
	BCF         RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L__recebe_dados160
L__recebe_dados159:
	BSF         RB4_bit+0, BitPos(RB4_bit+0) 
L__recebe_dados160:
;Interrupts.c,86 :: 		SAIDA_4 = (read_buff  ==  '4' ) ?  ~ SAIDA_4  :  SAIDA_4;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados58
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__recebe_dados161
	BSF         ?FLOC___recebe_dadosT70+0, BitPos(?FLOC___recebe_dadosT70+0) 
	GOTO        L__recebe_dados162
L__recebe_dados161:
	BCF         ?FLOC___recebe_dadosT70+0, BitPos(?FLOC___recebe_dadosT70+0) 
L__recebe_dados162:
	GOTO        L_recebe_dados59
L_recebe_dados58:
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__recebe_dados163
	BCF         ?FLOC___recebe_dadosT70+0, BitPos(?FLOC___recebe_dadosT70+0) 
	GOTO        L__recebe_dados164
L__recebe_dados163:
	BSF         ?FLOC___recebe_dadosT70+0, BitPos(?FLOC___recebe_dadosT70+0) 
L__recebe_dados164:
L_recebe_dados59:
	BTFSC       ?FLOC___recebe_dadosT70+0, BitPos(?FLOC___recebe_dadosT70+0) 
	GOTO        L__recebe_dados165
	BCF         RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L__recebe_dados166
L__recebe_dados165:
	BSF         RB5_bit+0, BitPos(RB5_bit+0) 
L__recebe_dados166:
;Interrupts.c,88 :: 		SAIDA_5 = (read_buff  ==  '5' ) ?  ~ SAIDA_5  :  SAIDA_5;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados60
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__recebe_dados167
	BSF         ?FLOC___recebe_dadosT73+0, BitPos(?FLOC___recebe_dadosT73+0) 
	GOTO        L__recebe_dados168
L__recebe_dados167:
	BCF         ?FLOC___recebe_dadosT73+0, BitPos(?FLOC___recebe_dadosT73+0) 
L__recebe_dados168:
	GOTO        L_recebe_dados61
L_recebe_dados60:
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__recebe_dados169
	BCF         ?FLOC___recebe_dadosT73+0, BitPos(?FLOC___recebe_dadosT73+0) 
	GOTO        L__recebe_dados170
L__recebe_dados169:
	BSF         ?FLOC___recebe_dadosT73+0, BitPos(?FLOC___recebe_dadosT73+0) 
L__recebe_dados170:
L_recebe_dados61:
	BTFSC       ?FLOC___recebe_dadosT73+0, BitPos(?FLOC___recebe_dadosT73+0) 
	GOTO        L__recebe_dados171
	BCF         RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L__recebe_dados172
L__recebe_dados171:
	BSF         RB6_bit+0, BitPos(RB6_bit+0) 
L__recebe_dados172:
;Interrupts.c,90 :: 		SAIDA_6 = (read_buff  ==  '6' ) ?  ~ SAIDA_6  :  SAIDA_6;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       54
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados62
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__recebe_dados173
	BSF         ?FLOC___recebe_dadosT76+0, BitPos(?FLOC___recebe_dadosT76+0) 
	GOTO        L__recebe_dados174
L__recebe_dados173:
	BCF         ?FLOC___recebe_dadosT76+0, BitPos(?FLOC___recebe_dadosT76+0) 
L__recebe_dados174:
	GOTO        L_recebe_dados63
L_recebe_dados62:
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__recebe_dados175
	BCF         ?FLOC___recebe_dadosT76+0, BitPos(?FLOC___recebe_dadosT76+0) 
	GOTO        L__recebe_dados176
L__recebe_dados175:
	BSF         ?FLOC___recebe_dadosT76+0, BitPos(?FLOC___recebe_dadosT76+0) 
L__recebe_dados176:
L_recebe_dados63:
	BTFSC       ?FLOC___recebe_dadosT76+0, BitPos(?FLOC___recebe_dadosT76+0) 
	GOTO        L__recebe_dados177
	BCF         RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L__recebe_dados178
L__recebe_dados177:
	BSF         RB7_bit+0, BitPos(RB7_bit+0) 
L__recebe_dados178:
;Interrupts.c,92 :: 		SAIDA_7 = (read_buff  ==  '7' ) ?  ~ SAIDA_7  :  SAIDA_7;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados64
	BTFSC       RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L__recebe_dados179
	BSF         ?FLOC___recebe_dadosT79+0, BitPos(?FLOC___recebe_dadosT79+0) 
	GOTO        L__recebe_dados180
L__recebe_dados179:
	BCF         ?FLOC___recebe_dadosT79+0, BitPos(?FLOC___recebe_dadosT79+0) 
L__recebe_dados180:
	GOTO        L_recebe_dados65
L_recebe_dados64:
	BTFSC       RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L__recebe_dados181
	BCF         ?FLOC___recebe_dadosT79+0, BitPos(?FLOC___recebe_dadosT79+0) 
	GOTO        L__recebe_dados182
L__recebe_dados181:
	BSF         ?FLOC___recebe_dadosT79+0, BitPos(?FLOC___recebe_dadosT79+0) 
L__recebe_dados182:
L_recebe_dados65:
	BTFSC       ?FLOC___recebe_dadosT79+0, BitPos(?FLOC___recebe_dadosT79+0) 
	GOTO        L__recebe_dados183
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L__recebe_dados184
L__recebe_dados183:
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
L__recebe_dados184:
;Interrupts.c,94 :: 		SAIDA_8 = (read_buff  ==  '8' ) ?  ~ SAIDA_8  :  SAIDA_8;
	MOVF        FARG_recebe_dados_read_buff+0, 0 
	XORLW       56
	BTFSS       STATUS+0, 2 
	GOTO        L_recebe_dados66
	BTFSC       RC2_bit+0, BitPos(RC2_bit+0) 
	GOTO        L__recebe_dados185
	BSF         ?FLOC___recebe_dadosT82+0, BitPos(?FLOC___recebe_dadosT82+0) 
	GOTO        L__recebe_dados186
L__recebe_dados185:
	BCF         ?FLOC___recebe_dadosT82+0, BitPos(?FLOC___recebe_dadosT82+0) 
L__recebe_dados186:
	GOTO        L_recebe_dados67
L_recebe_dados66:
	BTFSC       RC2_bit+0, BitPos(RC2_bit+0) 
	GOTO        L__recebe_dados187
	BCF         ?FLOC___recebe_dadosT82+0, BitPos(?FLOC___recebe_dadosT82+0) 
	GOTO        L__recebe_dados188
L__recebe_dados187:
	BSF         ?FLOC___recebe_dadosT82+0, BitPos(?FLOC___recebe_dadosT82+0) 
L__recebe_dados188:
L_recebe_dados67:
	BTFSC       ?FLOC___recebe_dadosT82+0, BitPos(?FLOC___recebe_dadosT82+0) 
	GOTO        L__recebe_dados189
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
	GOTO        L__recebe_dados190
L__recebe_dados189:
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
L__recebe_dados190:
;Interrupts.c,95 :: 		}
L_end_recebe_dados:
	RETURN      0
; end of _recebe_dados
