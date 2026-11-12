#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} GfxPair;

extern GfxPair* D_80084F5C;
extern void func_8000AAD4(u32, u32, u32, u32, u32, u32, u32, u32,
                          u32, u32, u32, u32);

void func_800093F4(const void* texture) {
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
    func_8000AAD4(0, 0, 0, 0x100, 7, 0, 0, 0, 0, 0, 0, 0);
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xE6000000;
        command->w1 = 0;
    }
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xF0000000;
        command->w1 = 0x073FC000;
    }
    {
        GfxPair* command = D_80084F5C++;
        command->w0 = 0xE7000000;
        command->w1 = 0;
    }
}
