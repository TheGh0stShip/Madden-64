#include "types.h"

typedef struct ResourcePointerGroup {
    u8 pad[4];
    void* secondary;
    void* primary;
    void** indirect;
} ResourcePointerGroup;

extern void func_80032F3C(s32 pool, void* resource);

void func_8001A8A8(ResourcePointerGroup* group) {
    func_80032F3C(0, group->primary);
    group->primary = 0;
    func_80032F3C(0, group->secondary);
    group->secondary = 0;
    func_80032F3C(0, *group->indirect);
    *group->indirect = 0;
    func_80032F3C(0, group->indirect);
    group->indirect = 0;
}
