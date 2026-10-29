#include "types.h"

typedef struct {
    u8 pad00[0x8];
    s32 source;
    u8 pad0C[0xC];
    s32 target;
    u8 pad1C[0x54 - 0x1C];
    s16 kind;
    u8 pad56[2];
} Message;

typedef struct {
    u8 pad00[0x8];
    s32 source;
    u8 pad0C[0xC];
    s32 target;
} Sender;

extern void func_80043F7C(Message *msg, s32 type, s32 arg2, s32 arg3, s32 arg4);

void func_800E26E4(Sender *sender, s32 arg1, s32 arg2) {
    Message msg;

    msg.source = sender->source;
    msg.kind = 7;
    msg.target = sender->target;
    func_80043F7C(&msg, 0xE, arg1, arg2, 0);
}
