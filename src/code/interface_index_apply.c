#include "types.h"

extern u16 func_80041F6C(u16 index);
extern void func_80041C48(u16 value);

void func_80041BB4(u16 index) {
    func_80041C48(func_80041F6C(index));
}
