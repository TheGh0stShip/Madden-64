#include "types.h"

typedef struct ResourcePayloadState {
    u8 pad00[8];
    void *payload;
    u16 type;
    u8 pad0E[0x12];
    void *source;
    u8 pad24[0xC];
    u32 flags;
} ResourcePayloadState;

typedef struct ResourcePayloadContext {
    u8 pad00[8];
    ResourcePayloadState *state;
} ResourcePayloadContext;

extern void *func_80032E00(u32 owner, u32 size);
extern void func_8002E17C(void *destination, void *source, u32 size);

void resource_payload_prepare(ResourcePayloadContext *context)
{
    ResourcePayloadState *state = context->state;
    u32 size = 0;
    u32 owner;
    u32 flags = state->flags;

    do {
        if (flags & 8) {
            s32 type = state->type;
            u32 is_four;

            if (type == 8) {
                size = 0x100;
                goto allocate;
            }
            owner = 0;
            if (type >= 9) {
                goto size_ready;
            }
            is_four = type == 4;
            size = is_four << 4;
            goto size_ready;
allocate:
            owner = 0;
size_ready:
            size *= 2;
            state->payload = func_80032E00(owner, size);
            func_8002E17C(state->payload, state->source, size);
            state->flags &= ~8U;
        } else {
            state->flags = flags | 0x800;
        }
    } while (0);
}
