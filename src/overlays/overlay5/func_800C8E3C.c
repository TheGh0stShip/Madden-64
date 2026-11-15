#include "types.h"

typedef struct ResourceRequestC8E3C {
    s32 kind;
    s16 field4;
    s16 field6;
    s16 field8;
    s16 padA;
    s32 fieldC;
    s32 field10;
    s32 reserved[4];
} ResourceRequestC8E3C;

extern s32 func_8000D8DC(s32, ResourceRequestC8E3C *);
extern void func_80016FE4(s32);
extern void func_80016FF4(s32);
extern void func_800D6060(s32, void *, void *, void *);
extern void *func_800DD634(void);
extern s32 D_800720B0;
extern s32 D_80082DD0;
extern s32 D_80084F1C;
extern volatile s32 D_800892D8;
extern volatile s32 D_800892DC;

#define FIELD(ptr, type, offset) (*(type *)((s8 *)(ptr) + (offset)))

void func_800C8E3C(void *arg0) {
    ResourceRequestC8E3C request;
    s32 handle;
    s32 temp_a3;
    s32 temp_a2;
    s8 i;
    void *state;
    volatile s32 *resource;

    state = func_800DD634();
    FIELD(state, s32, 0x48) = D_80082DD0;
    FIELD(state, s32, 0x4C) = D_80084F1C;
    request.field4 = 0;
    request.field6 = 0;
    request.field8 = 0;
    request.field10 = 0;
    request.fieldC = 0;
    request.kind = 0x82;
    handle = func_8000D8DC(0, &request);
    func_80016FE4(handle);
    resource = &D_800892D8;
    FIELD(state, s32, 0x44) = handle;
    FIELD(state, s32, 0x14) = *resource;
    FIELD(state, s32, 0x18) = D_800892DC;
    func_80016FF4(*resource);
    func_80016FF4(D_800892DC);
    temp_a2 = (s32)arg0;
    temp_a3 = temp_a2 + 0x74;
    i = 1;
    do {
        *(s32 *)((((s32)i << 24) >> 22) + temp_a3) = 0;
        i++;
    } while (i < 0x19);
    *(s32 *)temp_a3 = 0x19;
    FIELD((void *)temp_a2, s32, 0x34) = 0x298;
    FIELD((void *)temp_a2, s32, 0x2C) = 0;
    FIELD((void *)temp_a2, s32, 0x30) = 0xFA;
    func_800D6060(0x418, &D_800720B0, (void *)temp_a2, (void *)temp_a3);
}
