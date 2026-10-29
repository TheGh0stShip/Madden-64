#include "types.h"

typedef struct Overlay5DestroyObject {
    u8 pad00[4];
    struct Overlay5DestroyObject *next;
    u8 type;
} Overlay5DestroyObject;

typedef void (*Overlay5DestroyCallback)(Overlay5DestroyObject *object);

typedef struct Overlay5DestroyType {
    u8 pad00[4];
    Overlay5DestroyCallback destroy;
    u8 pad08[8];
} Overlay5DestroyType;

typedef struct Overlay5DestroySystem {
    Overlay5DestroyType *types;
    u8 pad04[4];
    Overlay5DestroyObject *head;
} Overlay5DestroySystem;

extern Overlay5DestroySystem *D_80072460;

void func_80032F3C(s32 mode, void *allocation);

void overlay5_runtime_object_system_destroy(void) {
    Overlay5DestroyObject *object;
    Overlay5DestroyObject *next;

    object = D_80072460->head;
    while (object != 0) {
        D_80072460->types[object->type].destroy(object);
        next = object;
        object = object->next;
        func_80032F3C(0, next);
    }
    func_80032F3C(0, D_80072460);
    D_80072460 = 0;
}
