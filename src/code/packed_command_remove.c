#include "types.h"

typedef struct PackedCommand {
    u8 bytes[4];
} PackedCommand;

typedef struct CommandBuffer {
    u16 count;
    PackedCommand commands[1];
} CommandBuffer;

extern u8* D_800740C4;
extern void func_8002E17C(void* destination, void* source, u32 size);

void func_80040214(u16 index) {
    CommandBuffer* buffer = (CommandBuffer*)D_800740C4;

    buffer->count--;
    if (index != buffer->count) {
        s16 signed_index = index;
        func_8002E17C(&buffer->commands[signed_index],
                      &buffer->commands[signed_index + 1],
                      (buffer->count - signed_index) * sizeof(PackedCommand));
    }
}
