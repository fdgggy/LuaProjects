#include "md5.h"
#include <lua.h>
#include <lauxlib.h>

static int
lsum(lua_State *L) {
	const char *str = lua_tostring(L, -1);
	unsigned char digest[16];  //存放结果  
	MD5_CTX md5c;
	MD5Init(&md5c); //初始化  
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

//一定要导出，不然找不到，编译成dll时要和 lua52.dll结合编译
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