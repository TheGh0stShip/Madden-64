#include "types.h"

typedef struct AudioBuffers {
    u8 pad0[8];
    void* first;
    void* second;
    u8 pad10[0x1C];
} AudioBuffers;

extern AudioBuffers D_8007A900[];
extern void* func_80032E00(s32 type, u32 size);

void func_8004445C(u16 index) {
    D_8007A900[index].first = func_80032E00(0, 0x200);
    D_8007A900[index].second = func_80032E00(0, 0x200);
}
