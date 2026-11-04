#include "types.h"

typedef struct ConfigDF868 {
    u8 pad00[4];
    void *field04;
    u8 pad08;
    u8 start;
    u8 pad0A;
    u8 split;
} ConfigDF868;

typedef struct StateDF868 {
    u8 pad00[4];
    ConfigDF868 *config;
    u8 pad08[0x6A];
    u8 flags72;
    u8 count73;
    void **items74;
    void *field78;
    s16 base7C;
} StateDF868;

typedef struct RequestDF868 {
    s16 type;
    u8 pad02[2];
    s32 field04;
    s32 field08;
    u8 pad0C[4];
    s16 field10;
} RequestDF868;

typedef struct ResultDF868 {
    s32 field00;
    s32 value;
    u8 pad08[8];
} ResultDF868;

typedef struct ItemDF868 {
    u8 pad00[0x20];
    s32 value20;
} ItemDF868;

typedef struct OwnerDF868 {
    u8 pad00[0xC];
    StateDF868 *state;
} OwnerDF868;

extern void *D_80087A64;
extern u8 D_800E0024;

extern void *func_80032E00(s32 pool, s32 size);
extern ItemDF868 *func_8000D740(void *owner, s32 count, RequestDF868 *request);
extern void func_8000DC08(ItemDF868 *item);
extern void func_8000DC18(ItemDF868 *item);
extern void func_8001F070(void *object, s32 index, ResultDF868 *result);
extern void *func_8002FEA4(void *type, s32 count, s32 zero);

void func_800DF868(OwnerDF868 *owner, u8 count, s16 type) {
    StateDF868 *state;
    RequestDF868 request;
    ResultDF868 result;
    u8 i;
    u8 failed;

    state = owner->state;
    state->count73 = count;
    state->items74 = func_80032E00(0, count * 4);
    request.type = type;
    request.field04 = 0;
    request.field08 = 0;
    request.field10 = 8;
    failed = 0;
    for (i = 0; i < state->count73; i++) {
        state->items74[i] = func_8000D740(D_80087A64, 1, &request);
        if (i < state->config->split) {
            func_8000DC08(state->items74[i]);
        } else {
            func_8000DC18(state->items74[i]);
        }
        result.value = 0xFFFF;
        func_8001F070(state->config->field04, state->config->start + i, &result);
        if (result.value == 0xFFFF) {
            failed = 1;
        } else {
            ((ItemDF868 *)state->items74[i])->value20 = result.value - state->base7C;
        }
    }
    if (failed == 1) {
        state->field78 = func_8002FEA4(&D_800E0024, 2, 0);
        *(StateDF868 **)((u8 *)state->field78 + 8) = state;
        state->flags72 |= 1;
    }
}
