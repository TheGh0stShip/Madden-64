#include "types.h"

typedef struct RenderByteRecord {
    u8 pad0[0xF];
    u8 value;
} RenderByteRecord;

typedef struct RenderRecordBlock {
    u8 pad0[0xC];
    RenderByteRecord* records;
} RenderRecordBlock;

typedef struct RenderRecordState {
    u16 owner;
    u16 index;
    RenderRecordBlock* block;
} RenderRecordState;

typedef struct RenderRecordOwner {
    u8 pad0[8];
    RenderRecordState* state;
} RenderRecordOwner;

extern s32 func_80035598(u16 owner, u16 index);

void func_8000EBEC(RenderRecordOwner* owner, u8 value) {
    RenderRecordState* state = owner->state;
    RenderRecordBlock* block = state->block;
    u8* end = (u8*)block + func_80035598(state->owner, state->index);
    RenderByteRecord* record = block->records;

    while ((u8*)record < end) {
        record->value = value;
        record++;
    }
}
