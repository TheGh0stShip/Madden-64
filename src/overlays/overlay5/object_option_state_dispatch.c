#include "types.h"

typedef struct OptionFlags { u8 pad00[0x14]; s32 flags; } OptionFlags;
typedef struct OptionNode { u8 pad00[0xC]; void *next; } OptionNode;
typedef struct OptionLevel {
    u8 pad00[0xC]; OptionNode *next; u8 pad10[0x19]; u8 kind;
    u8 pad2A[0x42]; OptionNode *extent;
} OptionLevel;
typedef struct OptionRoot { u8 pad00[0xC]; OptionLevel *next; } OptionRoot;
typedef struct OptionObject {
    OptionRoot *root; u8 pad04[0xC]; OptionFlags *runtime;
} OptionObject;

extern u8 OPTION_ACTIVE;
extern u8 CURRENT_OPTION;
extern u8 OPTION_RESOURCE[];
void func_800D5E0C(OptionLevel *, void *, u8, OptionFlags *);
void func_800D5DA0(OptionObject *);
void func_800DF72C(void);
void func_800DB44C(void *, s32 *, s32 *, s32 *);
void func_800DD514(void *);
void func_800DD4B8(void);

void overlay5_object_option_state_dispatch(OptionObject *object, s32 unused, s16 state) {
    u8 options[8] = { 3, 16, 17, 18, 15, 5, 4, 6 };
    u8 *option_ptr;
    OptionLevel *level;
    s32 left;
    s32 value;
    s32 right;

    option_ptr = options;
    switch (state) {
        case 13:
            level = object->root->next;
            func_800D5E0C(level, level->next->next, level->kind, object->runtime);
            object->runtime->flags |= 1;
            break;
        case 12:
            func_800D5DA0(object);
            break;
        case 8:
            func_800DF72C();
            level = object->root->next;
            func_800DB44C(level->extent->next, &left, &value, &right);
            OPTION_ACTIVE = 1;
            CURRENT_OPTION = option_ptr[value];
            func_800DD514(OPTION_RESOURCE);
            break;
        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
    }
}
