#include "types.h"

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 r;
    u8 g;
    u8 b;
    u8 a;
} Vertex;

typedef struct {
    u8 unk_00[0x10];
    u16 unk_10;
    u8 unk_12[0x0A];
    s16 unk_1C;
    u16 unk_1E;
    u8 unk_20[0x10];
    s32 unk_30;
    u8 unk_34[0x0C];
    Vertex *unk_40;
    Vertex *unk_44;
} ArchiveImage;

typedef struct {
    u8 unk_00[8];
    ArchiveImage *unk_08;
} Archive;

extern u16 D_80064AB0[];
extern Vertex *memory_pool_range_take(s32 pool, s32 size);
extern void func_80033308(s32 pool, void *addr, s32 size, s32 arg3);

void resource_archive_commit(Archive *archive, s32 alpha)
{
    ArchiveImage *image = archive->unk_08;
    Vertex *v;
    s32 rows;
    s32 count;
    s32 size;
    s16 width;

    if (image->unk_40 == 0) {
        width = image->unk_1E;
        rows = 0x800 / width;
        image->unk_30 |= 0x8000;
        if (D_80064AB0[width >> 3] < rows) {
            rows = D_80064AB0[width >> 3];
        }
        count = image->unk_1C / rows + 1;
        count += image->unk_1C % rows != 0;
        count *= 2;
        size = count << 5;
        image->unk_40 = memory_pool_range_take(0, size);
        image->unk_44 = image->unk_40 + count;
        func_80033308(0, image->unk_40, size, 0);
        image->unk_10 = count;
    }
    count = image->unk_10;
    v = image->unk_40;
    while (count--) {
        v[0].a = alpha;
        v[1].a = alpha;
        v[0].r = v[0].g = v[0].b = 0xFF;
        v[1].r = v[1].g = v[1].b = 0xFF;
        v += 2;
    }
}
