/*
 * M�dulo RS_485
 * Cont�m as rotinas estruturadas para comunica��o entre
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