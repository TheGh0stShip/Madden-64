#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    s32 ids[200];
    s16 count;
} IdList;

typedef struct {
    u8 pad0[4];
    u8 kind;
    u8 pad5[3];
    u16 count;
    u8 padA[2];
    s32 *items;
    IdList *list;
} Picker;

void func_80032F3C(s32, void *);
IdList *func_800D3FF4(s32, s32, s32, s32, s32);
s32 func_800B19E4(Picker *, s32);

void func_800B1BD0(Picker *picker, u8 keep) {
    s32 i = 0;
    u32 j;
    s32 target;

    if (picker->list != NULL) {
        func_80032F3C(0, picker->list);
    }
    picker->list = func_800D3FF4(0x440002, 0x37, 0, 0, picker->kind);
    if (keep == 0) {
        target = picker->items[func_800B19E4(picker, 0)];
        for (; i < picker->list->count; i++) {
            if (picker->list->ids[i] == target) {
                for (j = i; j < picker->list->count; j++) {
                    picker->list->ids[j] = picker->list->ids[j + 1];
                }
                picker->list->count--;
                break;
            }
        }
    }
    picker->count = picker->list->count;
}
