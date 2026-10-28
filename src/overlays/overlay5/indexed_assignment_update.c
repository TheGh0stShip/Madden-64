#include "types.h"

extern u16 COUNT;
extern void *POINTERS[];
extern s16 VALUES[];
extern s16 ASSIGNED[];
extern s16 PENDING[];
void func_800363F4(u16 count, s32 mode, void *pointer);

void overlay5_indexed_assignment_update(s16 value, u16 index) {
    if (value != VALUES[index]) {
        if (PENDING[index] != -1) {
            VALUES[index] = value;
            ASSIGNED[index] = value;
            func_800363F4(COUNT, 0, POINTERS[index]);
            PENDING[index] = -1;
        } else {
            ASSIGNED[index] = value;
        }
    }
}
