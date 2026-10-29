#include "types.h"

typedef struct RuntimeDispatchState {
    u8 pad00[0x98];
    void *resource;
} RuntimeDispatchState;

extern RuntimeDispatchState *D_80072380;

void func_800E0C60(void *context, void *resource);
void func_800E0BB4(void *context);

void overlay5_runtime_optional_resource_dispatch(void *context) {
    void *resource;

    resource = D_80072380->resource;
    if (resource != 0) {
        func_800E0C60(context, resource);
    } else {
        func_800E0BB4(context);
    }
}
