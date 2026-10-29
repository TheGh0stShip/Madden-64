#include "types.h"

typedef struct Overlay5ResourceRequest {
    s16 kind;
    u8 pad02[2];
    void *resource;
    s32 flags;
    u8 pad0C[4];
    s16 value;
} Overlay5ResourceRequest;

typedef struct Overlay5ResourceState {
    u8 pad00[0x74];
    void *owner;
    u8 pad78[0x28];
    void *request;
} Overlay5ResourceState;

extern Overlay5ResourceState *D_80072380;

void *func_8000D740(void *owner, s32 mode, Overlay5ResourceRequest *request);

void overlay5_resource_request_create(
    s16 kind,
    void *resource,
    s16 value
) {
    Overlay5ResourceRequest request;

    request.kind = kind;
    request.resource = resource;
    request.flags = 0;
    request.value = value;
    D_80072380->request = func_8000D740(D_80072380->owner, 1, &request);
}
