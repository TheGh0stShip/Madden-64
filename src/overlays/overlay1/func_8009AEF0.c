#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern void **D_80087958;
extern u16 D_8008AFC4;
extern void *D_8008B06C;

void func_80032F3C(s32, void *);
void func_80033258(void *);
void func_80096964(u16);

void func_8009AEF0(void) {
    u16 i;

    for (i = 0; i < D_8008AFC4; i++) {
        if (D_80087958[i] != NULL) {
            func_80096964(i);
        }
    }
    func_80033258(D_8008B06C);
    func_80032F3C(0, D_80087958);
    D_8008AFC4 = 0;
    D_8008B06C = NULL;
    D_80087958 = NULL;
}
