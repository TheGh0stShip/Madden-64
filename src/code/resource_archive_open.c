#include "types.h"

typedef struct ArchiveInfo {
    u8 pad00[0xC];
    u16 width;
    u16 height;
    u8 pad10[8];
    s32 unk_18;
} ArchiveInfo;

typedef struct ArchiveHeader {
    u8 flags;
    u8 *pixels;
    u8 *palette;
    ArchiveInfo *info;
    s32 unk_10;
} ArchiveHeader;

typedef struct BuiltResource {
    u8 pad0[4];
    void *field04;
    u16 *field08;
    u8 pad0C[0x12];
    u16 size;
    void *unk_20;
    void *unk_24;
    ArchiveHeader *header;
    u8 pad2C[0xC];
    s16 unk_38;
    u8 pad3A[2];
    u16 field3C;
    s16 unk_3E;
} BuiltResource;

typedef struct ArchiveShared {
    u8 pad00[8];
    u16 *field08;
} ArchiveShared;

typedef struct ArchiveFlags {
    s32 flags;
} ArchiveFlags;

extern u16 D_80085BF8;
extern void *func_80017840(BuiltResource *, s32, u16, s16, s16, s16, s32);
extern s32 func_80035598(u16, s32);
extern void func_80036268(u16, s32, void *);
extern void memory_move_overlap(void *, void *, s32);
extern void *memory_pool_prepare(u16, s32);
extern void *memory_pool_range_take(s32 pool, u32 size);
extern void resource_node_process(void *, s32, ArchiveHeader *);

void resource_archive_open(BuiltResource *res, s32 data, s16 arg2, s16 arg3, s16 arg4, s32 arg5, ArchiveShared *shared, void *buffer) {
    s32 flags;
    u16 height;
    s16 count;
    u16 i;
    u16 *dst;
    u8 *src;
    u8 r, g, b;
    u16 a;
    s32 type;

    res->unk_38 = 0;
    res->unk_20 = 0;
    res->unk_24 = 0;
    res->header = memory_pool_range_take(0, 0x14);
    count = 0x100;
    flags = arg5;
    if (arg5 & 0x2000) {
        res->unk_20 = (void *)data;
    } else if ((type = arg5) & 0x200) {
        res->unk_20 = memory_pool_range_take(0, func_80035598(D_80085BF8, data) + 0x800);
        res->unk_24 = memory_pool_range_take(0, func_80035598(D_80085BF8, data) + 0x800);
        func_80036268(D_80085BF8, data, res->unk_20);
        func_80036268(D_80085BF8, data + 1, res->unk_24);
    } else {
        res->unk_20 = memory_pool_prepare(D_80085BF8, data);
    }
    resource_node_process(res->unk_20, func_80035598(D_80085BF8, data), res->header);
    res->unk_3E = 0;
    if (!(flags & 0x200)) {
        res->header->info->unk_18 = data + 1;
    } else {
        res->header->info->unk_18 = data + 2;
    }
    data = res->header->info->width;
    height = res->header->info->height;
    res->size = data;
    func_80017840(res, data, height, arg3, arg4, arg2, 8);
    if (flags & 0x80) {
        res->field04 = buffer;
    } else {
        res->field04 = memory_pool_range_take(0, (s16)data * (s16)height);
    }
    if (flags & 8) {
        res->field08 = shared->field08;
    } else {
        res->field08 = memory_pool_range_take(0, count * 2);
    }
    type = arg5;
    type = res->header->flags;
    if (type & 2) {
        memory_move_overlap(res->field04, res->header->pixels, (s16)data * (s16)height);
    }
    if (type & 4) {
        src = res->header->palette;
        dst = res->field08;
        for (i = 0; i < count; i++) {
            r = *src++;
            g = *src++;
            b = *src++;
            a = i != 0;
            dst[i] = a | (((r >> 3) << 11) | ((g >> 3) << 6) | ((b >> 3) << 1));
        }
    }
}
