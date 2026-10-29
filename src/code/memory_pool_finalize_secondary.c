#include "types.h"

typedef struct PoolNode PoolNode;
struct PoolNode {
    PoolNode *prev;
    PoolNode *next;
    s32 offset;
    s16 id;
    u8 pad0E[2];
    s32 argA;
    s32 argB;
};

typedef struct {
    u8 *flags;
    u8 pad04[0x18 - 0x4];
} PoolBank;

extern PoolBank D_8008B080[];
extern PoolNode *D_80071304;
extern PoolNode *D_80071308;
extern s32 D_800724E0;
extern s32 D_800724E4;
extern s32 D_800724E8;
extern s32 D_8008503C;
extern u8 D_800712F8;
extern volatile s32 D_80088070;
extern s32 D_800895E0;
extern PoolNode *func_80033298(s32 pool);
extern void func_80036B94(void);

void memory_pool_finalize_secondary(s16 id, s32 offset) {
    PoolNode *head;
    PoolNode *node;

    if (!(id & 0x4000)) {
        D_8008B080[(u16)id].flags[offset] |= 0x41;
    }
    head = D_80071304;
    node = func_80033298(D_800724E0);
    if (D_80071304 != 0) {
        node->prev = 0;
        node->next = D_80071304;
        D_80071304->prev = node;
        D_80071304 = node;
    } else {
        D_80071304 = node;
        D_80071308 = node;
        node->prev = 0;
        node->next = 0;
    }
    node->id = id;
    node->offset = offset;
    node->argA = D_800724E4;
    D_800724E4 = 0;
    node->argB = D_800724E8;
    D_800724E8 = 0;
    D_8008503C |= 0x04000000;
    if (head == 0) {
        if (D_800712F8 == 0 || D_80088070 != -1) {
            func_80036B94();
        } else {
            D_800895E0 = 1;
        }
    }
    D_8008503C &= 0xFBFFFFFF;
}
