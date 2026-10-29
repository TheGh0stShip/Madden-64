#include "types.h"

typedef struct RuntimeIndexRecord {
    u8 data[0x68];
} RuntimeIndexRecord;

extern RuntimeIndexRecord D_80085860[];
extern void func_800E2438(s32 index);
extern void func_800E2354(void);
extern s32 func_8004A0A8(RuntimeIndexRecord* record, u32* value);
extern void func_800E2480(void);

u32 func_800E14D0(s32 index) {
    u32 value;

    func_800E2438(index);
    func_800E2354();
    index <<= 16;
    index >>= 16;
    if (func_8004A0A8(&D_80085860[index], &value) == 1) {
        value = 0;
    }
    value >>= 8;
    func_800E2480();
    return value;
}
