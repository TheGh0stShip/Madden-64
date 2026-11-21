#include "types.h"

typedef struct {
    s32 count;
    s32 items[0x51];
    void *unk_148;
    u8 pad14C[4];
    void *unk_150;
    u8 pad154[8];
    void *unk_15C;
    u8 pad160[4];
    void *unk_164;
} Overlay2ListAB414;

typedef struct {
    u8 pad00[0x2C];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[0x28];
    s32 unk_60;
    s32 unk_64;
    s32 unk_68;
    u8 pad6C[8];
    Overlay2ListAB414 list;
} Overlay2ObjectAB414;

typedef struct {
    u8 pad00[0x14];
    s32 field14;
    s32 field18;
    s32 field1C;
    s32 field20;
    u8 pad24[0x20];
    s32 field44;
} Overlay2RuntimeAB414;

typedef struct {
    u8 unk_00;
    s8 unk_01;
} Overlay2ByteAB414;

extern s32 D_800892D8[4];
extern u16 D_80084F40;
extern u16 D_800C3A1C;
extern s16 D_800BDF0C;
extern s16 D_800C5016;
extern u8 D_800C2330[];
extern u8 D_800C5C39;
extern Overlay2ByteAB414 D_800BF60C;
extern u8 D_800C509E[];
extern s32 D_800C48B8[];

Overlay2RuntimeAB414 *func_800DD634(void);
void func_80016FE4(s32 value);
u16 func_80016FD4(void);
void func_80016FC4(u16 value);
void func_8008DA98(void);
s32 func_80032E00(s32 arena, s32 size);
void func_800AB088(Overlay2ObjectAB414 *object, s16 team, s32 arg2);
void func_800D6060(s32 arg0, Overlay2ByteAB414 *arg1, Overlay2ObjectAB414 *object);
void func_80017B80(s32 value);

void func_800AB414(Overlay2ObjectAB414 *arg0) {
    Overlay2RuntimeAB414 *runtime;
    Overlay2ObjectAB414 *object;
    Overlay2ListAB414 *list;
    s32 i;

    runtime = func_800DD634();
    runtime->field14 = D_800892D8[0];
    runtime->field18 = D_800892D8[1];
    runtime->field1C = D_800892D8[2];
    runtime->field20 = D_800892D8[3];
    func_80016FE4(runtime->field1C);
    object = arg0;
    func_80016FE4(runtime->field20);
    list = &object->list;
    D_800C3A1C = func_80016FD4();
    func_80016FC4(D_80084F40);
    for (i = 1; i < 90; i++) {
        list->items[i - 1] = 0;
    }
    func_8008DA98();
    list->unk_148 = D_800C2330;
    list->unk_150 = D_800C2330;
    list->unk_15C = D_800C2330;
    list->unk_164 = D_800C2330;
    D_800C5016 = D_800BDF0C;
    *(s32 *)list = 90;
    object->unk_60 = func_80032E00(0, 15);
    object->unk_64 = func_80032E00(0, 15);
    object->unk_68 = func_80032E00(0, 15);
    func_800AB088(object, D_800C5016, 0);
    D_800BF60C.unk_01 = D_800C5C39;
    if (D_800BF60C.unk_01 < 8) {
        D_800BF60C.unk_01 = 8;
    }
    object->unk_34 = 0x298;
    object->unk_2C = 0;
    object->unk_30 = 0xFA;
    func_800D6060(0x2C0, &D_800BF60C, object);
    runtime->field44 = D_800C48B8[D_800C509E[D_800C5016]];
    func_80017B80(runtime->field44);
    func_80016FE4(runtime->field44);
}
