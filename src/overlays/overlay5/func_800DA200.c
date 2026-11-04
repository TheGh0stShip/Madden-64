#include "types.h"

typedef struct RequestDA200 {
    s16 count;
    u8 pad02[2];
    void *items;
    s32 field08;
    u8 pad0C[4];
    s16 field10;
} RequestDA200;

typedef struct StateDA200 {
    u8 pad00[0x14];
    s32 field14;
    s32 field18;
    u8 pad1C[0x2C];
    s32 field48;
} StateDA200;

typedef struct ObjectDA200 {
    u8 pad00[0x24];
    s32 field24;
    u8 pad28[4];
    s32 field2C;
    s32 field30;
    s32 field34;
    u8 pad38[4];
    void *field3C;
    u8 pad40[8];
    s32 field48;
    u8 pad4C[0xC];
    s32 field58;
    u8 pad5C[0x10];
    void *field6C;
    void *field70;
    u32 itemCount;
    void *items[0xB5];
} ObjectDA200;

extern void *D_80087AA8;
extern s32 D_800892D8;
extern s32 D_800892DC;
extern s32 D_800E6C34;
extern u16 D_800BDF0C;
extern u16 D_8006B9E4[];
extern s8 D_80084FA8;
extern u8 D_800722D4;
extern u8 D_800722D5;

extern StateDA200 *func_800DD634(void);
extern void *func_8000D740(void *owner, s32 count, RequestDA200 *request);
extern void func_800D54E4(s32 value);
extern void func_800DD694(s32, s32, s32);
extern void *func_80032E00(s32, s32);
extern s32 func_800DA848(ObjectDA200 *object);
extern void func_800D6060(s32, void *data, ObjectDA200 *object);
extern void func_800D6424(void *resource, s32, s32, s32);
extern void func_800DA6B4(s32, ObjectDA200 *object);

void func_800DA200(ObjectDA200 *object) {
    StateDA200 *state;
    RequestDA200 request;
    void *resource;
    void **items;
    u8 *end;
    s32 mode;
    u16 i;

    state = func_800DD634();
    items = (void **)&object->itemCount;
    object->itemCount = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        items[i + 1] = 0;
    }
    items[i + 1] = 0;
    object->field24 = 0;
    request.items = &object->itemCount;
    request.field08 = 0;
    request.field10 = 7;
    request.count = 0x170;
    resource = func_8000D740(D_80087AA8, 1, &request);
    object->field3C = resource;
    func_800D54E4(1);
    func_800DD694(0x48, 0x12, 8);
    do {
        state->field48 = 0;
        do {
            state->field14 = D_800892D8;
            mode = D_800E6C34;
        } while (0);
        state->field18 = D_800892DC;
    } while (0);
    if (mode == 1) {
        object->field58 = D_8006B9E4[D_800BDF0C];
    } else {
        object->field58 = D_80084FA8;
    }
    object->field6C = func_80032E00(0, 0x28);
    object->field70 = func_80032E00(0, 0x50);
    end = &D_800722D5;
    *end = func_800DA848(object);
    object->field2C = 0;
    object->field30 = 0x14A;
    object->field34 = 0x180;
    func_800D6060(0x178, end - 1, object);
    *(s32 *)((u8 *)resource + 0x1C) = 0x14A;
    *(s32 *)((u8 *)resource + 0x20) = 0;
    func_800D6424(resource, 0, 1, 0xA);
    func_800DA6B4(0, object);
}
