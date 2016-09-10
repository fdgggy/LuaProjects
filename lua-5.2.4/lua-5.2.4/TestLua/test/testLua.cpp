#include <stdio.h>  
  

#include "tesLua.h"

int main(int argc, char* argv[])  
{
    lua_State* L = luaL_newstate();  
    luaL_openlibs(L);  
    luaL_dofile(L, "test.lua");  
    lua_close(L);  
	getchar();
    return 0;  
}  