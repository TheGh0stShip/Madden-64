#include "types.h"

typedef struct {
    s32 unk0;
    s32 pos;
    s32 unk8;
    s32 unkC;
} Cursor;

typedef struct {
    u8 pad[0x20];
    s32 unk20;
} Node;

typedef struct {
    u8 pad[0x28];
    Node *node;
} Owner;

void func_8001F070(Node *, s32, Cursor *);

void func_8009F308(Node *self, u8 kind, Owner *owner) {
    Node *node = owner->node;
    Cursor cursor;

    if (node->unk20 == 0) {
        cursor.pos = self->unk20 + 0x10;
        func_8001F070(node, kind + 0x11, &cursor);
        self->unk20 = cursor.pos - 0x10;
    }
}
