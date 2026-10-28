#include "types.h"

typedef struct Overlay5ExtendedFlags {
    u8 pad00[0x14];
    s32 flags;
} Overlay5ExtendedFlags;

typedef struct Overlay5ExtendedCallback {
    u8 pad00[0xC];
    void *next;
} Overlay5ExtendedCallback;

typedef struct Overlay5ExtendedLevel {
    u8 pad00[0xC];
    Overlay5ExtendedCallback *next;
    u8 pad10[0x19];
    u8 kind;
} Overlay5ExtendedLevel;

typedef struct Overlay5ExtendedRoot {
    u8 pad00[0xC];
    Overlay5ExtendedLevel *next;
} Overlay5ExtendedRoot;

typedef struct Overlay5ExtendedObject {
    Overlay5ExtendedRoot *root;
    u8 pad04[0xC];
    Overlay5ExtendedFlags *runtime;
} Overlay5ExtendedObject;

extern u8 EXPECTED_RESOURCE[];

void func_800D5E0C(
    Overlay5ExtendedLevel *level,
    void *callback,
    u8 kind,
    Overlay5ExtendedFlags *runtime
);
void func_800D5DA0(Overlay5ExtendedObject *object);
void *func_800E0124(Overlay5ExtendedRoot *root);
s32 func_800E0138(void *resource);
void func_800CC5C0(Overlay5ExtendedRoot *root);
void func_800CC654(Overlay5ExtendedRoot *root);
void func_800DF72C(void);
void func_800DD4B8(void);

void overlay5_object_extended_state_dispatch(
    Overlay5ExtendedObject *object,
    s32 unused,
    s16 state
) {
    Overlay5ExtendedLevel *level;
    void *resource;

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

        case 12:
            func_800D5DA0(object);
            break;

        case 26:
            resource = func_800E0124(object->root);
            if (resource == EXPECTED_RESOURCE) {
                if (func_800E0138(resource) == 1) {
                    func_800CC5C0(object->root);
                } else {
                    func_800CC654(object->root);
                }
            }
            break;

        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
    }
}
