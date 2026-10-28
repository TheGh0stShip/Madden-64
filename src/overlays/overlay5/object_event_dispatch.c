#include "types.h"

typedef struct Overlay5EventFlags {
    u8 pad00[0x14];
    s32 flags;
} Overlay5EventFlags;

typedef struct Overlay5EventCallback {
    u8 pad00[0xC];
    void (*callback)(void);
} Overlay5EventCallback;

typedef struct Overlay5EventLevel2 {
    u8 pad00[0xC];
    Overlay5EventCallback *next;
} Overlay5EventLevel2;

typedef struct Overlay5EventLevel1 {
    u8 pad00[0xC];
    Overlay5EventLevel2 *next;
    u8 pad10[0x19];
    u8 kind;
} Overlay5EventLevel1;

typedef struct Overlay5EventRoot {
    u8 pad00[0xC];
    Overlay5EventLevel1 *next;
} Overlay5EventRoot;

typedef struct Overlay5EventObject {
    Overlay5EventRoot *root;
    u8 pad04[0xC];
    Overlay5EventFlags *runtime;
} Overlay5EventObject;

void func_800D5E0C(
    Overlay5EventLevel1 *level,
    Overlay5EventCallback *callback,
    u8 kind,
    Overlay5EventFlags *runtime
);
void func_800DF72C(void);
void func_800D5DA0(Overlay5EventObject *object);

void overlay5_object_event_dispatch(
    Overlay5EventObject *object,
    s32 unused,
    s16 state
) {
    Overlay5EventLevel1 *level;
    Overlay5EventLevel2 *level2;

    switch (state) {
        case 13: {
            level = object->root->next;
            level2 = level->next;

            func_800D5E0C(level, level2->next, level->kind, object->runtime);
            object->runtime->flags |= 1;
            break;
        }

        case 28: {
            void (*callback)(void);

            func_800DF72C();
            level = object->root->next;
            level2 = level->next;
            callback = level2->next->callback;
            if (callback != 0) {
                callback();
            }
            break;
        }

        case 12:
            func_800D5DA0(object);
            break;
    }
}
