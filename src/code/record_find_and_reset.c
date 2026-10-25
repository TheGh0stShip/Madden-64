#include "types.h"

typedef struct RecordNode {
    u8 pad0[4];
    s32 value;
    u8 pad8[0x10];
    struct RecordNode* next;
} RecordNode;

typedef struct RecordContext {
    u8 pad[0x18];
    RecordNode* first;
} RecordContext;

extern RecordContext* D_8008773C;
extern s16 D_80089528;
extern void func_8002FF70(RecordNode* node);

void func_8002FFEC(s32 value) {
    RecordNode* node = D_8008773C->first;

    while (node != 0) {
        if (node->value == value) {
            break;
        }
        node = node->next;
    }
    if (node->value == value) {
        func_8002FF70(node);
    }
    D_80089528 = 0;
}
