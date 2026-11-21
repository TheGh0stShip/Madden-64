#include "types.h"

typedef struct EntryDF19C {
    u8 pad0[0x10];
} EntryDF19C;

typedef struct SubDF19C {
    void *p0;
    u8 pad4[4];
    s16 field24;
    s16 field26;
    u8 field28;
    u8 pad29[3];
} SubDF19C;

typedef struct ResDF19C {
    u8 pad0[8];
    s32 *p8;
} ResDF19C;

typedef struct InfoDF19C {
    u16 flags;
    u8 pad2[2];
    ResDF19C *res;
    u8 b8;
    u8 b9;
    u8 bA;
    u8 bB;
    u8 padC[4];
    EntryDF19C *entries;
    void *value;
} InfoDF19C;

typedef struct BlockDF19C {
    s32 data[0x14];
} BlockDF19C;

typedef struct StateDF19C {
    s32 allocator;
    InfoDF19C *info;
    void *head;
    void *current;
    u8 pad10[4];
    u8 counter14;
    u8 counter15;
    u8 pad16[2];
    s32 field18;
    union {
        BlockDF19C block;
        struct {
            u8 pad1C[8];
            s16 field24;
            s16 field26;
            u8 field28;
            u8 pad29[0xB];
            s16 field34;
            u8 pad36[2];
            u8 field38;
            u8 pad39;
            u8 field3A;
            u8 pad3B[9];
            u8 *field44;
            u8 pad48;
            u8 field49;
            u8 pad4A[0xE];
            s32 field58;
            s32 field5C;
            ResDF19C *field60;
            u8 pad64[4];
            struct StateDF19C *field68;
        } f;
    } u;
    u8 pad6C[4];
    u8 field70;
    u8 field71;
    u8 field72;
} StateDF19C;

typedef struct NodeDF19C {
    u8 pad0[4];
    struct NodeDF19C *next;
    u16 field8;
    u8 padA[2];
    void *value;
} NodeDF19C;

typedef struct ObjectDF19C {
    u8 pad0[0xC];
    StateDF19C *state;
} ObjectDF19C;

extern BlockDF19C D_800723EC;

extern s32 func_80033174(s32 mode, s32 count, s32 element_size);
extern s32 func_800DD634(void);
extern NodeDF19C *func_800DFB98(ObjectDF19C *object, void *value);

void func_800DF19C(ObjectDF19C *object, InfoDF19C *info, u8 next, u8 current, NodeDF19C *list) {
    StateDF19C *state;
    NodeDF19C *node;
    u8 i;
    s32 temp;

    state = object->state;
    state->allocator = func_80033174(0, next, 0x14);
    state->info = info;
    state->head = 0;
    state->current = 0;
    state->field72 = 0;
    state->counter14 = next;
    state->counter15 = current;
    if (list == 0) {
        state->u.block = D_800723EC;
        state->field18 = 0;
        state->u.f.field26 = 0;
    }
    if (info->flags & 2) {
        state->u.f.field34 = 2;
        state->u.f.field38 = 2;
        state->u.f.field3A = 2;
        state->field71 = info->bA;
    }
    state->u.f.field24 = next;
    state->u.f.field28 = info->bB;
    state->field70 = info->b9;
    state->u.f.field44 = &state->field70;
    state->u.f.field5C = func_800DD634();
    temp = *info->res->p8;
    state->u.f.field49 = info->b8;
    state->u.f.field58 = temp;
    state->u.f.field60 = info->res;
    state->u.f.field68 = state;
    if (list != 0) {
        i = 0;
        if (current != 0) {
            do {
                node = func_800DFB98(object, list->value);
                node->field8 = list->field8;
                if (info->value == list->value) {
                    state->current = node;
                }
                list = list->next;
                i++;
            } while (i < current);
        }
    } else {
        i = 0;
        while (i < current) {
            func_800DFB98(object, &info->entries[i]);
            i++;
        }
    }
    if (state->current == 0) {
        state->current = state->head;
    }
}
