#include "types.h"

typedef struct DispatchFlags {
    u8 pad00[0x14];
    s32 flags;
} DispatchFlags;

typedef struct DispatchLink {
    u8 pad00[0xC];
    void *next;
} DispatchLink;

typedef struct DispatchNode {
    u8 pad00[0xC];
    DispatchLink *next;
    u8 pad10[0x19];
    u8 kind;
    u8 pad2A[0x42];
    struct DispatchNode *extent;
} DispatchNode;

typedef struct DispatchRoot {
    u8 pad00[0xC];
    DispatchNode *next;
} DispatchRoot;

typedef struct DispatchObject {
    DispatchRoot *root;
    u8 pad04[0xC];
    DispatchFlags *runtime;
} DispatchObject;

extern u8 D_800892B0;
extern u8 D_8008B358;
extern u8 D_80072198[];

void func_800D5E0C(DispatchNode *, void *, u8, DispatchFlags *);
void func_800D5DA0(DispatchObject *);
void func_800DF72C(void);
s32 func_800E0124(DispatchRoot *root);
void func_800DB44C(void *, s32 *, s32 *, s32 *);
s32 func_800E0138(s32);
void func_800DD514(void *);
void func_800DD4B8(void);

void func_800CC7A0(void *arg, s32 unused, s16 state) {
    DispatchObject *object = arg;
    DispatchNode *level;
    void *extent;
    s32 first;
    s32 second;
    s32 third;
    s32 row;
    u8 choices[36] = {
        0x00, 0x13, 0x14, 0x15, 0x0C, 0x1D, 0x1E, 0x1F,
        0x0A, 0x16, 0x17, 0x18, 0x0B, 0x19, 0x1A, 0x1B,
        0x0E, 0x21, 0x22, 0x23, 0x0D, 0x20, 0x00, 0x00,
        0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
        0x09, 0x00, 0x00, 0x00,
    };
    switch (state) {
        case 13:
            level = object->root->next;
            func_800D5E0C(level, level->next->next,
                          level->kind, object->runtime);
            object->runtime->flags |= 1;
            break;
        case 12:
            func_800D5DA0(object);
            break;
        case 8:
            func_800DF72C();
            level = object->root->next;
            extent = level->extent->next;
            row = func_800E0124(object->root);
            func_800DB44C(extent, &first, &second, &third);
            D_800892B0 = 0;
            D_8008B358 = choices[second * 4 + func_800E0138(row)];
            func_800DD514(D_80072198);
            break;
        case 28:
            func_800DF72C();
            func_800DD4B8();
            break;
    }
}
