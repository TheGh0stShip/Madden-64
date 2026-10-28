#include "types.h"

typedef struct {
    s16 kind;
    s16 id;
    s32 handle;
} Track;

typedef struct {
    s16 id;
    s32 data;
    s32 unk08;
    s32 unk0C;
    s16 param;
    s16 unk12;
    s32 unk14;
} TrackRequest;

extern Track D_80086DE8[];
extern s32 D_80087AA8;

s32 func_8000D740(s32, s32, TrackRequest *);

s16 func_800B3250(s16 id, s32 data, s16 param) {
    TrackRequest request;
    s16 i;

    i = 0;
    request.id = id;
    request.data = data;
    request.unk08 = 0;
    request.param = param;
    while (D_80086DE8[i].id != -1) {
        i++;
    }
    D_80086DE8[i].handle = func_8000D740(D_80087AA8, 1, &request);
    D_80086DE8[i].kind = 3;
    D_80086DE8[i].id = id;
    return i;
}
