#include "types.h"

extern void* D_80084F28;
extern s32 func_8000299C(void);
extern void* func_8002E628(void* key, void* callback);
extern u8* func_80037174(void* entries, void* key);

void* func_80037108(void* key) {
    register void** root __asm__("$17");
    register void* saved_key __asm__("$16");
    u8* entry;

    root = &D_80084F28;
    saved_key = key;
    if (*root == 0) {
        return 0;
    }
    if (func_8002E628(saved_key, func_8000299C) == 0) {
        return 0;
    }
    entry = func_80037174(*root, saved_key);
    if (entry == 0) {
        return 0;
    }
    return entry + 0xC;
}
