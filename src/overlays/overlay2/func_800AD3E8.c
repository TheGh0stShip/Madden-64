#include "types.h"

typedef struct {
    u8 pad00[0x64];
    u32 value64;
} AD3E8Object;

s32 func_800AD9B0(u16 value);
void func_800ADA3C(u16 value);
void func_800ADC50(s16 left, s16 right, s32 mode);
void func_800ACC64(AD3E8Object *object);
void func_800ACA58(AD3E8Object *object, s32 mode);

void func_800AD3E8(AD3E8Object *object, u16 value) {
    u32 saved = object->value64;
    u16 copy = saved;

    if ((s16)func_800AD9B0(value) == 1) {
        func_800ADA3C((u16)copy);
    } else {
        func_800ADC50((s16)saved, (s16)value, 1);
    }
    func_800ACC64(object);
    func_800ACA58(object, 6);
}
