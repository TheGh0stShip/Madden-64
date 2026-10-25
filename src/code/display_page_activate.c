#include "types.h"

extern u32 D_80087908[];
extern u32 D_80086170[];
extern u32 func_80046918(void);
extern void func_8004D168(u32 value);
extern void func_8000BB98(u32 page);

void display_page_activate(u32 page)
{
    register u32 saved_page __asm__("$16") = page;
    register u32 saved_state __asm__("$17");
    register u32 index __asm__("$2");
    register u32 *pages __asm__("$5");
    register u32 *address __asm__("$4");
    register u32 *states __asm__("$3");
    register u32 flags __asm__("$3");

    saved_state = func_80046918();
    func_8004D168(1);
    index = (u16)(saved_page ^ 1);
    pages = D_80087908;
    __asm__ volatile("" : "=r"(pages) : "0"(pages));
    index <<= 2;
    address = (u32 *)(index + (u32)pages);
    __asm__("" : "=r"(address) : "0"(address));
    states = D_80086170;
    __asm__("" : "=r"(states) : "0"(states));
    index = *(u32 *)(index + (u32)states);
    flags = *address;
    index &= 1;
    flags |= index;
    if (flags != 0) {
        index = (u16)saved_page;
        index <<= 2;
        *(u32 *)(index + (u32)pages) = 1;
        func_8004D168(saved_state);
    } else {
        func_8004D168(saved_state);
        func_8000BB98((u16)saved_page);
    }
}
