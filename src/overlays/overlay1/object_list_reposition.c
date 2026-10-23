#include "types.h"

typedef struct ObjectNode ObjectNode;

struct ObjectNode {
    u8 pad00[0x20];
    s32 key;
    u8 pad24[0x28];
    ObjectNode* previous;
    ObjectNode* next;
};

extern ObjectNode* D_80087940;

void func_800BDF44(ObjectNode* node) {
    register ObjectNode* adjacent asm("$4");
    register ObjectNode* current asm("$5") = node;
    __asm__ volatile("" : "=r"(node) : "0"(node));
    adjacent = node->previous;
    if (adjacent == 0) {
        goto forward;
    }
backward_loop:
    if (adjacent->key <= current->key) {
        goto forward;
    }
    if (adjacent->previous == 0) {
        D_80087940 = current;
    } else {
        adjacent->previous->next = current;
    }
    if (current->next == 0) {
        __asm__ volatile("");
    } else {
        current->next->previous = adjacent;
    }
    current->previous = adjacent->previous;
    adjacent->next = current->next;
    adjacent->previous = current;
    current->next = adjacent;
    adjacent = current->previous;
    __asm__ volatile("" ::: "memory");
    if (adjacent != 0) {
        goto backward_loop;
    }

forward:
    __asm__ volatile("" ::: "memory");
    adjacent = current->next;
    if (adjacent == 0) {
        return;
    }
forward_loop:
    if (adjacent->key >= current->key) {
        return;
    }
    if (current->previous == 0) {
        D_80087940 = adjacent;
    } else {
        current->previous->next = adjacent;
    }
    if (adjacent->next == 0) {
        __asm__ volatile("");
    } else {
        adjacent->next->previous = current;
    }
    adjacent->previous = current->previous;
    current->next = adjacent->next;
    current->previous = adjacent;
    adjacent->next = current;
    adjacent = current->next;
    __asm__ volatile("" ::: "memory");
    if (adjacent != 0) {
        goto forward_loop;
    }
}
