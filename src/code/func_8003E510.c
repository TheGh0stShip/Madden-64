#include "types.h"

extern u8 D_80080C90[];
extern u8 D_80082DDC;
extern u8 D_80082D96[];
extern u8 D_80082D94[];
extern u8 D_80082DB0[];
extern void func_80039674(void);
extern void func_80024694(void);
extern void func_8003A7DC(u32, void *);
extern void func_8003A8CC(u32, void *);
extern void func_8003AE80(void *, void *);
extern void func_80024E9C(void);
extern void func_8003E9B0(void);
extern void func_800396E0(s32);

void func_8003E510(u8 first, u8 second, u16 enabled)
{
    u16 index;

    D_80080C90[0] = first;
    D_80082DDC = second;
    if (enabled != 0) {
        func_80039674();
    }
    func_80024694();
    index = 0;
    do {
        u32 offset = index * 0x214C;
        func_8003A7DC(D_80080C90[offset], D_80080C90 + offset);
        func_8003A8CC(D_80080C90[offset], D_80080C90 + offset + 0x6C);
        func_8003AE80(D_80080C90 + offset + 0x6C,
                      D_80080C90 + offset + 0xDA);
        *(s16 *)(D_80082D96 + offset) = 3;
        *(s16 *)(D_80082D94 + offset) = 0;
        *(s16 *)(D_80082DB0 + offset) = 0;
        index++;
    } while (index < 2);
    func_80024E9C();
    func_8003E9B0();
    if (enabled != 0) {
        func_800396E0(1);
    }
}
