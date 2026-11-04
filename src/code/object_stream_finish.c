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
extern void PROCESS(void *, void *, s32);
extern void func_800632F4(void *, s32);

void **FUNCTION(u8 *object, u8 *record, u32 start, u32 count, s32 strict)
{
    u32 end, cursor, progress, base, return_offset;
    s32 stride, position;
    void **array;
    u8 *inner_v1;
    u8 *inner_v0;
#if SCALE_SHIFT
    u32 raw_stride;
#endif
    end = start + count;
    if (*(u32 *)(record + 4) < end || *(u32 *)(record + 0xC) < count) goto invalid_request;
    if (*(void **)record == 0) {
invalid_request:
        inner_v1 = *(u8 **)object;
        *(s32 *)(inner_v1 + 0x14) = 0x14;
        inner_v0 = *(u8 **)object;
        (*(void (**)(void *))inner_v0)(object);
    }
    if (start < *(u32 *)(record + 0x18) || *(u32 *)(record + 0x18) + *(u32 *)(record + 0x10) < end) {
        if (*(s32 *)(record + 0x28) == 0) {
            inner_v1 = *(u8 **)object; *(s32 *)(inner_v1 + 0x14) = 0x44;
            inner_v0 = *(u8 **)object; (*(void (**)(void *))inner_v0)(object);
        }
        if (*(s32 *)(record + 0x24) != 0) { PROCESS(object, record, 1); *(s32 *)(record + 0x24) = 0; }
        if (*(u32 *)(record + 0x18) < start) *(u32 *)(record + 0x18) = start;
        else { position = *(s32 *)(record + 0x10); position = (s32)end - position; if (position < 0) position = 0; *(s32 *)(record + 0x18) = position; }
        PROCESS(object, record, 0);
    }
    progress = *(u32 *)(record + 0x1C);
    if (progress < end) {
        if (progress < start) {
            if (strict != 0) { inner_v1 = *(u8 **)object; *(s32 *)(inner_v1 + 0x14) = 0x14; inner_v0 = *(u8 **)object; (*(void (**)(void *))inner_v0)(object); }
            cursor = start;
        } else cursor = progress;
        if (strict != 0) *(u32 *)(record + 0x1C) = end;
        if (*(s32 *)(record + 0x20) != 0) {
            base = *(u32 *)(record + 0x18);
#if SCALE_SHIFT
            raw_stride = *(u32 *)(record + 8); stride = raw_stride << SCALE_SHIFT;
#else
            stride = *(u32 *)(record + 8);
#endif
            cursor -= base; end -= base;
            while (cursor < end) { func_800632F4((*(void ***)record)[cursor], stride); cursor++; }
        } else if (strict == 0) { inner_v1 = *(u8 **)object; *(s32 *)(inner_v1 + 0x14) = 0x14; inner_v0 = *(u8 **)object; (*(void (**)(void *))inner_v0)(object); }
    }
    if (strict != 0) *(s32 *)(record + 0x24) = 1;
    return_offset = *(u32 *)(record + 0x18); array = *(void ***)record;
    return_offset = start - return_offset; return_offset <<= 2;
    return (void **)((u32)array + return_offset);
}
