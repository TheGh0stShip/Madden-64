#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 w;
    s32 h;
} Rect;

typedef struct {
    u8 pad00[0x20];
    s32 unk20;
} Node;

typedef struct {
    u8 pad00[0x28];
    Node *node;
} Owner;

void func_8001F070(Node *, s32, Rect *);

void func_800B71A0(Node *row, u8 index, Owner *owner) {
    Node *node = owner->node;
    Rect pt;

    if (node->unk20 == 0) {
        pt.y = row->unk20 + 0x10;
        func_8001F070(node, index + 1, &pt);
        row->unk20 = pt.y - 0x10;
    }
}
