#include "types.h"

typedef struct {
    s32 items[3];
    void* unkC;
    void* unk10;
    s32 unk14;
    s32 unk18;
} Request;

typedef struct {
    s32 kind;
    void* handles[2];
} Query;

typedef struct {
    s32 count;
    s32 items[3];
} Result;

extern u8* D_800895EC;
extern u8 D_800C337C[];
extern u8 D_800C33A4[];
extern u8 D_800C32D0[];

extern void func_800D67B8(Request*);
extern void func_800945D8(u8 value, void* result);
extern void func_8003DDF8(u8*, Query*, Result*, s32, s32);
extern s32 func_800D6454(Request*);
extern void func_8003E23C(Result*);

s16 func_800BB0F4(Request* req) {
    Query query;
    Result result;
    u8 handle[16];
    s16 i;
    s32* items;
    s32 ret;

    func_800D67B8(req);
    query.kind = 2;
    result.count = 3;
    query.handles[0] = D_800895EC + 0x3E;
    func_800945D8(D_800895EC[0x5A], handle);
    query.handles[1] = handle;
    func_8003DDF8(D_800C337C, &query, &result, 0x9B, 0);
    items = result.items;
    for (i = 0; i < 3; i++) {
        req->items[i] = (&result.items[0])[i];
    }
    req->unkC = D_800C33A4;
    req->unk10 = D_800C32D0;
    req->unk18 = 1;
    ret = func_800D6454(req);
    func_8003E23C(&result);
    return ret;
}
