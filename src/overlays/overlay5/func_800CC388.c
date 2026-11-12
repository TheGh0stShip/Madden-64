#include "types.h"

typedef struct DescriptorCC388 {
    void *root;
    u8 pad[0x14];
    s32 start;
    s32 value;
    s32 limit;
} DescriptorCC388;

extern s8 D_80084FA8;
extern s8 D_800E71B9;
extern s32 D_800E7220[];

s32 func_80022C44(s32 index);
void func_800D5C1C(s32 start, DescriptorCC388 *descriptor, s32 *table);
void func_800CC5C0(void *root);
void func_800CC654(void *root);

void func_800CC388(DescriptorCC388 *descriptor) {
    DescriptorCC388 *copy = descriptor;

    descriptor->start = 0x470;
    descriptor->value = 0;
    descriptor->limit = 0x14A;
    D_800E71B9 = func_80022C44(D_80084FA8);
    func_800D5C1C(0x468, descriptor, D_800E7220);
    if ((s8)func_80022C44(D_80084FA8) == 1) {
        func_800CC5C0(descriptor->root);
    } else {
        func_800CC654(copy->root);
    }
}
