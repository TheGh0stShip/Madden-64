#include "types.h"

typedef struct DimensionNode {
    u8 pad0[8];
    struct DimensionNode* source;
    u8 padC[0xA];
    u16 width;
    u16 height;
} DimensionNode;

extern volatile u16 D_800784B0;
extern volatile u16 D_800784B2;

volatile u16* func_80017C7C(DimensionNode* node) {
    DimensionNode* source = node->source;
    volatile u16* output = &D_800784B0;

    *output = source->width;
    D_800784B2 = source->height;
    return output;
}
