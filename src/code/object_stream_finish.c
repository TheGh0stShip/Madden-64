#include "types.h"

#ifndef FUNCTION
#define FUNCTION object_stream_finalize
#endif
#ifndef PROCESS
#define PROCESS func_80063F60
#endif
#ifndef SCALE_SHIFT
#define SCALE_SHIFT 0
#endif

extern void PROCESS(void *object, void *record, s32 mode);
extern void func_800632F4(void *entry, s32 size);

void **FUNCTION(u8 *object_arg, u8 *record_arg, u32 start_arg, u32 count,
                s32 strict_arg)
{
    register u8 *object __asm__("$18") = object_arg;
    register u8 *record __asm__("$17") = record_arg;
    register u32 start __asm__("$20") = start_arg;
    register u32 end __asm__("$19");
    register s32 strict __asm__("$21") = strict_arg;
    register u32 cursor __asm__("$16");
    register s32 stride __asm__("$18");
    register s32 position __asm__("$3");
    register u32 progress __asm__("$3");
    register u32 base __asm__("$2");
#if SCALE_SHIFT
    register u32 raw_stride __asm__("$3");
#endif
    register u32 return_offset __asm__("$2");
    register void **array __asm__("$3");
    register s32 call_stride __asm__("$5");
    register u8 *inner_v1 __asm__("$3");
    register u8 *inner_v0 __asm__("$2");

    end = start + count;
    if (*(u32 *)(record + 4) < end ||
        *(u32 *)(record + 0xC) < count) {
        goto invalid_request;
    }
    __asm__("" : "=r"(record) : "0"(record));
    if (*(void **)record == 0) {
invalid_request:
        inner_v1 = *(u8 **)object;
        *(s32 *)(inner_v1 + 0x14) = 0x14;
        inner_v0 = *(u8 **)object;
        (*(void (**)(void *))inner_v0)(object);
    }

    if (start < *(u32 *)(record + 0x18) ||
        *(u32 *)(record + 0x18) + *(u32 *)(record + 0x10) < end) {
        if (*(s32 *)(record + 0x28) == 0) {
            inner_v1 = *(u8 **)object;
            *(s32 *)(inner_v1 + 0x14) = 0x44;
            inner_v0 = *(u8 **)object;
            (*(void (**)(void *))inner_v0)(object);
        }
        if (*(s32 *)(record + 0x24) != 0) {
            PROCESS(object, record, 1);
            *(s32 *)(record + 0x24) = 0;
        }
        if (*(u32 *)(record + 0x18) < start) {
            *(u32 *)(record + 0x18) = start;
        } else {
            position = *(s32 *)(record + 0x10);
            position = (s32)end - position;
            if (position < 0) {
                position = 0;
            }
            *(s32 *)(record + 0x18) = position;
        }
        PROCESS(object, record, 0);
    }

    progress = *(u32 *)(record + 0x1C);
    if (progress < end) {
        if (progress < start) {
            if (strict != 0) {
                inner_v1 = *(u8 **)object;
                *(s32 *)(inner_v1 + 0x14) = 0x14;
                inner_v0 = *(u8 **)object;
                (*(void (**)(void *))inner_v0)(object);
            }
            cursor = start;
        } else {
            cursor = progress;
        }
        if (strict != 0) {
            *(u32 *)(record + 0x1C) = end;
        }
        if (*(s32 *)(record + 0x20) != 0) {
            base = *(u32 *)(record + 0x18);
#if SCALE_SHIFT
            __asm__("" : "=r"(base) : "0"(base));
            raw_stride = *(u32 *)(record + 8);
            stride = raw_stride << SCALE_SHIFT;
#else
            stride = *(u32 *)(record + 8);
#endif
            cursor -= base;
            end -= base;
            while (cursor < end) {
                call_stride = stride;
                __asm__("" : "=r"(call_stride) : "0"(call_stride));
                func_800632F4((*(void ***)record)[cursor], call_stride);
                cursor++;
            }
        } else if (strict == 0) {
            inner_v1 = *(u8 **)object;
            *(s32 *)(inner_v1 + 0x14) = 0x14;
            inner_v0 = *(u8 **)object;
            (*(void (**)(void *))inner_v0)(object);
        }
    }

    if (strict != 0) {
        *(s32 *)(record + 0x24) = 1;
    }
    return_offset = *(u32 *)(record + 0x18);
    array = *(void ***)record;
    return_offset = start - return_offset;
    return_offset <<= 2;
    return (void **)((u32)array + return_offset);
}
