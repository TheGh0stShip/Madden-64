#include "types.h"

extern u8 D_80088AE4;
extern u8 D_80088AE8;
extern u8 D_80088AEA;
extern u8 D_80088AEC;
extern u8 D_80088AEE;
extern u8 D_80088AF0;
extern u8 D_80088AF2;
extern u8 D_80088AF3;
extern u8 D_80088AF8;
extern u8 D_80088AF9;
extern u8 D_80088AFA;
extern u32 D_80084F34;
extern s16 D_800876DC;
extern u16 D_80087A60;
extern u16 D_80087AAC;
extern void func_80033308(u32 first, void *destination, u32 size, u32 fourth);

void menu_cursor_state_initialize(void)
{
    register u32 packed __asm__("$5");
    register u32 dimension __asm__("$3");
    register s32 count __asm__("$2");
    register u32 high __asm__("$6");
    register s32 product __asm__("$4");
    register u32 adjustment __asm__("$6");
    register u32 initial __asm__("$2");
    register s32 byte_value __asm__("$5");
    register s32 position __asm__("$3");

    func_80033308(0, &D_80088AE8, 0x8C, 0);
    packed = D_80084F34;
    __asm__("" : "=r"(packed) : "0"(packed));
    dimension = D_80087A60;
    __asm__("" : "=r"(dimension) : "0"(dimension));
    count = D_800876DC;
    __asm__("" : "=r"(count) : "0"(count));
    D_80088AF2 = 0;
    D_80088AFA = 0;
    D_80088AF9 = 0;
    __asm__ volatile("" ::: "memory");
    high = packed >> 16;
    product = (s16)dimension * (count - 1);
    __asm__ volatile("" : "=r"(product) : "0"(product));
    *(u16 *)&D_80088AEC = high;
    *(u16 *)&D_80088AEA = high;
    adjustment = D_80087AAC;
    initial = *(u16 *)&D_80088AE4;
    byte_value = ((s32)packed >> 20) + 0x32;
    D_80088AF8 = byte_value;
    position = dimension - adjustment;
    D_80088AF3 = initial;
    __asm__ volatile("" ::: "memory");
    position += product;
    *(u16 *)&D_80088AF0 = position;
    *(u16 *)&D_80088AEE = position;
}
