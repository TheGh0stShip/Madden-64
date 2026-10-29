#include "types.h"

typedef struct RuntimeResetObject {
    u8 pad0[0x14];
    s32 field14;
    s32 field18;
    u8 pad1C[0x28];
    void* field44;
    s32 field48;
    s32 field4C;
} RuntimeResetObject;

extern void func_8000BE80(void);
extern RuntimeResetObject* func_800DD634(void);
extern void func_8000DA98(void* value);
extern void func_800D628C(void* value);

void func_800C90C0(void* value) {
    RuntimeResetObject* object;

    func_8000BE80();
    object = func_800DD634();
    object->field48 = 0;
    object->field4C = 0;
    object->field14 = 0;
    object->field18 = 0;
    func_8000DA98(object->field44);
    object->field44 = 0;
    func_800D628C(value);
}
