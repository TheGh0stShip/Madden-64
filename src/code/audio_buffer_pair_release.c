#include "types.h"

typedef struct AudioBuffers {
    u8 pad0[8];
    void* first;
    void* second;
    u8 pad10[0x1C];
} AudioBuffers;

extern AudioBuffers D_8007A900[];
extern void func_80032F3C(s32 type, void* buffer);

void func_800444D0(u16 index) {
    func_80032F3C(0, D_8007A900[index].first);
    func_80032F3C(0, D_8007A900[index].second);
}
