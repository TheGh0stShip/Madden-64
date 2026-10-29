#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FF4(void *);                      /* extern */
extern void *D_80071964;
extern void *D_80071970;

void func_80094114(void) {
    (*(s32 *)((u8 *)(D_80071964) + 0x14)) = (s32) ((*(s32 *)((u8 *)(D_80071964) + 0x14)) & ~1);
    func_80016FF4(D_80071964);
    func_80016FF4(D_80071970);
}
