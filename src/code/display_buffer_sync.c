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
        u32 page;
        volatile u32 *state_base;
        volatile u32 *state;
        void *context;
        u32 argument;
        u32 count;
        u32 flags;

        do {
            argument = 0;
            page = D_80089516;
            state_base = D_80086170;
            context = D_8008B398;
            page ^= 1;
            page <<= 2;
            state = (volatile u32 *)(page + (u32)state_base);
            *state = 0;
            flags = D_8008B070;
            count = 1;
            flags &= ~1;
            D_8008B070 = flags;
            func_8004CF48(context, argument, count);
        } while (0);
    }
}
