#include "types.h"

extern u8 D_80074A8C[];
extern void func_800451F8(void* output, void* input, void* data);
extern void func_8004528C(void* owner, void* output);
extern void func_800452FC(void* output);
extern void func_80045450(void* output, void* table);

void func_80045538(void* owner, u8* input) {
    u8 output[0x80];

    func_800451F8(output, input, input + 0xC);
    func_8004528C(owner, output);
    func_800452FC(output);
    func_80045450(output, D_80074A8C);
}
