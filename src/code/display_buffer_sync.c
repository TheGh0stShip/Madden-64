#include "types.h"

extern volatile u16 D_8008B070;
extern u16 D_80089516;
extern u32 D_800855D8[];
extern volatile u32 D_80086170[];
extern u8 D_8008B398[];
extern u32 func_8004E1F8(void);
extern void func_8004CF48(void *context, u32 value, u32 count);

void display_buffer_sync(void)
{
    u32 *buffer;
    u32 current;

    if ((D_8008B070 & 1) == 0) {
        return;
    }

    buffer = &D_800855D8[D_80089516 ^ 1];
    current = func_8004E1F8();
    if (*buffer == current) {
        register u32 page __asm__("$2");
        register volatile u32 *state_base __asm__("$3");
        register volatile u32 *state __asm__("$2");
        register void *context __asm__("$4");
        register u32 argument __asm__("$5");
        register u32 count __asm__("$6");
        register u32 flags __asm__("$2");

        __asm__ volatile("" ::: "memory");
        page = D_80089516;
        state_base = D_80086170;
        context = D_8008B398;
        page ^= 1;
        page <<= 2;
        state = (volatile u32 *)(page + (u32)state_base);
        *state = 0;
        flags = D_8008B070;
        argument = 0;
        count = 1;
        flags &= ~1;
        D_8008B070 = flags;
        func_8004CF48(context, argument, count);
    }
}
