#include "types.h"

extern u8* D_800740C4;
extern void func_8003FF14(void* source, void* destination);

typedef struct PackedCommand {
    u8 bytes[4];
} PackedCommand;

typedef struct CommandBuffer {
    u16 count;
    PackedCommand commands[1];
} CommandBuffer;

void func_800401D0(void* source) {
    register CommandBuffer* buffer __asm__("$2") =
        (CommandBuffer*)D_800740C4;

    func_8003FF14(source, &buffer->commands[buffer->count]);
    (*(u16*)D_800740C4)++;
}
