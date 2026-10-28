#include "types.h"

typedef struct Overlay5DispatchFlags {
    u8 pad00[0x14];
    s32 flags;
} Overlay5DispatchFlags;

typedef struct Overlay5DispatchLevel2 {
    u8 pad00[0xC];
    void *next;
} Overlay5DispatchLevel2;

typedef struct Overlay5DispatchLevel1 {
    u8 pad00[0xC];
    Overlay5DispatchLevel2 *next;
    u8 pad10[0x19];
    u8 kind;
} Overlay5DispatchLevel1;

typedef struct Overlay5DispatchRoot {
    u8 pad00[0xC];
    Overlay5DispatchLevel1 *next;
} Overlay5DispatchRoot;

typedef struct Overlay5DispatchObject {
    Overlay5DispatchRoot *root;
    u8 pad04[0xC];
    Overlay5DispatchFlags *runtime;
} Overlay5DispatchObject;

void func_800D5E0C(
    Overlay5DispatchLevel1 *level,
    void *callback,
    u8 kind,
    Overlay5DispatchFlags *runtime
);
void func_800DD514(s32 value);
void func_800D5DA0(Overlay5DispatchObject *object);

void overlay5_object_state_dispatch(
    Overlay5DispatchObject *object,
    s32 unused,
    s16 state
) {
    Overlay5DispatchLevel1 *level;

    switch (state) {
        case 13:
            level = object->root->next;
            func_800D5E0C(
                level,
                level->next->next,
                level->kind,
                object->runtime
            );
            object->runtime->flags |= 1;
            break;

        case 28:
            func_800DD514(0);
            break;

        case 12:
            func_800D5DA0(object);
            break;
    }
}
