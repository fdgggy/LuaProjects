#include "md5.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
	unsigned char digest[16];  //��Ž��  

							   //��һ���÷�:  

	MD5_CTX md5c;
	MD5Init(&md5c); //��ʼ��  
	//MD5UpdaterString(&md5c, "��Ҫ���Ե��ַ���f");
	MD5FileUpdateFile(&md5c, "a.txt");
	MD5Final(digest, &md5c);
	//�ڶ����÷�:  
	//MDString("��Ҫ���Ե��ַ���", digest); //ֱ�������ַ������ó����  

	//							  //�������÷�:  
	//MD5File("��Ҫ���Ե��ļ�·��", digest); //ֱ�������ļ�·�����ó����  
	getchar();
}