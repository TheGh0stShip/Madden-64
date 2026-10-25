#include "types.h"

typedef struct RecordNode RecordNode;
typedef void (*RecordCallback)(RecordNode* node);

struct RecordNode {
    u16 counter;
    u8 pad2[2];
    RecordCallback callback;
    u8 pad8[0xC];
    s16 timer;
    u16 initial_counter;
    RecordNode* next;
};

typedef struct RecordContext {
    u8 pad[0x18];
    RecordNode* first;
} RecordContext;

extern RecordContext* D_8008773C;
extern s16 D_80089528;

void func_80030050(void) {
    RecordNode* node = D_8008773C->first;

    while (node != 0) {
        RecordNode* next = node->next;
        s16 remaining;

        D_80089528 = -1;
        remaining = node->timer;
        if (remaining >= 31) {
            remaining = 30;
        }
        if (remaining == 0) {
            goto clear_record;
        }
        node->counter = node->initial_counter;
inner_loop:
        if (D_80089528 != -1) {
            *(volatile s16*)&node->timer = 0;
            goto advance_record;
        }
        node->callback(node);
        remaining--;
        if (remaining != 0) {
            goto inner_loop;
        }
clear_record:
        node->timer = 0;
advance_record:
        node = next;
    }
}
