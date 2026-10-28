#include "types.h"

typedef struct {
    u8 pad00[8];
    s32 child;
    u8 pad0C[8];
    s32 flags;
    u8 pad18[0x24];
    u16 id;
} Object;

extern s32 D_80084F80;
extern Object *D_80085D48[];
extern s32 D_800869C8;
extern s32 D_8008775C;
extern s32 D_80087A64;
extern s16 D_80087AC2;
extern u16 D_800886FC;
extern Object *D_8008B36C;

Object *func_8000D740(s32, s32, s32);
s32 func_80035EF0(u16, s32);
void func_80098070(s32, s32);
void func_800980FC(Object *, s32);
void func_80098164(Object *, Object *);

void func_800C3768(void) {
    u16 i;
    s32 palette;
    Object *head;

    D_80084F80 = func_80035EF0(D_800886FC, 0x31);
    palette = func_80035EF0(D_800886FC, 0x32);
    D_800869C8 = func_80035EF0(D_800886FC, 0x35);
    D_8008B36C = func_8000D740(D_80087A64, 3, 0);
    D_8008775C = D_8008B36C->child;
    func_80098070(D_80084F80, palette);
    head = func_8000D740(D_8008775C, 5, 0);
    func_800980FC(head, D_800869C8);
    D_80085D48[0] = head;
    head->id = 0xFFFF;
    head->flags &= ~1;
    i = 1;
    do {
        D_80085D48[i] = func_8000D740(D_8008775C, 5, 0);
        func_80098164(head, D_80085D48[i]);
        D_80085D48[i]->flags &= ~1;
        D_80085D48[i]->id = 0xFFFF;
        i++;
    } while (i < 14);
    D_80087AC2 = 0;
}
