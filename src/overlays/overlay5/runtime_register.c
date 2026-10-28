#include "types.h"

typedef struct Overlay5RuntimeRegistration {
    u8 pad00[0x1C];
    s32 first;
    s32 second;
} Overlay5RuntimeRegistration;

extern void *FIRST_SYSTEM;
extern void *SECOND_SYSTEM;
Overlay5RuntimeRegistration *func_800DD634(void);
void func_8000D874(void *system, void *object);
void func_8000D834(void *system, void *object);

void overlay5_runtime_register(void *object) {
    Overlay5RuntimeRegistration *registration = func_800DD634();

    registration->first = 0;
    registration->second = 0;
    func_8000D874(FIRST_SYSTEM, object);
    func_8000D834(SECOND_SYSTEM, object);
}
