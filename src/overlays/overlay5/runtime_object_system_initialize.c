#include "types.h"

typedef struct Overlay5ObjectSystem {
    void *types;
    void *current;
    void *field08;
    s16 field0C;
    u8 pad0E[2];
    s16 field10;
    s16 field12;
    void *field14;
} Overlay5ObjectSystem;

extern u8 D_80072440[];
extern Overlay5ObjectSystem *D_80072460;

void *func_80032E00(s32 mode, s32 size);

void overlay5_runtime_object_system_initialize(void) {
    Overlay5ObjectSystem *system;

    system = func_80032E00(0, 0x20);
    D_80072460 = system;
    system->current = 0;
    system->field08 = 0;
    system->types = D_80072440;
    system->field0C = 0;
    system->field10 = 0;
    system->field12 = 0;
    system->field14 = 0;
}
