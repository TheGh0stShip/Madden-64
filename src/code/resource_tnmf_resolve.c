#include "types.h"

typedef struct ResourceKey {
    u16 first;
    u16 second;
} ResourceKey;

extern s32 func_800364E4(u16 first, u16 second);
extern void *func_80035D7C(u16 first, u16 second);
extern void func_8000E518(void *resource);

void *resource_tnmf_resolve(ResourceKey *key)
{
    void *resource;

    if (func_800364E4(key->first, key->second) < 0) {
        return func_80035D7C(key->first, key->second);
    }
    resource = func_80035D7C(key->first, key->second);
    if (*(u32 *)resource != 0x544E4D46) {
        goto invalid;
    }
    if (*(u16 *)((u8 *)resource + 6) != 2) {
        goto invalid;
    }
    func_8000E518(resource);
    goto done;
invalid:
    resource = 0;
done:
    return resource;
}
