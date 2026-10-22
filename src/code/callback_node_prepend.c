#include "types.h"

typedef struct CallbackNode {
    void* callback;
    void* argument;
    struct CallbackNode* next;
} CallbackNode;

extern s32 D_800782E0;
extern CallbackNode D_800776E0[];

void func_80008F30(u32* lists, void* callback, void* argument, s32 index) {
    s32 count = D_800782E0;
    CallbackNode* node = &D_800776E0[count];

    node->callback = callback;
    node->argument = argument;
    node->next = (CallbackNode*)lists[index + 1];
    D_800782E0 = count + 1;
    lists[index + 1] = (u32)node;
}
