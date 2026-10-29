#include "types.h"

typedef struct {
    s32 items[3];
    void *unkC;
    void *unk10;
    s32 unk14;
    s32 unk18;
} Request;

typedef struct {
    s32 kind;
    s32 handle;
} Query;

typedef struct {
    s32 count;
    s32 items[3];
} Result;

extern u8 D_800C32F4[];
extern u8 D_800C3150[];
extern u8 D_800C3154[];

void func_800D67B8(Request *);
s32 func_80022A3C(s32, u16);
void func_8003DDF8(u8 *, Query *, Result *, s32, s32);
s32 func_800D6454(Request *);
void func_8003E23C(Result *);

s16 func_800B0ABC(Request *req, u16 team) {
    Query query;
    Result result;
    s16 i;
    s32 *items;
    s32 ret;

    func_800D67B8(req);
    query.kind = 1;
    result.count = 3;
    query.handle = func_80022A3C(0, team);
    func_8003DDF8(D_800C32F4, &query, &result, 0x96, 0);
    items = result.items;
    for (i = 0; i < 3; i++) {
        req->items[i] = (&result.items[0])[i];
    }
    req->unkC = D_800C3150;
    req->unk10 = D_800C3154;
    req->unk18 = 1;
    ret = func_800D6454(req);
    func_8003E23C(&result);
    return ret;
}
