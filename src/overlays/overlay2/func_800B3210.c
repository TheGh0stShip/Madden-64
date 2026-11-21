#include "types.h"

typedef struct Node {
    u8 pad00[4];
    struct Node *unk_04;
    u8 pad08[4];
    struct Node *unk_0C;
    s32 unk_10;
    s32 unk_14;
    u8 pad18[0x11];
    u8 unk_29;
} Node;

typedef struct {
    Node *unk_00;
    u8 pad04[0xC];
    Node *unk_10;
} Obj;

extern u8 D_800BFC24[];
void func_8003CB2C(s16);
void func_800B3558(s32, s32, Obj *, s32);
void func_800B3700(s32, s32, Obj *, s32);
void func_800D5DA0(Obj *);
void func_800D5E0C(Node *, Node *, u8, Node *);
void func_800DF72C(void);
s16 func_800E0138(u8 *);

void func_800B3210(Obj *obj, s32 arg1, s16 cmd)
{
    Node *node;
    Node *child;

    node = obj->unk_00->unk_0C;
    switch (cmd) {
    case 13:
        func_800D5E0C(node, node->unk_0C->unk_0C, node->unk_29, obj->unk_10);
        obj->unk_10->unk_14 |= 1;
        break;
    case 12:
        func_800D5DA0(obj);
        break;
    case 2:
        if (node->unk_29 == 10) {
            func_800B3558(1, 0, obj, 0x1F);
        } else if (node->unk_29 == 11) {
            func_800B3700(1, 0, obj, 0x20);
        }
        break;
    case 3:
        if (node->unk_29 == 10) {
            func_800B3558(0, 0, obj, 0x1F);
        } else if (node->unk_29 == 11) {
            func_800B3700(0, 0, obj, 0x20);
        }
        break;
    case 26:
        if (node->unk_29 == 12) {
            func_8003CB2C(func_800E0138(D_800BFC24));
        }
        break;
    case 28:
        node = obj->unk_00->unk_0C;
        child = node->unk_0C;
        node->unk_04->unk_14 = (s32)child->unk_0C;
        if (child->unk_0C->unk_0C) {
            func_800DF72C();
            ((void (*)(void))child->unk_0C->unk_0C)();
        }
        break;
    default:
        func_800B3558(node->unk_29 == 10 ? 5 : 6, 0, obj, 0x1F);
        func_800B3700(node->unk_29 == 11 ? 5 : 6, 0, obj, 0x20);
        break;
    }
}
