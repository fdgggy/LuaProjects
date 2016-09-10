#include <lua.h>
#include <lauxlib.h>

static int
lAddXY(lua_State *L) {
	int v = lua_tonumber(L, -1);
	lua_pushnumber(L, v * v);
	return 1;
}
//һ��Ҫ��������Ȼ�Ҳ����������dllʱҪ�� lua52.dll��ϱ���
int luaopen_dllToLua(lua_State *L) {
	luaL_checkversion(L);
	luaL_Reg l[] = {
		{ "AddXY", lAddXY },
		{ NULL, NULL },
	};

	luaL_newlib(L, l);

	return 1;
}