/*
 * Módulo RS_485
 * Contém as rotinas estruturadas para comunicação entre
 * mestre e escravo.
 */

typedef struct RS485_data
{
     char msg;
     char length_msg;
     char address;
};

void envia_slave(struct RS485_data);

void key_RS485(char key);