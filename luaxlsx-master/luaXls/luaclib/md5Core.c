#include "md5.h"
#include <lua.h>
#include <lauxlib.h>

static int
lsum(lua_State *L) {
	const char *str = lua_tostring(L, -1);
	unsigned char digest[16];  //��Ž��  
	MD5_CTX md5c;
	MD5Init(&md5c); //��ʼ��  
	MD5UpdaterString(&md5c, str);
	MD5Final(digest, &md5c);
	for (int i = 0; i < 16; i++)
	{
		printf("%02x", digest[i]);
	}
	printf("\n");

	lua_pushlstring(L, (char*)digest, 16);
	return 1;
}

//һ��Ҫ��������Ȼ�Ҳ����������dllʱҪ�� lua52.dll��ϱ���
#ifdef _WIN32 
__declspec(dllexport) int luaopen_md5(lua_State *L)
#else
int luaopen_md5(lua_State *L)
#endif
{
	luaL_checkversion(L);
	luaL_Reg l[] = {
		{ "sum", lsum },
		{ NULL, NULL },
	};

	luaL_newlib(L, l);

	return 1;
}