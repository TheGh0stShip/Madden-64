#include "types.h"

typedef struct ResourceEntry {
    u8 bytes[0xC];
} ResourceEntry;

extern ResourceEntry *D_8007A268;
extern u16 D_8007A26C;
extern s16 D_8007A278;
extern void func_800B7B04(ResourceEntry *entry, void *context);

void resource_table_apply(void *context)
{
    ResourceEntry *entry = D_8007A268;
    s32 index = 0;

    D_8007A278 = 0;
    if (D_8007A26C != 0) {
        do {
            func_800B7B04(entry, context);
            entry++;
        } while ((u8)++index < D_8007A26C);
    }
}
