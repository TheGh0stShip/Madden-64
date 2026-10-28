#include "types.h"

extern void *FIRST_SYSTEM;
extern void *SECOND_SYSTEM;
void func_8000D874(void *system, void *object);
void func_8000D834(void *system, void *object);

void overlay5_dual_system_register(void *object) {
    func_8000D874(FIRST_SYSTEM, object);
    func_8000D834(SECOND_SYSTEM, object);
}
