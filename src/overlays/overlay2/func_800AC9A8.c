#include "types.h"

typedef struct {
    s32 unk00;
    s32 pos;
    s32 unk08[2];
} Cursor;

void func_8001F070(void *, s32, Cursor *);

void func_800AC9A8(void *arg0, u8 arg1, void *arg2) {
    void *target;
    Cursor cursor;

    target = *(void **)((u8 *)arg2 + 0x28);
    if (*(s32 *)((u8 *)target + 0x20) == 0) {
        cursor.pos = *(s32 *)((u8 *)arg0 + 0x20) + 0x10;
        func_8001F070(target, arg1 + 0x4, &cursor);
        *(s32 *)((u8 *)arg0 + 0x20) = cursor.pos - 0x10;
    }
}
