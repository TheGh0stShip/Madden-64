#include "types.h"

typedef struct UiContext {
    void *data;
    u32 first;
    u32 second;
    u32 third;
} UiContext;

typedef struct UiData {
    u32 words[32];
} UiData;

extern UiData D_8007947C;
extern u32 D_800692AC;
extern volatile u32 D_80069298;
extern volatile u32 D_8006929C;
extern void *func_80032E00(s32 pool, u32 size);

UiContext *ui_context_clone(void)
{
    volatile UiContext *context;
    UiData *data;
    u32 third;

    context = func_80032E00(0, sizeof(UiContext));
    data = func_80032E00(0, sizeof(UiData));
    context->data = data;
    *data = D_8007947C;
    context->first = D_800692AC;
    context->second = D_80069298;
    third = D_8006929C;
    D_800692AC = 0;
    context->third = third;
    return (UiContext *)context;
}
