#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad0[0x14];
    s32 flags;
} Button;

typedef struct {
    s16 count;
} IdListHead;

typedef struct {
    u8 active;
    u8 pad1[3];
    u8 kind;
    u8 pad5;
    u16 count;
    u8 pad8[4];
    u8 *list;
    u8 pad10[4];
    void *unk14;
    u8 pad18[4];
    Button *unk1C;
    Button *unk20;
    void *unk24;
    void *unk28;
    char title[1];
} DepthPicker;

extern char *D_800E6B78[];

void func_80032F3C(s32, void *);
u8 *func_800D3FF4(s32, s32, s32, s32, s32);
void func_800B1BD0(DepthPicker *, u8);
void func_8002E65C(char *, char *);
void func_8002E688(char *, char *);
void func_8001EC20(void *, s32);
void func_800E08A4(void *);

void func_800B186C(DepthPicker *picker, u8 kind) {
    char suffix[14] = " DEPTH CHART:";

    picker->kind = kind;
    if (picker->list != NULL) {
        func_80032F3C(0, picker->list);
    }
    picker->list = func_800D3FF4(0x40002, 0x37, 0, 0, kind | 0x40000);
    func_800B1BD0(picker, 1);
    picker->count = *(u16 *)(picker->list + 0x320);
    func_8002E65C(picker->title, D_800E6B78[kind]);
    func_8002E688(picker->title, suffix);
    if (picker->unk14 != NULL) {
        func_8001EC20(picker->unk14, 1);
    }
    if (picker->unk1C != NULL && picker->unk20 != NULL && picker->unk24 != NULL && picker->unk28 != NULL) {
        picker->unk20->flags &= ~1;
        picker->unk1C->flags |= 1;
        func_800E08A4(picker->unk24);
    }
    picker->active = 0;
}
