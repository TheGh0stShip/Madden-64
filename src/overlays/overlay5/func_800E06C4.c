#include "types.h"

typedef struct NodeE06C4 {
    struct NodeE06C4* previous;
    struct NodeE06C4* next;
    u8 type;
    u8 field9;
    u8 padA[6];
    s32 field10;
} NodeE06C4;

typedef void (*InitE06C4)(NodeE06C4* node, void* argument);

typedef struct EntryE06C4 {
    InitE06C4 initialize;
    u8 pad4[0xC];
} EntryE06C4;

typedef struct StateE06C4 {
    EntryE06C4* entries;
    u8 pad4[4];
    NodeE06C4* head;
} StateE06C4;

extern StateE06C4* D_80072460;
extern NodeE06C4* func_80032E00(s32 zero, s32 size);

NodeE06C4* func_800E06C4(u8 type, void* argument) {
    StateE06C4* state;
    NodeE06C4* node;
    NodeE06C4* current;

    node = func_80032E00(0, 0x14);
    state = D_80072460;
    current = state->head;
    if (current != 0) {
        while (current->next != 0) {
            current = current->next;
        }
        node->previous = current;
        node->next = 0;
        current->next = node;
    } else {
        state->head = node;
        node->next = 0;
        node->previous = 0;
    }
    node->type = type;
    node->field9 = 0;
    node->field10 = 0;
    D_80072460->entries[type].initialize(node, argument);
    return node;
}
