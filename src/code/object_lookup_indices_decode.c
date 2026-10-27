#include "types.h"

extern void func_80061F10(void *object, s32 first, s32 second, s32 third);

void object_lookup_indices_decode(u8 *object, u8 **sources, u8 **outputs,
                                  s32 count)
{
    register u8 *saved_object __asm__("$23") = object;
    register u8 **saved_sources __asm__("$21");
    register u8 **saved_outputs __asm__("$22");
    register s32 outer __asm__("$20") = 0;
    register s32 remaining __asm__("$18");
    register u8 *input __asm__("$16");
    register u8 *output __asm__("$19");
    register u16 *entry __asm__("$17");
    u16 **table;
    u8 *runtime;
    s32 width_value;
    volatile struct {
        u32 pad0;
        s32 count;
        u32 pad1;
        s32 width;
    } locals;
    volatile u64 padding;

    locals.count = count;
    __asm__("" : "=r"(saved_object) : "0"(saved_object));
    runtime = *(u8 **)(saved_object + 0x1C8);
    width_value = *(s32 *)(saved_object + 0x70);
    table = *(u16 ***)(runtime + 0x18);
    if (count > 0) {
        locals.width = width_value;
        saved_outputs = outputs;
        saved_sources = sources;
        do {
            remaining = locals.width;
            input = *saved_sources;
            output = *saved_outputs;
            if (remaining != 0) {
                do {
                    s32 first = *input++ >> 3;
                    s32 second = *input++ >> 2;
                    register u32 third_byte __asm__("$4") = *input;
                    s32 third = third_byte >> 3;
                    register u8 *base __asm__("$3") =
                        (u8 *)table[first] + (second << 6);

                    entry = (u16 *)(base + (third << 1));
                    input++;
                    if (*entry == 0) {
                        func_80061F10(saved_object, first, second, third);
                    }
                    *output++ = ((u8 *)entry)[1] - 1;
                    remaining--;
                } while (remaining != 0);
            }
            saved_outputs++;
            outer++;
            saved_sources++;
        } while (outer < locals.count);
    }
}
