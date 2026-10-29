#include "types.h"

typedef struct Overlay5IndexedResourceState {
    u8 pad00[0x64];
    void **resources;
} Overlay5IndexedResourceState;

extern Overlay5IndexedResourceState *D_80072380;
extern void *D_8008931C;

void func_8000D834(void *system, void *resource);

void overlay5_indexed_resource_release(u8 index) {
    func_8000D834(D_8008931C, D_80072380->resources[index + 1]);
    D_80072380->resources[index + 1] = 0;
}
