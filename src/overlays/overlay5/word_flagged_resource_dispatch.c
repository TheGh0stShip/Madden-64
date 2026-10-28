#include "types.h"

extern s32 FLAG;
extern u8 RESOURCE;
void func_800DD514(void *resource);

#ifndef FLAG_VALUE
#define FLAG_VALUE 1
#endif

s32 overlay5_word_flagged_resource_dispatch(void) {
    FLAG = FLAG_VALUE;
    func_800DD514(&RESOURCE);
    return 25;
}
