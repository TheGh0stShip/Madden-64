#include "types.h"

typedef struct InnerD2A00 {
    u8 pad00[0x44];
    void *field44;
} InnerD2A00;

typedef struct ObjectD2A00 {
    u8 pad00[0x24];
    struct {
        u8 pad00[0xC];
        InnerD2A00 *inner;
    } *field24;
    u8 pad28[8];
    s32 field30;
    s32 field34;
    u8 pad38[0x28];
    u32 field60;
    u8 pad64[0x10];
    u8 data74[1];
} ObjectD2A00;

extern s8 D_800E5FB2;
extern s32 D_800E7A58;
extern u8 D_800E5F60;

extern void *func_800DD634(void);
extern u32 func_80030B54(s8 value);
extern void func_800DF6EC(void);
extern s32 func_800D30BC(s32 value);
extern s32 func_800D3030(s32 value);
extern void func_800D2D94(void *data);
extern void func_800D2F90(void *value);
extern void func_800DB478(InnerD2A00 *inner);
extern void func_800DF72C(void);
extern void func_800DE84C(void *data);
extern void func_800DD4B8(void);
extern void func_800D63B4(ObjectD2A00 *object);

void func_800D2A00(ObjectD2A00 *object, s32 unused, s16 mode) {
    ObjectD2A00 *current;
    InnerD2A00 *inner;
    u32 input;
    u8 *data;

    func_800DD634();
    current = object;
    inner = current->field24->inner;
    data = current->data74;
    input = func_80030B54(D_800E5FB2);
    if ((input & 0x200) && (current->field60 >= 2)) {
        func_800DF6EC();
        D_800E7A58 = func_800D30BC(D_800E7A58);
        func_800D2D94(data);
        func_800D2F90(inner->field44);
        func_800DB478(inner);
    }
    if ((input & 0x100) && (current->field60 >= 2)) {
        func_800DF6EC();
        D_800E7A58 = func_800D3030(D_800E7A58);
        func_800D2D94(data);
        func_800D2F90(inner->field44);
        func_800DB478(inner);
    }
    switch (mode) {
    case 8:
    case 0x1C:
        func_800DF72C();
        func_800DE84C(&D_800E5F60);
        func_800DD4B8();
        break;
    case 0xC:
        func_800D63B4(current);
        break;
    case 0xD:
        return;
    }
}
