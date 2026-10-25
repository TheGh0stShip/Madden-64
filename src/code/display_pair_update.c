#include "types.h"

typedef struct DisplayPair {
    u8 pad0[0x1E];
    u8 first;
    u8 second;
} DisplayPair;

extern void func_80025794(u8 first, u8 second, s32 mode, s16 value);
extern void func_8002586C(u8 first, u8 second, s32 mode, s16 value);

void func_80027C3C(DisplayPair* pair, s16 value) {
    func_80025794(pair->first, pair->second, 0x1E, value);
    func_8002586C(pair->first, pair->second, 0x2E, value);
}
