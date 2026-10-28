#include "types.h"

typedef struct Overlay5ResourceRuntime {
    void **entries;
    void *current;
    void *resource;
    u8 pad0C[4];
    u8 state;
    u8 pad11;
    s8 count;
} Overlay5ResourceRuntime;

extern Overlay5ResourceRuntime *RUNTIME;
extern void *MODE;
extern u8 SPECIAL_RESOURCE;
extern u8 EXPECTED_MODE;
void func_80011AF4(void);
void func_80011B3C(void);
void func_800DE074(void);

void overlay5_resource_enqueue(void *resource) {
    Overlay5ResourceRuntime *runtime;
    Overlay5ResourceRuntime *current_runtime;
    s8 index;

    if (resource == &SPECIAL_RESOURCE) {
        func_80011AF4();
    } else if (MODE != &EXPECTED_MODE) {
        func_80011B3C();
    }

    runtime = RUNTIME;
    index = runtime->count;
    runtime->resource = resource;
    index++;
    runtime->count = index;
    current_runtime = RUNTIME;
    runtime->entries[index] = current_runtime->current;
    current_runtime->state = 4;
    func_800DE074();
}
