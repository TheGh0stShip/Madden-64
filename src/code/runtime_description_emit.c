#include "types.h"

typedef void (*DescribeCallback)(void*, void*);

extern char D_800049D8[];
extern s32 func_8002CA88(const char *, ...);

void func_8006345C(void* object) {
    u8 description[200];
    u8* table = *(u8**)object;
    DescribeCallback describe = *(DescribeCallback*)(table + 0xC);

    describe(object, description);
    func_8002CA88(D_800049D8, description);
}
