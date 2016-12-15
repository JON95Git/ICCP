#line 1 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Inicializer.c"
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/inicializer.h"
#line 5 "c:/users/jonathan/desktop/iccp upgrade/up3/inicializer.h"
void Init_MCU();
#line 9 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/Inicializer.c"
sbit rs485_rxtx_pin at RC0_bit;
sbit rs485_rxtx_pin_direction at TRISC0_bit;

void Init_MCU(){

 unsigned char HidReadBuff[5] absolute 0x500;
 unsigned char HidWriteBuff[5] absolute 0x540;


{
 ADCON1 = 0x0D;
 TRISA = 0b111111;
 TRISA3_bit = 1;
 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0xff;
 TRISC2_bit = 0;
 RC2_bit = 1;
 RC1_bit = 1;
 TRISC1_bit = 0;
 }

{
 RCIF_bit = 0x00;
 GIE_bit = 0x01;
 PEIE_bit = 0x01;
 RCIE_bit = 0x01;
 RCIP_bit = 0x00;
 IPEN_bit = 0x01;
 TXIE_bit = 0x00;




 TMR1ON_bit = 0x01;
 TMR1IE_bit = 0x01;
 TMR1IF_bit = 0x00;
 TMR1IP_bit = 0x01;

 TMR1CS_bit = 0x00;
 T1CKPS1_bit = 1;
 T1CKPS0_bit = 1;
 T1RUN_bit = 0;
 T1OSCEN_bit = 1;
 RD16_bit = 1;
 T1SYNC_bit = 1;
 T1OSCEN_bit = 0;


 TMR0IE_bit = 0x01;
 TMR0IF_bit = 0x00;
 TMR0IP_bit = 0x01;
 TMR0L = 0;

 TMR0ON_bit = 0x01;
 T08BIT_bit = 0x01;
 T0CS_bit = 0x00;
 T0SE_bit = 0;
 PSA_bit = 0x00;
 T0PS2_bit = 1;
 T0PS1_bit = 1;
 T0PS0_bit = 1;




 }

{

 ADC_Init();



 UART1_Init(9600);
 RS485Master_Init();

 HID_Enable(&HidReadBuff, &HidWriteBuff);

 I2C1_Init(100000);

 }

 }
