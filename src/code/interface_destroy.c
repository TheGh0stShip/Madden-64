#include "types.h"

extern void func_8006460C(void* object, s32 index);
extern void func_80064950(void* object, void* allocation, s32 size);
extern void func_800649F4(void* object);

typedef struct InterfaceObject {
    u8 pad0[4];
    void* allocation;
} InterfaceObject;

void func_80064790(InterfaceObject* object) {
    s32 index;

    for (index = 1; index >= 0; index--) {
        func_8006460C(object, index);
    }
    func_80064950(object, object->allocation, 0x50);
    object->allocation = 0;
    func_800649F4(object);
}
