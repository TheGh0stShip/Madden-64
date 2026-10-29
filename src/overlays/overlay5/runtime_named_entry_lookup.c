#include "types.h"

extern void* D_80084F28[];
extern char D_80002EE0[];
extern s32 func_8002E628(void* value, const char* name);
extern s32 func_800E24EC(void* table, void* value);

s32 func_800E2124(void* value) {
    s32 result;

    if (D_80084F28[0] != 0) {
        if (func_8002E628(value, D_80002EE0) != 0) {
            result = func_800E24EC(D_80084F28[0], value);
            if (result != 0) {
                return result + 12;
            }
        }
    }
    return 0;
}
