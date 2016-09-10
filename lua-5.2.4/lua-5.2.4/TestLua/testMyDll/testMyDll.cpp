/*
单纯使用dll，直接加载dll，不用动态lib
*/
#include <wtypes.h>
#include <winbase.h>  
#include <iostream>
_declspec(dllimport) int add(int a, int b);

typedef int(*pAdd)(int a, int b);

int main()
{
	HMODULE hDll;
	pAdd Add;
	hDll = LoadLibrary("myDll.dll");
	if (hDll == NULL)
	{
		std::cout << "Failed !" << std::endl;
		return 0;
	}
	Add = (pAdd)GetProcAddress(hDll, "add");
	int a = Add(1, 2);
	std::cout << "value = " << a << std::endl;
	FreeLibrary(hDll);
	while (1);
	return 0;
}