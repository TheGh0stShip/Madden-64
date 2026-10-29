#include "types.h"

typedef struct {
    u8 r, g, b, a;
} Color;

typedef struct {
    s32 first;
    Color color;
    s32 third;
} Info;

void func_800DB44C(s32, s32 *, Color *, s32 *);
void func_800DC8B8(s32, u8, u8);

void func_800ACA00(void *arg0, u8 arg1) {
    s32 handle;
    Info info;

    handle = *(s32 *)(*(u8 **)((u8 *)arg0 + 0x24) + 0xC);
    func_800DB44C(handle, &info.first, &info.color, &info.third);
    func_800DC8B8(handle, info.color.a, arg1);
}
