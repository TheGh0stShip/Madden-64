#include "types.h"

typedef struct RuntimeVtable {
    u8 pad0[8];
    void (*dispatch)(void);
} RuntimeVtable;

typedef struct RuntimeObject {
    RuntimeVtable* vtable;
} RuntimeObject;

extern void func_8006337C(RuntimeObject* object);

void func_80063418(RuntimeObject* object) {
    object->vtable->dispatch();
    func_8006337C(object);
    for (;;) {
    }
}
