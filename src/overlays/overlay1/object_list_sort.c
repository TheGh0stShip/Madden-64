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

void func_800BDEB8(void) {
    register s32 one asm("$7") = 1;
    register ObjectNode* next asm("$4");
    register ObjectNode* current asm("$5");
    register s32 swapped asm("$6");

    do {
        swapped = 0;
        next = D_80087940;
        current = next;
        next = next->next;
        while (next != 0) {
            if (current->key > next->key) {
                if (current->previous == 0) {
                    D_80087940 = next;
                } else {
                    current->previous->next = next;
                }
                if (next->next == 0) {
                    __asm__ volatile("");
                } else {
                    next->next->previous = current;
                }
                next->previous = current->previous;
                current->next = next->next;
                current->previous = next;
                next->next = current;
                swapped = 1;
                current = next;
            } else {
                current = next;
            }
            next = next->next;
        }
    } while (swapped == one);
}
