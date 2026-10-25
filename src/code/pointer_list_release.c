#include "types.h"

typedef struct PointerList {
    s32 count;
    void* entries[1];
} PointerList;

extern void func_80032F3C(s32 pool, void* allocation);

void func_8003E23C(PointerList* list) {
    s16 index;

    for (index = 0; index < list->count; index++) {
        if (list->entries[index] != 0) {
            func_80032F3C(0, list->entries[index]);
            list->entries[index] = 0;
        }
    }
}
