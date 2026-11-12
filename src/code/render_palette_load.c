#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} GfxPair;

extern GfxPair* D_80084F5C;
extern void func_8000AAD4(u32, u32, u32, u32, u32, u32, u32, u32,
                          u32, u32, u32, u32);

void func_80009310(u32 palette, const void* texture) {
    u32 entries = 0x100 | ((palette & 0xF) << 4);

    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xFD100000;
        command->w1 = (u32)texture;
    }
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xE8000000;
        command->w1 = 0;
    }
    func_8000AAD4(0, 0, 0, entries, 7, 0, 0, 0, 0, 0, 0, 0);
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xE6000000;
        command->w1 = 0;
    }
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xF0000000;
        command->w1 = 0x0703C000;
    }
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xE7000000;
        command->w1 = 0;
    }
}
