#include "types.h"

typedef struct {
    s32 unk00[2];
    void *target;
    s32 unk0C[3];
    s32 value;
    s32 unk1C[14];
    s16 kind;
} Query;

#ifndef NULL
#define NULL 0
#endif

s32 func_8002CAD0();                            /* extern */
s32 func_8002CD28();                            /* extern */
s32 func_8002CD44(s32);                     /* extern */
s32 func_8002D14C(s16);                         /* extern */
s32 func_80043F7C(Query *, s32, void *, void *, s32); /* extern */
s32 func_800B9274(s16, void *, s32);        /* extern */
s16 func_800C157C(void *);                          /* extern */

void func_800A6FC0(void *arg0, void *arg1, void *arg2) {
    Query query;

    func_8002CAD0();
    func_8002CD44(0x400);
    func_8002D14C((*(s16 *)((u8 *)((*(void **)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 8))) + 0x12)));
    query.target = (*(void **)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 8));
    query.kind = 7;
    query.value = (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x18));
    if (func_80043F7C(&query, 0xE, arg1, arg2, 0) & 0xFF) {
        (*(s32 *)((u8 *)(arg1) + 0)) = (s32) ((*(s32 *)((u8 *)(arg1) + 0)) + (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x1C)));
        (*(s32 *)((u8 *)(arg1) + 4)) = (s32) ((*(s32 *)((u8 *)(arg1) + 4)) + (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x20)));
    } else {
        func_800B9274(func_800C157C(arg0), arg1, 0xA0000);
        (*(s32 *)((u8 *)(arg1) + 0)) = (s32) ((*(s32 *)((u8 *)(arg1) + 0)) + (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x1C)));
        (*(s32 *)((u8 *)(arg1) + 4)) = (s32) ((*(s32 *)((u8 *)(arg1) + 4)) + (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0x20)));
        (*(s16 *)((u8 *)(arg2) + 4)) = 0;
        (*(s16 *)((u8 *)(arg2) + 2)) = 0;
        (*(s16 *)((u8 *)(arg2) + 0)) = 0;
    }
    func_8002CD28();
}
