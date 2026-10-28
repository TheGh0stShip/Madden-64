#include "types.h"

typedef struct Overlay5ResourceBundle {
    void *first;
    void *second;
    void *handle;
    u8 pad0C[4];
    void *runtime;
} Overlay5ResourceBundle;

extern void *FIRST_SYSTEM;
extern void *SECOND_SYSTEM;
void func_800D6010(void *runtime);
void func_800E078C(void *resource);
void func_8000D874(void *system, void *handle);
void func_8000D834(void *system, void *handle);

void overlay5_resource_bundle_release(Overlay5ResourceBundle *bundle) {
    func_800D6010(bundle->runtime);
    func_800E078C(bundle->first);
    func_8000D874(FIRST_SYSTEM, bundle->handle);
    func_8000D834(SECOND_SYSTEM, bundle->handle);
    if (bundle->second != 0) {
        func_800E078C(bundle->second);
    }
}
