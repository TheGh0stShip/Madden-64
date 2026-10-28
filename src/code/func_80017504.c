#include "types.h"

typedef struct BuiltResource {
    u8 pad0[4];
    void *field04;
    void *field08;
    u8 pad0C[0x12];
    u16 size;
    u8 pad20[0x1C];
    u16 field3C;
} BuiltResource;

typedef struct LookupEntry { u8 bytes[0xD8]; } LookupEntry;
extern LookupEntry D_80088C48[];
extern s16 func_80016A24(s16, void *);
extern s32 func_80016BB0(s16, void *);
extern void *func_800160C4(s16, s16 *, void *, s32);
extern void *func_80017840(BuiltResource *, u16, u16, s16, s16, s16, s32);

void func_80017504(BuiltResource *output, s32 second, s32 third, s32 fourth,
                   s32 unused, s32 fifth, void *context)
{
    s16 pair[2];
    s32 raw_key = fifth;
    s16 key;
    s16 table_index;
    s16 size;
    s32 other;
    void *result;

    pair[0] = 0;
    pair[1] = 0;
    key = raw_key;
    table_index = raw_key;
    size = func_80016A24(key, context);
    other = func_80016BB0(key, context);
    result = func_800160C4(key, pair, context, 2);
    func_80017840(output, (u16)size, (u16)other, (s16)third,
                  (s16)fourth, (s16)second, 4);
    if (size & 0xF) {
        do {
            size++;
        } while (size & 0xF);
    }
    output->size = size;
    output->field04 = result;
    {
        s32 signed_index = (s16)table_index;
        output->field08 = *(void **)&D_80088C48[signed_index];
    }
    output->field3C = 0;
}
