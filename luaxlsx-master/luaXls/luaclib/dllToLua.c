#include <lua.h>
#include <lauxlib.h>

static int
lAddXY(lua_State *L) {
	int v = lua_tonumber(L, -1);
	lua_pushnumber(L, v * v);
	return 1;
}
//一定要导出，不然找不到，编译成dll时要和 lua52.dll结合编译
int luaopen_dllToLua(lua_State *L) {
	luaL_checkversion(L);
	luaL_Reg l[] = {
		{ "AddXY", lAddXY },
		{ NULL, NULL },
	};

	luaL_newlib(L, l);

	return 1;
}