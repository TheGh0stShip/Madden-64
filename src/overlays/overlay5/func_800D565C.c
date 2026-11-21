#include "types.h"

typedef struct {
    u8 unk_00[0x44];
    void *unk_44;
    u8 unk_48[4];
    void *unk_4C;
} Unk80086E30;

typedef struct {
    void *unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    s32 unk_0C;
    u8 unk_10[0x18];
} UnkDesc;

extern u8 D_800908B8[];
extern s8 D_80087AF2;
extern Unk80086E30 D_80086E30;
extern void *D_8008931C;
extern void *D_800E7A78[2];
extern u16 D_800E7A90[2];

Unk80086E30 *func_800DD634(void);
void *func_80032E00(s32, s32);
void func_8002E17C(void *, void *, s32);
void func_80032F3C(s32, void *);
void func_8000D834(void *, void *);
void *func_8000D8DC(s32, UnkDesc *);
void func_80016FE4(void *);

void func_800D565C(void) {
    UnkDesc desc;
    Unk80086E30 *obj;
    u8 *cur;
    void *buf;
    void *tmp;
    u16 t;

    if (cur == D_800908B8 || D_80087AF2 == 1) {
        obj = func_800DD634();
    } else {
        obj = &D_80086E30;
    }
    buf = func_80032E00(0, 0x2000);
    func_8002E17C(buf, D_800E7A78[0], 0x2000);
    func_8002E17C(D_800E7A78[0], D_800E7A78[1], 0x2000);
    func_8002E17C(D_800E7A78[1], buf, 0x2000);
    func_80032F3C(0, buf);
    func_8000D834(D_8008931C, obj->unk_44);
    func_8000D834(D_8008931C, obj->unk_4C);
    desc.unk_00 = D_800E7A78[0];
    desc.unk_04 = 4;
    desc.unk_06 = 0;
    desc.unk_08 = 0;
    desc.unk_0C = 0x2000;
    tmp = func_8000D8DC(0, &desc);
    func_80016FE4(tmp);
    obj->unk_44 = tmp;
    desc.unk_00 = D_800E7A78[1];
    tmp = func_8000D8DC(0, &desc);
    func_80016FE4(tmp);
    obj->unk_4C = tmp;
    t = D_800E7A90[0];
    D_800E7A90[0] = D_800E7A90[1];
    D_800E7A90[1] = t;
}
