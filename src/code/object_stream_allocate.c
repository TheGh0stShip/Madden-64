#include "types.h"

typedef struct JpegError {
    void (*error_exit)(void *);
    u8 pad04[0x10];
    s32 msg_code;
    s32 msg_parm_i[8];
} JpegError;

typedef struct JpegCommon {
    JpegError *err;
    u8 *mem;
} JpegCommon;

extern void func_800635A0(void *object, s32 code);
extern u8 *func_80064970(void *object, s32 size);

u8 *func_800637A4(u8 *object_arg, s32 mode_arg, u32 size_arg)
{
    u8 *object;
    u8 *container;
    u8 *block;
    u32 size;
    s32 mode;
    u32 limit;
    u32 remainder;
    u32 rounded;
    u8 *slot;
    u8 *old;

    object = object_arg;
    size = size_arg;
    container = *(u8 **)(object + 4);
    limit = 0x3B9AC9F0U;
    mode = mode_arg;
    if (limit < size) {
        func_800635A0(object_arg, 3);
    }

    remainder = size & 7;
    if (remainder != 0) {
        rounded = size + 8;
        size = rounded - remainder;
    }

    if ((u32)mode >= 2U) {
        JpegCommon *cinfo = (JpegCommon *)object;
        cinfo->err->msg_code = 0xC;
        cinfo->err->msg_parm_i[0] = mode;
        (*cinfo->err->error_exit)(object);
    }

    block = func_80064970(object, size + 0x10);
    if (block == 0) {
        func_800635A0(object, 4);
    }

    *(u32 *)(container + 0x48) += size + 0x10;
    slot = (u8 *)(((u32)mode << 2) + (u32)container);
    old = *(u8 **)(slot + 0x38);
    *(u32 *)(block + 4) = size;
    *(u32 *)(block + 8) = 0;
    *(u8 **)block = old;
    *(u8 **)(slot + 0x38) = block;
    return block + 0x10;
}
