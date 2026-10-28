#include "types.h"

typedef struct Overlay5ExtentFlags {
    u8 pad00[0x14];
    s32 flags;
} Overlay5ExtentFlags;

typedef struct Overlay5ExtentNode2 {
    u8 pad00[0xC];
    void *next;
} Overlay5ExtentNode2;

typedef struct Overlay5ExtentLevel {
    u8 pad00[0xC];
    Overlay5ExtentNode2 *next;
    u8 pad10[0x19];
    u8 kind;
    u8 pad2A[0x42];
    Overlay5ExtentNode2 *extent;
} Overlay5ExtentLevel;

typedef struct Overlay5ExtentRoot {
    u8 pad00[0xC];
    Overlay5ExtentLevel *next;
} Overlay5ExtentRoot;

typedef struct Overlay5ExtentObject {
    Overlay5ExtentRoot *root;
    u8 pad04[0xC];
    Overlay5ExtentFlags *runtime;
} Overlay5ExtentObject;

extern u8 CURRENT_EXTENT;
extern u8 EXTENT_RESOURCE[];

void func_800D5E0C(
    Overlay5ExtentLevel *level,
    void *callback,
    u8 kind,
    Overlay5ExtentFlags *runtime
);
void func_800D5DA0(Overlay5ExtentObject *object);
void func_800CA5CC(void);
void func_800DB44C(void *record, s32 *left, s32 *value, s32 *right);
void func_800A6590(void *resource, u8 value);

void overlay5_object_state_and_extent_update(
    Overlay5ExtentObject *object,
    s32 unused,
    s16 state
) {
    Overlay5ExtentLevel *level;
    s32 left;
    s32 value;
    s32 right;
    u8 *current;

    level = object->root->next;
    switch (state) {
        case 13:
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

        case 17:
        case 28:
            func_800CA5CC();
            break;
    }

    func_800DB44C(level->extent->next, &left, &value, &right);
    current = &CURRENT_EXTENT;
    if (*current != value) {
        func_800A6590(EXTENT_RESOURCE, value);
        *current = value;
    }
}
