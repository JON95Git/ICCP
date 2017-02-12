#line 1 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/RS_485.c"
#line 1 "c:/users/jonathan/desktop/iccp upgrade/up3/rs_485.h"
#line 7 "c:/users/jonathan/desktop/iccp upgrade/up3/rs_485.h"
typedef struct RS485_data
{
 char msg;
 char length_msg;
 char address;
};

void envia_slave(struct RS485_data);

void key_RS485(char key);
#line 9 "C:/Users/JONATHAN/Desktop/ICCP upgrade/Up3/RS_485.c"
void envia_slave(struct RS485_data dados_escravo)
{
 RS485Master_Send (dados_escravo.msg, dados_escravo.length_msg, dados_escravo.address);

}

void key_RS485(char key)
{
struct RS485_data dados_escravo;

 switch (key)
 {
 case 49:
 dados_escravo.msg = "01 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 50:
 dados_escravo.msg = "02 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 51:
 dados_escravo.msg = "03 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 52:
 dados_escravo.msg = "04 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 53:
 dados_escravo.msg = "05 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 54:
 dados_escravo.msg = "06 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 55:
 dados_escravo.msg = "07 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;

 case 56:
 dados_escravo.msg = "08 ";
 dados_escravo.length_msg = 3;
 dados_escravo.address = 'C';
 envia_slave(dados_escravo);
 break;


 }

 }
