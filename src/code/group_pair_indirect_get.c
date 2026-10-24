#include "types.h"

typedef struct IndirectGroup {
    u8 pad0[0x10];
    u8* indices;
    u8 pad14[0x14];
} IndirectGroup;

extern IndirectGroup* D_80088094;
extern u8 func_8003C6B4(u16 group, u16 index);

u8 func_80022234(u16 group, u16 entry) {
    return func_8003C6B4(group, D_80088094[group].indices[entry]);
}
