ZLIB_DIR = luaclib/zlib/

ZLIB_SRC = $(addprefix $(ZLIB_DIR), \
 adler32.c\
 compress.c\
 crc32.c\
 deflate.c\
 gzclose.c\
 gzlib.c\
 gzread.c\
 gzwrite.c\
 infback.c\
 inffast.c\
 inflate.c\
 inftrees.c\
 trees.c\
 uncompr.c\
 zutil.c\
)

MINIZIP_DIR = luaclib/minizip/

MINIZIP_SRC = $(addprefix $(MINIZIP_DIR), \
ioapi.c\
iowin32.c\
mztools.c\
unzip.c\
zip.c\
)

MD5_DIR = luaclib/md5/
MD5_SRC = $(addprefix $(MD5_DIR), \
md5.c\
)

CFLAGS = -O2 -Wall

all : zip.dll winapi.dll base64.dll dllToLua.dll md5.dll

zip.dll : luaclib/luazip.c $(ZLIB_SRC) $(MINIZIP_SRC)
	gcc $(CFLAGS) --shared -o $@ $^ -I$(ZLIB_DIR) -I$(MINIZIP_DIR) -I/usr/local/include -L/bin -llua52

winapi.dll : luaclib/winapi.c
	gcc $(CFLAGS) --shared -o $@ $^ -I/usr/local/include -L/bin -llua52 -luser32 -lole32

base64.dll : luaclib/lbase64.c
	gcc $(CFLAGS) --shared -o $@ $^ -I/usr/local/include -L/bin -llua52
	
dllToLua.dll : luaclib/dllToLua.c
	gcc $(CFLAGS) --shared -o $@ $^ -I/usr/local/include -L/bin -llua52

md5.dll : luaclib/md5Core.c
	gcc $(CFLAGS) --shared -o $@ $^  -I$(MD5_DIR) -I/usr/local/include -L/bin -llua52
clean :
	rm $(ALL)

