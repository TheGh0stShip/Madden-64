#include "types.h"

extern void *D_80085038;
extern u32 D_8008AF98;
extern void *D_80064B70;
extern void *D_80064B78;
extern void *D_80064B88;
extern void *D_80064B8C;
extern void *D_80064B90;
extern u32 D_80064B94;
extern void *D_8008B350[];
extern u32 D_80087A88[];
extern u32 D_80086170[];

extern void func_8004F1D8(void);
extern void func_8004D814(void *);
extern void func_8004D9A4(void *);

void display_page_configure(u16 page)
{
    register void *buffer __asm__("$3") = D_80085038;
    register u32 buffer_size __asm__("$5") = D_8008AF98;
    register u32 index __asm__("$16") = page * 4;
    register u8 *task __asm__("$17") = (u8 *)&D_80064B88;
    void **page_slot;

    D_80064B70 = (void *)0x80050F78;
    D_80064B78 = (void *)0x80075D00;
    *(void **)task = buffer;
    D_80064B8C = (u8 *)buffer + buffer_size;
    page_slot = (void **)((u8 *)D_8008B350 + index);
    D_80064B90 = *page_slot;
    D_80064B94 = *(u32 *)((u8 *)D_80087A88 + index) - (u32)*page_slot;
    __asm__("" : "=r"(task) : "0"(task));
    func_8004F1D8();
    task -= 0x28;
    index += (u32)D_80086170;
    *(u32 *)index = 1;
    func_8004D814(task);
    func_8004D9A4(task);
}
