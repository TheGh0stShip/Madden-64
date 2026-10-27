#include "types.h"

extern u8 D_80088AF3;
extern u8 D_80088AF4;
extern u8 D_80088AF5;
extern u8 D_80088AF6;
extern u8 D_80088AF7;
extern u16 D_80088AEE;
extern u16 D_80088AF0;
extern s16 D_80088AEA;
extern s16 D_80088AEC;
extern u16 D_800876DC;
extern u16 D_80087AAC;
extern u16 D_80082D94;
extern u16 D_80084EE0;
extern u8 D_8008B060;
extern u8 D_8008B061;
extern volatile u8 D_8008B062;
extern volatile u8 D_8008B063;
extern u16 D_8008B064;
extern u16 D_8008B066;
extern u8 D_8008B068;
extern u8 D_8008B069;
extern u8 D_8008B06A;
extern u8 D_8008B06B;

extern s32 func_800278D8(s32 first, s32 second);
extern s32 func_80029944(void);
extern void func_800299B8(void);

void func_80029AD0(void)
{
    u32 first = D_80088AF4;
    u32 third = D_80088AF6;
    u32 fourth = D_80088AF7;
    u32 flag = D_80088AF3;
    u32 second;

    D_8008B060 = third;
    D_8008B061 = fourth;
    if (flag != 0) {
        first |= 0x80;
    }
    D_8008B062 = first;

    second = D_80088AF5;
    if (flag != 0) {
        second |= 0x80;
    }
    D_8008B063 = second;
    D_8008B064 = D_80087AAC | (D_800876DC << 13);
    D_8008B066 = D_80088AF0 - D_80088AEE;
    D_8008B068 = func_800278D8(D_80088AEA, D_80088AEC);
    D_8008B069 = func_80029944();
    D_8008B06A = D_80082D94;
    D_8008B06B = D_80084EE0;
    func_800299B8();
}
