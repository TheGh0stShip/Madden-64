#include "types.h"

typedef struct {
    u8 count;
    u8 ids[30];
    u8 slots[30];
} Team;

typedef struct {
    u8 d[110];
} Rec110;

typedef struct {
    u8 d[256];
} Blk256;

typedef struct {
    u8 d[55];
} Rec55;

typedef struct {
    Rec110 a[30];
    Blk256 mid;
    Rec55 b[30];
} SaveBuf;

extern u8 D_800014A4[];

s32 func_8003C75C(void);
void func_8003A600(s32, s32);
void *func_80032E00(s32, s32);
void func_80032F3C(s32, void *);
void func_800E2068(void *, void *, s32);
void func_800E2190(void *, void *, s32);

void func_8008F3DC(Team *team) {
    SaveBuf *src;
    SaveBuf *dst;
    u32 i;

    if (func_8003C75C() != 0) {
        func_8003A600(0, 1);
    }
    src = func_80032E00(0, 0x1456);
    dst = func_80032E00(0, 0x1456);
    func_800E2068(D_800014A4, src, 1);
    for (i = 0; i < team->count; i++) {
        void *p;
        void *r;
        r = &src->a[team->slots[i]];
        p = &dst->a[i];
        *(Rec110 *)p = *(Rec110 *)r;
        r = &src->b[team->slots[i]];
        p = &dst->b[i];
        *(Rec55 *)p = *(Rec55 *)r;
    }
    dst->mid = src->mid;
    func_800E2190(D_800014A4, dst, 1);
    func_80032F3C(0, src);
    func_80032F3C(0, dst);
    func_8003A600(1, 1);
}
