/*
 * Módulo RS_485
 * Contém as rotinas estruturadas para comunicação entre
 * mestre e escravo.
 */
#include "RS_485.h"


void envia_slave(struct RS485_data dados_escravo)
{
  RS485Master_Send (dados_escravo.msg, dados_escravo.length_msg, dados_escravo.address);

}

void key_RS485(char key)
{
struct RS485_data dados_escravo;

    switch (key)
       {
        case  49:
                dados_escravo.msg = "01 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 1

        case  50:
                dados_escravo.msg = "02 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 2

        case  51:
                dados_escravo.msg = "03 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 3

        case  52:
                dados_escravo.msg = "04 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 4

        case  53:
                dados_escravo.msg = "05 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 5

        case  54:
                dados_escravo.msg = "06 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 6

        case  55:
                dados_escravo.msg = "07 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 7

        case  56:
                dados_escravo.msg = "08 ";
                dados_escravo.length_msg = 3;
                dados_escravo.address = 'C';
                envia_slave(dados_escravo);
                break; // 8


        }//Fim do Switch do keypad
        
 }