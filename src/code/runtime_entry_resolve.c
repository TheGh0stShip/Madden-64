#include "types.h"

extern u16 func_80031A1C(u16 maximum);
extern void func_80040274(u8* entry);

void func_8003F230(u8* entry) {
    if (entry[2] < 46 && func_80031A1C(100) < 25) {
        *(u16*)entry = 0xFFFF;
    } else {
        func_80040274(entry);
    }
}
