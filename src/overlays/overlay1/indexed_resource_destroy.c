#include "types.h"

typedef struct IndexedResource {
    u8 pad00[4];
    void *pool;
} IndexedResource;

extern IndexedResource **D_80087958;
extern void *D_8008B06C;
extern void func_80032F3C(s32 value, void *pool);
extern void func_800332C8(void *owner, IndexedResource *resource);

void indexed_resource_destroy(u16 index)
{
    u32 offset = index * 4;
    IndexedResource *resource = *(IndexedResource **)(offset + (u32)D_80087958);

    func_80032F3C(0, resource->pool);
    resource = *(IndexedResource **)(offset + (u32)D_80087958);
    func_800332C8(D_8008B06C, resource);
    offset += (u32)D_80087958;
    *(IndexedResource **)offset = 0;
}
