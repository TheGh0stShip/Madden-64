#include "types.h"

typedef struct {
    s32 count;
    s32 items[0xB5];
} List;

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FF4(s32);                         /* extern */
s32 func_80024694();                            /* extern */
s32 func_800AF0DC(void *, u16, s32);        /* extern */
s32 func_800B06F4(void *);                      /* extern */
s32 func_800D6060(s32, s32 *, void *);  /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD694(s32, s32, s32, void *); /* extern */
extern s32 D_800892D8;
extern s32 D_800892DC;
extern s32 D_800892E0;
extern s32 D_800892E4;
extern s32 D_800BF968;

void func_800B0470(void *arg0) {
    List *list;
    u16 i;
    u16 *temp_s0;
    void *temp_a3;
    void *temp_v0;

    temp_a3 = func_800DD634();
    list = (List *)((u8 *)arg0 + 0x74);
    list->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list->items[i] = 0;
    }
    list->items[i] = 0;
    (*(s32 *)((u8 *)(arg0) + 0x30)) = 0x140;
    (*(s32 *)((u8 *)(arg0) + 0x2C)) = 0;
    (*(s32 *)((u8 *)(arg0) + 0x34)) = 0x370;
    (*(s32 *)((u8 *)(temp_a3) + 0x14)) = (s32) D_800892D8;
    (*(s32 *)((u8 *)(temp_a3) + 0x18)) = (s32) D_800892DC;
    (*(s32 *)((u8 *)(temp_a3) + 0x1C)) = (s32) D_800892E0;
    (*(s32 *)((u8 *)(temp_a3) + 0x20)) = (s32) D_800892E4;
    func_800DD694(0x48, 0x12, 8, temp_a3);
    func_80024694();
    func_800B06F4(arg0);
    func_800D6060(0x368, &D_800BF968, arg0);
    temp_s0 = (*(u16 **)((u8 *)(arg0) + 0x60));
    func_800AF0DC(arg0, *temp_s0, 0xB);
    if (*temp_s0 == 0) {
        temp_v0 = (*(void **)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0xC));
        (*(s16 *)((u8 *)(temp_v0) + 0x18)) = 1;
        (*(u8 *)((u8 *)(temp_v0) + 0x1E)) = (u8) (*(u8 *)((u8 *)(temp_v0) + 0x1C));
        func_80016FF4(D_800892E4);
    }
}
