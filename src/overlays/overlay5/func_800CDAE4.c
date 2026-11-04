#include "types.h"

typedef struct PairCDAE4 {
    s16 first;
    s16 second;
} PairCDAE4;

typedef struct ObjectCDAE4 {
    u8 pad00[0x1C];
    s32 field1C;
    s32 field20;
} ObjectCDAE4;

extern s16 D_8007A30C;
extern s8 D_8008B358;
extern void *D_800E6B78[];
extern void *D_80087810;
extern ObjectCDAE4 *D_8007A2D8;
extern s8 D_8007A384;
extern u8 D_800E7508;
extern u8 D_800E74AC;

extern u16 func_80022234(u16 player, u16 index);
extern void func_800221E8(u16 player, u16 index, PairCDAE4 *pair);
extern void func_8001B314(ObjectCDAE4 *object);
extern void func_8001ECAC(ObjectCDAE4 *object, s32, s32);
extern void func_800DB478(void *object);
extern void func_800CDC4C(void);

void func_800CDAE4(s16 direction) {
    PairCDAE4 pair;
    s32 base;
    u16 value;
    ObjectCDAE4 *object;

    if (direction == 2) {
        if (D_8007A30C == 0) {
            D_8007A30C = 10;
        } else {
            D_8007A30C--;
        }
    }
    if (direction == 3) {
        if (D_8007A30C == 10) {
            D_8007A30C = 0;
        } else {
            D_8007A30C++;
        }
    }
    value = func_80022234((u16)D_8008B358, (u16)D_8007A30C);
    D_80087810 = D_800E6B78[value];
    func_800221E8((u16)D_8008B358, (u16)D_8007A30C, &pair);
    object = D_8007A2D8;
    base = D_8007A384 + 0x14;
    object->field1C = (pair.first * 2) - 3;
    object->field20 = (pair.second * 3) + base;
    func_8001B314(object);
    func_8001ECAC(D_8007A2D8, 0x24, 6);
    func_800DB478(&D_800E7508);
    func_800CDC4C();
    func_800DB478(&D_800E74AC);
}
