#include "types.h"

typedef struct {
    s16 x;
    s16 y;
    s16 w;
    s16 h;
} Rect;

typedef struct {
    s16 w;
    s16 h;
    s32 buffer;
    s32 unk08;
    s32 flags;
} Label;

typedef struct {
    u8 pad00[4];
    s32 buffer;
} NodeData;

typedef struct {
    u8 pad00[8];
    NodeData *data;
} Node;

typedef struct {
    u8 pad00[8];
    Label *label;
} Object;

extern s32 D_80065450;
extern s32 D_80065454;
extern s8 D_80085027;
extern s32 D_8008931C;

void func_8000D834(s32, Node *);
Node *func_8000D8DC(s32, s32);
u16 func_8001E820(s32, s32, s32, s32);
s32 func_80032E00(s32, s32);
void func_80033308(s32, s32, s32, s32);
void func_80097E9C(Rect *, s32, s32, s32);

void func_8009C44C(Object *obj, s32 text, s32 flags) {
    Label *label = obj->label;
    Rect rect;
    Node *node;
    NodeData *data;
    u32 width;
    u32 aligned;
    s16 w;
    s32 size;
    s32 buffer;

    label->flags |= flags;
    if (label->buffer != 0) {
        node = func_8000D8DC(5, 0);
        data = node->data;
        data->buffer = label->buffer;
        label->buffer = 0;
        func_8000D834(D_8008931C, node);
    }
    if (text != 0) {
        if (!(flags & 2)) {
            width = func_8001E820(text, D_80065450, 0, 9) + 2;
        } else {
            width = func_8001E820(text, D_80065454, 0, 0) + 2;
        }
        if (width >= 0x40) {
            width = 0x40;
        }
        aligned = width;
        width += 0xF;
        width &= ~0xF;
        w = width;
        label->w = w;
        rect.w = w;
        label->h = 7;
        rect.h = 7;
        rect.x = ((width - aligned) >> 1) + 2;
        rect.y = 6;
        size = (rect.w * rect.h) >> 1;
        buffer = func_80032E00(0, size);
        label->buffer = buffer;
        func_80033308(0, buffer, size, 0x11);
        D_80085027 = 0;
        func_80097E9C(&rect, buffer, text, flags);
    }
}
