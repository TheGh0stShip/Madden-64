#include "types.h"

typedef struct {
    void *unk_00;
    void *unk_04;
    void **(*alloc_sarray)(void *, s32, u32, u32);
} DecodeMemory;

typedef struct {
    void *err;
    DecodeMemory *mem;
    u8 pad08[0x70 - 0x8];
    u32 output_width;
    u32 output_height;
    s32 unk_78;
    s32 output_components;
    u8 pad80[0x8C - 0x80];
    u32 output_scanline;
    u8 pad90[0x1D0 - 0x90];
} DecodeInfo;

typedef struct {
    u8 pad00[0x84];
} DecodeError;

typedef struct {
    u8 pad00[0x4];
    u16 *pixels;
    s32 unk_08;
    u8 pad0C[0x1E - 0xC];
    s16 width;
    u8 pad20[0x30 - 0x20];
    s32 flags;
} DecodeTexture;

void *func_80063530(DecodeError *);
void func_80054DB0(DecodeInfo *, s32, s32);
void driver_callbacks_initialize(DecodeInfo *, s32);
void object_action_update(DecodeInfo *, s32);
void func_80054768(DecodeInfo *);
void *memory_pool_range_take(s32, s32);
void func_800549E8(DecodeInfo *, void **, s32);
void rgb5551_pack_many(u16 *, void *, s16);
void func_80055444(DecodeInfo *);
void func_80054ED0(DecodeInfo *);
void func_80017840(DecodeTexture *, u16, u16, s16, s16, s16, s32);

void resource_archive_decode(DecodeTexture *texture, u16 arg1, s16 arg2, u16 arg3, s32 arg4, s32 source,
                             u16 *buffer) {
    DecodeInfo info;
    DecodeError error;
    void **rows;
    u16 *pixels;
    u16 *dst;
    u16 width;
    u16 height;

    info.err = func_80063530(&error);
    func_80054DB0(&info, 0x3D, 0x1D0);
    driver_callbacks_initialize(&info, source);
    object_action_update(&info, 1);
    func_80054768(&info);
    rows = info.mem->alloc_sarray(&info, 1, info.output_width * info.output_components, 1);
    if (texture->flags & 0x80) {
        pixels = buffer;
    } else {
        pixels = memory_pool_range_take(0, info.output_width * info.output_height * 2);
    }
    dst = pixels;
    width = info.output_width;
    height = info.output_height;
    while (info.output_scanline < info.output_height) {
        func_800549E8(&info, rows, 1);
        rgb5551_pack_many(dst, rows[0], width);
        dst += (s16) width;
    }
    func_80055444(&info);
    func_80054ED0(&info);
    func_80017840(texture, width, height, arg2, arg3, arg1, 0x10);
    while (width & 3) {
        width++;
    }
    texture->width = width;
    texture->pixels = pixels;
    texture->unk_08 = 0;
}
