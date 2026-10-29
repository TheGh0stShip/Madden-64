#include "types.h"

typedef struct Overlay5CallbackNested {
    u8 pad00[0xC];
    void *argument;
} Overlay5CallbackNested;

typedef struct Overlay5CallbackResource Overlay5CallbackResource;
typedef void (*Overlay5ResourceCallback)(
    Overlay5CallbackResource *resource,
    void *nested_argument,
    u8 kind,
    void *argument
);

struct Overlay5CallbackResource {
    u8 pad00[0xC];
    Overlay5CallbackNested *nested;
    u8 pad10[8];
    Overlay5ResourceCallback callback;
    u8 pad1C[0xD];
    u8 kind;
    u8 pad2A[0x3A];
    void *argument;
};

typedef struct Overlay5CallbackOwner {
    u8 pad00[0xC];
    Overlay5CallbackResource *resource;
} Overlay5CallbackOwner;

void overlay5_resource_callback_configure(
    Overlay5CallbackOwner *owner,
    Overlay5ResourceCallback callback,
    void *argument,
    u8 invoke
) {
    Overlay5CallbackResource *resource;

    resource = owner->resource;
    resource->callback = callback;
    resource->argument = argument;
    if (invoke == 1) {
        resource->callback(
            resource,
            resource->nested->argument,
            resource->kind,
            argument
        );
    }
}
