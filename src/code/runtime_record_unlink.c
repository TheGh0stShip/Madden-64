#include "types.h"

typedef struct RecordNode {
    u8 pad[0x18];
    struct RecordNode* next;
} RecordNode;

typedef struct RecordContext {
    u8 pad[0x18];
    RecordNode* first;
} RecordContext;

extern RecordContext* D_8008773C;
extern void* D_8008AFBC;
extern s16 D_80089528;
extern void func_800332C8(void* allocation);

void func_8002FF70(RecordNode* node) {
    RecordNode* current = D_8008773C->first;
    RecordNode* target = node;

    if (((u32)current ^ (u32)target) == 0) {
        D_8008773C->first = node->next;
        func_800332C8(D_8008AFBC);
    } else {
        while ((current->next != target) && (current->next != 0)) {
            current = current->next;
        }
        current->next = target->next;
        func_800332C8(D_8008AFBC);
    }
    D_80089528 = 0;
}
