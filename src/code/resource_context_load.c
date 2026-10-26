#include "types.h"

typedef struct ResourceItem {
    u8 pad00[8];
    u16 offset;
    u8 pad0A[6];
    void *resolved;
} ResourceItem;

typedef struct ResourceEntry {
    u8 pad00[8];
    ResourceItem *item;
} ResourceEntry;

typedef struct ResourceContext {
    void *source;
    u32 count;
    u32 value8;
    u32 valueC;
} ResourceContext;
typedef struct ResourceBlock16 { u32 words[4]; } ResourceBlock16;

extern u8 D_8007947C[];
extern u8 * volatile D_80069294;
extern u32 D_80069298;
extern u32 D_8006929C;
extern u32 D_800692AC;
extern void func_80032F3C(s32 zero, void *source);

void resource_context_load(ResourceContext *context)
{
    register ResourceContext *saved_context __asm__("$16") = context;
    register u32 *value8_pointer __asm__("$17");
    register u32 count_value __asm__("$3");
    register u32 temp_value __asm__("$2");
    register void *call_source __asm__("$5");
    ResourceBlock16 *source;
    ResourceBlock16 *destination;
    ResourceBlock16 *end;
    register s32 index __asm__("$6");
    register s32 previous __asm__("$4");
    register ResourceEntry **cursor __asm__("$7");
    register ResourceItem *item __asm__("$5");
    register u8 *array_base __asm__("$3");
    register u8 * volatile *global_pointer __asm__("$8");
    register u32 loop_count __asm__("$2");
    register s32 cursor_offset __asm__("$2");
    register u32 relative __asm__("$2");

    __asm__("" : "=r"(saved_context) : "0"(saved_context));
    source = saved_context->source;
    destination = (ResourceBlock16 *)D_8007947C;
    end = source + 8;
    do {
        *destination = *source;
        source++;
        destination++;
    } while (source != end);
    count_value = saved_context->count;
    temp_value = saved_context->value8;
    __asm__("" : "=r"(count_value) : "0"(count_value), "r"(temp_value));
    value8_pointer = &D_80069298;
    __asm__("" : "=r"(value8_pointer) : "0"(value8_pointer));
    *value8_pointer = temp_value;
    __asm__ volatile("" : : : "memory");
    temp_value = saved_context->valueC;
    D_8006929C = temp_value;
    __asm__ volatile("" : : : "memory");
    call_source = saved_context->source;
    D_800692AC = count_value;
    func_80032F3C(0, call_source);
    func_80032F3C(0, saved_context);

    loop_count = D_800692AC;
    __asm__("" : "=r"(loop_count) : "0"(loop_count));
    if (loop_count != 0) {
        index = loop_count - 1;
        global_pointer = (u8 * volatile *)(value8_pointer - 1);
        array_base = D_8007947C;
        cursor_offset = index * 4;
        cursor = (ResourceEntry **)(array_base + cursor_offset);
        do {
            item = (*cursor)->item;
            cursor--;
            relative = item->offset & 0xFFFC;
            relative += (u32)D_80069294;
            __asm__("" : "=r"(relative) : "0"(relative));
            relative = *(u32 *)relative;
            previous = index;
            index--;
            relative += (u32)*global_pointer;
            __asm__("" : "=r"(relative) : "0"(relative));
            item->resolved = (void *)relative;
        } while (previous != 0);
    }
}
