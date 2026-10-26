#include "types.h"

extern s16 D_800740CA;
extern u8 D_80080D89[];
extern u8 D_800740BC[];
extern u8 D_800740A4[];
extern s16 func_8003FE94(u16 value);
extern s32 func_80031A1C(s32 value);
extern void func_8003F060(s32 first, s32 second, s32 third);
extern void func_80022738(s32 first, s32 second);

s32 audio_sequence_prepare(s32 first, u32 second)
{
    register s32 saved_first __asm__("$17") = first;
    register u32 saved_second __asm__("$18") = second;
    register s32 work __asm__("$16") = first;
    register s32 random __asm__("$16");
    register s32 temp __asm__("$3");
    register s32 call_result __asm__("$2");
    register s32 a0_work __asm__("$4");
    register u32 chosen __asm__("$6");
    register u32 final_second __asm__("$16");
    s32 row;
    s32 next_index;

    if (D_800740CA == 0) goto failure;
    if (func_8003FE94((u16)saved_first) == -1) goto failure;
    a0_work = (u16)saved_second * 0x28;
    row = (s16)first;
    a0_work += row * 0x214C;
    work = D_80080D89[a0_work];
    temp = work;
    __asm__("" : "=r"(temp) : "0"(temp));
    if (temp == 0xFF) goto failure;
    a0_work = 300;
    __asm__("" : "=r"(a0_work) : "0"(a0_work));
    work = -work;
    call_result = func_80031A1C(a0_work);
    call_result += 200;
    work += call_result;
    if ((u16)func_80031A1C((u16)work) >= 325) goto proceed;
failure:
    return 0;

proceed:
    random = func_80031A1C(99);
    a0_work = 6;
    if ((s16)random < 0) goto selected;
choose:
    next_index = a0_work - 1;
    temp = (s16)next_index;
    temp = random - D_800740BC[temp];
    __asm__("" : "=r"(temp) : "0"(temp));
    random = temp;
    __asm__("" : "=r"(random), "=r"(temp) : "0"(random), "1"(temp));
    __asm__("" : "=r"(temp) : "0"(temp), "r"(a0_work), "r"(next_index));
    a0_work = next_index;
    if ((s16)temp >= 0) goto choose;
selected:
    work = a0_work << 16;
    __asm__("" : "=r"(work) : "0"(work));
    work >>= 14;
    a0_work = D_800740A4[work + 1];
    a0_work -= D_800740A4[work];
    call_result = func_80031A1C((u16)a0_work);
    a0_work = (s16)saved_first;
    chosen = D_800740A4[work] + call_result;
    final_second = (u16)saved_second;
    func_8003F060(a0_work, final_second, (u16)chosen);
    func_80022738((u16)saved_first, final_second);
    return 1;
}
