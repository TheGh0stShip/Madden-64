#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct Node Node;
struct Node {
    u8 pad00[4];
    Node *unk04;
    u8 pad08[4];
    Node *unk0C;
    void (*unk0C_fn)(Node *);
    s32 unk14;
    u8 pad18[0x11];
    u8 unk29;
};

typedef struct {
    Node *unk00;
    u8 pad04[0xC];
    Node *unk10;
} Item;

extern s16 D_800C5C36;

void func_800D5E0C();
void func_800D5DA0(Item *);
void func_800DF72C(void);
void func_8003A600(s32, s32);

void func_800A8694(Item *item, s32 unused, s16 event) {
    Node *n;
    Node *m;
    Node *child;
    void (*callback)(Node *);

    switch (event) {
        case 13:
            n = item->unk00->unk0C;
            func_800D5E0C(n, n->unk0C->unk0C, n->unk29, item->unk10);
            item->unk10->unk14 |= 1;
            break;
        case 12:
            func_800D5DA0(item);
            break;
        case 28:
            func_800DF72C();
            n = item->unk00->unk0C;
            child = n->unk0C;
            m = n->unk04;
            do {
                m->unk14 = (s32)child->unk0C;
                callback = (void (*)(Node *))child->unk0C->unk0C;
                if (callback != NULL) {
                    callback(child);
                }
            } while (0);
            break;
        case 17:
            if (D_800C5C36 == 1) {
                func_8003A600(0, 0);
            }
            break;
    }
}
