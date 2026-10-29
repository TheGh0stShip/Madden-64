#include "types.h"

typedef struct {
    u8 pad00[0xC];
    struct { u8 pad00[0xC]; s32 unk0C; } *unk0C;
    u8 pad10[0x29 - 0x10];
    u8 unk29;
} Node;
typedef struct { u8 pad00[0xC]; Node *unk0C; } Owner;
typedef struct { u8 pad00[0x14]; s32 flags; } Status;
typedef struct {
    Owner *owner;
    u8 pad04[0xC];
    Status *status;
} Item;

extern void (*D_800725B8)(void);

void func_80024F5C(void);
u16 func_80028224(void);
void func_8003A600(s32, s32);
void func_80094114(void);
void func_800D5DA0(Item *, s32);
void func_800D5E0C(Node *, s32, u8, Status *);
void func_800DF72C(void);

void func_8009F4E8(Item *item, s32 arg1, s16 event) {
    Node *node;

    switch (event) {
        case 13:
            node = item->owner->unk0C;
            func_800D5E0C(node, node->unk0C->unk0C, node->unk29, item->status);
            item->status->flags |= 1;
            break;
        case 12:
            func_800D5DA0(item, arg1);
            break;
        case 28:
            func_800DF72C();
            D_800725B8();
            break;
        case 17:
            if (func_80028224() != 3) {
                func_80024F5C();
            }
            func_8003A600(0, 1);
            func_80094114();
            break;
    }
}
