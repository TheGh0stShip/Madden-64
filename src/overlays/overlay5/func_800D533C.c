#include "types.h"

typedef struct {
    s32 kind;
    s16 a;
    s16 b;
    s16 c;
    s32 flags;
    u8 pad10[0x14];
    s32 unk24;
} Spec;

typedef s32 Obj;

extern u8 D_800908B8[];
extern u8 D_8008CA8C[];
extern u8 *D_80086DD8;
extern Obj D_80086E30;
extern s8 D_80087AF2;
extern s32 D_8008931C;
extern s32 D_80089344;
extern s32 D_800E7A78[];
extern s16 D_800E7A94[];
extern s16 D_800E7A98[];
extern s16 D_800E7B88[];

s32 func_800301E0(void *task, s32 arg1);
Obj *func_800DD634(void);
s32 func_80036540(s32);
void func_8000D834(s32, s32);
s32 func_8000D8DC(s32, Spec *);
void func_80016FE4(s32);
void overlay5_indexed_assignment_update(s16, s32);

void func_800D533C(void *task) {
    Spec spec;
    s32 id;
    s32 index;
    Obj *obj;
    s32 handle;

    id = func_800301E0(task, 0);
    if (D_80086DD8 == D_800908B8 || D_80087AF2 == 1) {
        obj = func_800DD634();
    } else {
        obj = &D_80086E30;
    }
    index = (u16)id;
    if (D_800E7B88[index] == -1 && func_80036540(1) == 0) {
        D_800E7B88[index] = 1;
        if (D_800E7A98[index] == D_800E7A94[index]) {
            if (obj[index * 2 + 17] != 0) {
                func_8000D834(D_8008931C, obj[index * 2 + 17]);
            }
            spec.a = 4;
            spec.b = 0;
            spec.c = 0;
            if (D_80086DD8 == D_8008CA8C) {
                spec.unk24 = D_80089344;
                spec.flags = 0x2080;
                spec.kind = D_800E7A78[index];
            } else {
                spec.flags = 0x2000;
                spec.kind = D_800E7A78[index];
            }
            handle = func_8000D8DC(0, &spec);
            func_80016FE4(handle);
            obj[(u16)id * 2 + 17] = handle;
            D_800E7B88[(u16)id] = 2;
        } else {
            overlay5_indexed_assignment_update(D_800E7A94[index], index);
        }
    }
}
