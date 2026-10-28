#include "types.h"

void *func_800D060C(void);
void func_800D1094(void *object);
void func_800D192C(void *object);

void overlay5_object_initialize_chain(void) {
    void *object = func_800D060C();

    func_800D1094(object);
    func_800D192C(object);
}
