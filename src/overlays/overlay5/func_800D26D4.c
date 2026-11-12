#include "types.h"

typedef struct DescriptorD26D4 {
    u8 pad[0x18];
    s32 start;
    s32 value;
    s32 limit;
} DescriptorD26D4;

extern s32 *D_800E5EB4;
extern s32 D_800E5F08[];

void func_800D5C1C(s32 start, DescriptorD26D4 *descriptor, s32 *table);

void func_800D26D4(DescriptorD26D4 *descriptor) {
    DescriptorD26D4 *copy = descriptor;

    descriptor->limit = 250;
    descriptor->value = 0;
    if (D_800E5EB4 == D_800E5F08) {
        descriptor->start = 0x268;
        func_800D5C1C(0x260, descriptor, D_800E5EB4);
    } else {
        copy->start = 0x278;
        func_800D5C1C(0x270, copy, D_800E5EB4);
    }
}
