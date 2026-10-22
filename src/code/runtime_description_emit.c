#include "types.h"

typedef void (*DescribeCallback)(void*, void*);

extern void func_800049D8(void);
extern void func_8002CA88(void (*)(void), void*);

void func_8006345C(void* object) {
    u8 description[200];
    u8* table = *(u8**)object;
    DescribeCallback describe = *(DescribeCallback*)(table + 0xC);

    describe(object, description);
    func_8002CA88(func_800049D8, description);
}
