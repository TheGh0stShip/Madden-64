#include "types.h"

typedef void (*PlaneSetupFn)(void *object, void *entry, u32 source,
                             void *parameter);
typedef void (*PlaneCopyFn)(void *object, void *planes, u32 offset,
                            void *source, u32 count);

void image_plane_decode(u8 *object_arg, u32 *sources_arg, u32 *plane_arg,
                        u32 unused, u8 *input, u32 *input_index,
                        u32 available_arg)
{
    register u8 *object __asm__("$21") = object_arg;
    u32 *plane_index = plane_arg;
    register u8 *state __asm__("$19");
    register u8 *entry __asm__("$16");
    register u8 *output __asm__("$22");
    register u32 *sources __asm__("$18");
    register u32 available __asm__("$23") = available_arg;
    u32 count;
    u32 remaining;
    register s32 i __asm__("$17");
    register u32 parameter_offset __asm__("$20");
    u32 source;
    register u8 *call_object __asm__("$4");
    register u8 *call_output __asm__("$5");
    register u8 *call_parameter __asm__("$7");
    PlaneSetupFn setup;
    u64 stack_pad;
    u8 *copy_table;
    register u8 *copy_object __asm__("$4");
    register u8 *copy_planes __asm__("$5");

    state = *(u8 **)(object + 0x1C0);
    if (*(s32 *)(state + 0x5C) >= *(s32 *)(object + 0x134)) {
        output = *(u8 **)(object + 0xD8);
        i = 0;
        if (*(s32 *)(object + 0x20) > 0) {
            parameter_offset = 0xC;
            sources = sources_arg;
            entry = state;
            do {
                source = *plane_index * *(u32 *)(entry + 0x64);
                call_object = object;
                call_output = output;
                call_parameter = state + parameter_offset;
                __asm__ volatile("" : : "r"(call_object), "r"(call_output),
                                 "r"(call_parameter));
                parameter_offset += 4;
                setup = *(PlaneSetupFn *)(entry + 0x34);
                source = *sources + source * 4;
                sources++;
                entry += 4;
                setup(call_object, call_output, source, call_parameter);
                i++;
                output += 0x54;
            } while (i < *(s32 *)(object + 0x20));
        }
        *(u32 *)(state + 0x5C) = 0;
    }
    remaining = *(u32 *)(object + 0x134) - *(u32 *)(state + 0x5C);
    if (*(u32 *)(state + 0x60) < remaining) {
        remaining = *(u32 *)(state + 0x60);
    }
    count = *input_index;
    available -= count;
    if (available < remaining) {
        remaining = available;
    }
    copy_table = *(u8 **)(object + 0x1C4);
    __asm__ volatile("" : "=r"(copy_table) : "0"(copy_table));
    copy_object = object;
    copy_planes = state + 0xC;
    __asm__ volatile("" : : "r"(copy_object), "r"(copy_planes));
    __asm__ volatile("" : "=m"(stack_pad));
    (*(PlaneCopyFn *)(copy_table + 4))(
        copy_object, copy_planes, *(u32 *)(state + 0x5C),
        input + count * 4, remaining);
    *input_index += remaining;
    *(u32 *)(state + 0x60) -= remaining;
    *(u32 *)(state + 0x5C) += remaining;
    if (*(s32 *)(state + 0x5C) >= *(s32 *)(object + 0x134)) {
        (*plane_index)++;
    }
}
