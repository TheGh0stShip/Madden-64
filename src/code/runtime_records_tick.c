#include "types.h"

typedef struct RecordNode {
    u16 counter;
    u8 pad2[0x12];
    u16 timer;
    u8 pad16[2];
    struct RecordNode* next;
} RecordNode;

typedef struct RecordContext {
    u8 pad[0x18];
    RecordNode* first;
} RecordContext;

extern RecordContext* D_8008773C;
extern volatile u16 D_8008A5B4;

void func_80030110(void) {
    RecordNode* node = D_8008773C->first;
    u32 outer_index;

    if (node != 0) {
        u16 index;

        outer_index = 0;
        do {
            index = 0;
            if (outer_index < D_8008A5B4) {
                do {
                    if (node->counter != 0) {
                        node->counter--;
                    } else {
                        node->timer++;
                    }
                    index++;
                } while (index < D_8008A5B4);
            }
            node = node->next;
        } while (node != 0);
    }
}
