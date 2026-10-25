#include "types.h"

typedef struct GridSource {
    u8 pad0[0x10];
    u8* values;
    u8 pad14[0x14];
} GridSource;

extern GridSource* D_80088094;
extern void func_8002212C(u16 first, u16 second, u16 group, u16 value);

void func_80022304(u16 first, u16 second, u16 group, u16 index) {
    func_8002212C(first, second, group,
                  D_80088094[group].values[index]);
}
