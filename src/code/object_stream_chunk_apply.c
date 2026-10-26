#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_80063F60
#endif
#ifndef SCALE_SHIFT
#define SCALE_SHIFT 0
#endif

typedef void (*ChunkCallback)(void *output, void *context, void *entry,
                              s32 destination_offset, s32 byte_count);

typedef struct StreamDescriptor {
    void **entries;
    s32 total;
    s32 scale;
    u8 pad0C[4];
    s32 count;
    s32 step;
    s32 base;
    s32 end;
    u8 pad20[0x10];
    ChunkCallback primary;
    ChunkCallback secondary;
} StreamDescriptor;

void FUNCTION(void *output_arg, StreamDescriptor *descriptor_arg, s32 alternate_arg)
{
    register void *output __asm__("$20") = output_arg;
    register StreamDescriptor *descriptor __asm__("$16") = descriptor_arg;
    register s32 alternate __asm__("$22") = alternate_arg;
    register s32 scale __asm__("$21");
    register s32 destination_offset __asm__("$19");
    register s32 byte_count __asm__("$18");
    register s32 offset __asm__("$17");
    register s32 chunk __asm__("$4");
    register s32 position __asm__("$5");
    register s32 temporary __asm__("$2");
    register s32 limit __asm__("$3");
    u64 stack_pad;

#if SCALE_SHIFT
    register s32 count __asm__("$4");
    register s32 raw_scale __asm__("$2");
    register s32 base __asm__("$3");
    register s32 step_value __asm__("$3");

    __asm__ volatile("" : "=r"(output) : "0"(output));
    __asm__ volatile("" : "=r"(descriptor) : "0"(descriptor));
    __asm__ volatile("" : "=r"(alternate) : "0"(alternate));
    count = descriptor->count;
    __asm__ volatile("" : "=r"(count) : "0"(count));
    raw_scale = descriptor->scale;
    base = descriptor->base;
    scale = raw_scale << SCALE_SHIFT;
    destination_offset = base * scale;
#else
    register s32 count __asm__("$3");
    register s32 base __asm__("$2");
    register s32 step_value __asm__("$5");

    __asm__ volatile("" : "=r"(output) : "0"(output));
    __asm__ volatile("" : "=r"(descriptor) : "0"(descriptor));
    __asm__ volatile("" : "=r"(alternate) : "0"(alternate));
    scale = descriptor->scale;
    __asm__ volatile("" : "=r"(scale) : "0"(scale));
    base = descriptor->base;
    count = descriptor->count;
    destination_offset = base * scale;
#endif
    if (count > 0) {
        offset = 0;
        do {
            step_value = descriptor->step;
            temporary = count - offset;
            __asm__ volatile("" : "=r"(temporary) : "0"(temporary));
            chunk = temporary;
            if (step_value < chunk) {
                chunk = step_value;
            }
            temporary = descriptor->base;
            limit = descriptor->end;
            position = temporary + offset;
            limit -= position;
            if (limit < chunk) {
                chunk = limit;
            }
            temporary = descriptor->total;
            limit = temporary - position;
            if (limit < chunk) {
                chunk = limit;
            }
            if (chunk <= 0) {
                break;
            }
            byte_count = chunk * scale;
            if (alternate != 0) {
                descriptor->secondary(output, &descriptor->primary,
                                      descriptor->entries[offset],
                                      destination_offset, byte_count);
            } else {
                descriptor->primary(output, &descriptor->primary,
                                    descriptor->entries[offset],
                                    destination_offset, byte_count);
            }
            offset += descriptor->step;
            destination_offset += byte_count;
            count = descriptor->count;
        } while (offset < count);
    }
    __asm__ volatile("" : "=m"(stack_pad));
}
