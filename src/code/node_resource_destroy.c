#include "types.h"

typedef void (*NodeDestroyCallback)(void *node);

extern u8 *D_800782FC;
extern void **D_800782F8;
extern void *D_800782F4;
extern void func_8000BE80(void *node);
extern void func_800332C8(void *pool, void *value);

void node_resource_destroy(u8 *node)
{
    register u8 *saved_node __asm__("$16") = node;
    u32 index;
    u8 *entry;
    NodeDestroyCallback callback;

    func_8000BE80(saved_node);
    index = *(u16 *)(saved_node + 0x54);
    entry = D_800782FC + index * 24;
    callback = *(NodeDestroyCallback *)(entry + 0x14);
    callback(saved_node);
    {
        register u32 second_index __asm__("$2") = *(u16 *)(saved_node + 0x54);

        func_800332C8(D_800782F8[second_index], *(void **)(saved_node + 8));
    }
    {
        void *pool = D_800782F4;
        register u8 *argument __asm__("$5") = saved_node;

        *(void **)(argument + 8) = 0;
        func_800332C8(pool, argument);
    }
}
