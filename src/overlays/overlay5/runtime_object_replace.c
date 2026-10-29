#include "types.h"

typedef struct Overlay5RuntimeObject {
    u8 pad00[8];
    u8 type;
} Overlay5RuntimeObject;

typedef void (*Overlay5RuntimeCallback)(Overlay5RuntimeObject *object, s32 event);

typedef struct Overlay5RuntimeType {
    u8 pad00[8];
    Overlay5RuntimeCallback callback;
    u8 pad0C[4];
} Overlay5RuntimeType;

typedef struct Overlay5RuntimeSystem {
    Overlay5RuntimeType *types;
    Overlay5RuntimeObject *current;
} Overlay5RuntimeSystem;

extern Overlay5RuntimeSystem *D_80072460;

void overlay5_runtime_object_replace(Overlay5RuntimeObject *object) {
    Overlay5RuntimeSystem *system;
    Overlay5RuntimeObject *current;

    system = D_80072460;
    current = system->current;
    if (current != 0) {
        system->types[current->type].callback(current, 0xB);
    }
    D_80072460->current = object;
    if (object != 0) {
        D_80072460->types[object->type].callback(object, 0xA);
    }
}
