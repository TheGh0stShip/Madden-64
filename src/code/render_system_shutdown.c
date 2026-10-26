#include "types.h"

extern void *D_80065528;
extern void *D_80065524;
extern s16 D_80065500;
extern void *D_800854A8[64];
extern void *D_8008B7A0[64];
extern void *D_800876D8;
extern void *D_8006551C;
extern void *D_8008B8A0;
extern void *D_8008B32C;
extern s16 D_80065502;
extern s16 D_80065504;
extern s16 D_8006550E;
extern s16 D_80065510;
extern s16 D_80065512;
extern s32 D_80065514;
extern s32 D_80065518;
extern s16 D_80065520;
extern s32 D_80065508;
extern s16 D_8006552C;

extern void func_8000B7E4(void *);
extern void func_8000D684(void *);
extern void func_80032F3C(s32, void *);

void render_system_shutdown(void)
{
    s16 index = 0;
    register s32 one __asm__("$3");
    register u16 counter __asm__("$2");

    func_8000B7E4(D_80065528);
    D_80065528 = 0;
    D_80065500 = 0;
    func_8000D684(D_80065524);
    D_80065524 = 0;

    do {
        func_80032F3C(0, D_800854A8[index]);
        func_80032F3C(0, D_8008B7A0[index]);
        D_800854A8[index] = 0;
        D_8008B7A0[index] = 0;
        index++;
    } while (index < 64);

    func_80032F3C(0, D_800876D8);
    func_80032F3C(0, D_8006551C);
    {
        register void **last_allocation __asm__("$16") = &D_8008B8A0;

        __asm__ volatile("" : : "r"(last_allocation));
        func_80032F3C(0, *last_allocation);
        counter = D_80065520;
        one = 1;
        __asm__ volatile("" : : "r"(counter), "r"(one));
        D_8008B32C = 0;
        D_800876D8 = 0;
        D_8006551C = 0;
        *last_allocation = 0;
    }
    D_80065502 = 0;
    D_80065504 = one;
    D_8006550E = 0;
    D_80065510 = 0;
    D_80065512 = 0;
    D_80065514 = 0;
    D_80065518 = 0;
    __asm__ volatile("" : : : "memory");
    counter++;
    D_80065520 = counter;
    if ((s16)counter >= 5) {
        D_80065520 = 0;
    }
    D_80065508 = 0;
    D_8006552C = one;
}
