#include "types.h"

typedef struct {
    u16 id;
    u16 kind;
    s32 mode;
    s32 primary[3];
    s32 secondary[3];
} SetupBlock;

typedef struct {
    u16 id;
    void *data;
    s32 zero;
    s32 unused;
    u16 kind;
} SetupMessage;

typedef struct {
    u8 pad00[0x10];
    s8 mode;
    u8 pad11[0x63];
    void *owner74;
    u8 pad78[0x24];
    s8 result9C;
} RuntimeState;

extern RuntimeState *D_80072380;
typedef struct {
    s32 value;
    u8 pad04[0xC];
} PlayerSlot;

typedef struct {
    PlayerSlot slots[3];
    s32 object;
    s32 handle;
    u8 pad38[3];
    u8 count;
    u8 active;
} SelectionState;

extern SelectionState D_80072394;
extern u8 D_8006C33C[];
extern void *D_8008931C;

SetupBlock *func_80032E00(s32, s32);
s32 func_8000D740(void *, s32, SetupMessage *);
void *func_800E06C4(s32, s32 *);
void overlay5_runtime_object_replace(void *);
void func_800E0928(void *, s32, s32);
void overlay5_field_10_store(void *, void *);
void func_80030110(void);
void func_80030050(void);
void func_8000BF08(void);
void func_80030A28(void);
void func_800DCC14(void);
s8 func_800DF76C(void *);
void func_800E078C(void *);
void func_8000D874(void *, s32);
void func_8000D834(void *, s32);
void func_80032F3C(s32, SetupBlock *);

s32 func_800DE388(SetupBlock *source) {
    SetupBlock *block;
    SetupMessage message;
    void *object;
    u16 count;
    u16 i;

    count = 0;
    block = func_80032E00(0, 0x20);
    *block = *source;
    D_80072380->result9C = -1;
    block->mode = 6;
    for (i = 0; i < 3; i++) {
        if (i < 2) {
            if (block->primary[i] == 0) {
                block->primary[i] = block->primary[i + 1];
                block->primary[i + 1] = 0;
            }
            if (block->secondary[i] == 0) {
                block->secondary[i] = block->secondary[i + 1];
                block->secondary[i + 1] = 0;
            }
        }
        count += block->secondary[i] != 0 ? 1 : 0;
    }
    switch (count) {
    case 1:
        D_80072394.count = 1;
        D_80072394.active = 1;
        D_80072394.slots[0].value = block->secondary[0];
        break;
    case 2:
        D_80072394.count = 2;
        D_80072394.active = 2;
        D_80072394.slots[0].value = block->secondary[0];
        D_80072394.slots[1].value = block->secondary[1];
        break;
    case 3:
        D_80072394.count = 3;
        D_80072394.active = 3;
        D_80072394.slots[0].value = block->secondary[0];
        D_80072394.slots[1].value = block->secondary[1];
        D_80072394.slots[2].value = block->secondary[2];
        break;
    }
    message.id = block->id;
    message.data = &block->mode;
    message.zero = 0;
    message.kind = block->kind;
    D_80072394.handle = func_8000D740(D_80072380->owner74, 1, &message);
    object = func_800E06C4(0, &D_80072394.object);
    overlay5_runtime_object_replace(object);
    func_800E0928(object, 6, 0);
    overlay5_field_10_store(object, D_8006C33C);
    func_80030110();
    func_80030050();
    func_8000BF08();
    func_80030A28();
    D_80072380->mode = 6;
    while (D_80072380->result9C == -1) {
        func_800DCC14();
    }
    D_80072380->result9C = func_800DF76C(object);
    func_800E078C(object);
    func_8000D874(D_80072380->owner74, D_80072394.handle);
    func_8000D834(D_8008931C, D_80072394.handle);
    D_80072380->mode = 3;
    func_80032F3C(0, block);
    func_80030110();
    func_80030050();
    func_8000BF08();
    func_80030A28();
    return D_80072380->result9C;
}
