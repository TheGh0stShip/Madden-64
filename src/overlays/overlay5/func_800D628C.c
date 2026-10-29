#include "types.h"

typedef struct Overlay5CleanupChild {
    u8 pad0[4];
    void* field4;
} Overlay5CleanupChild;

typedef struct Overlay5CleanupNode {
    u8 pad0[0xC];
    Overlay5CleanupChild* child;
} Overlay5CleanupNode;

typedef struct Overlay5CleanupOwner {
    u8 pad0[0x24];
    Overlay5CleanupNode* node;
    void* field28;
    u8 pad2C[0xC];
    void* field38;
} Overlay5CleanupOwner;

extern void* D_80087AA8;
extern void* D_8008931C;
extern void func_800D6370(void* object);
extern void func_800E078C(Overlay5CleanupNode* node);
extern void func_80032F3C(s32 value, void* object);
extern void func_8000D874(void* first, void* second);
extern void func_8000D834(void* first, void* second);

void func_800D628C(Overlay5CleanupOwner* input) {
    Overlay5CleanupOwner* owner = input;
    Overlay5CleanupNode* node = input->node;
    Overlay5CleanupChild* child = node->child;

    if (child->field4 != 0) {
        func_800D6370(input->field38);
    }
    func_800E078C(node);
    func_80032F3C(0, child);
    func_8000D874(D_80087AA8, owner->field28);
    func_8000D834(D_8008931C, owner->field28);
    owner->node = 0;
    owner->field28 = 0;
    owner->field38 = 0;
}
