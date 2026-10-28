#include "types.h"

void func_800D63B4(void *object);
void func_800DF72C(void);
void func_800DD4B8(void);

void overlay5_resource_state_dispatch(void *object, s32 unused, s16 state) {
    switch (state) {
        case 12:
            func_800D63B4(object);
            break;

        case 8:
        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
    }
}
