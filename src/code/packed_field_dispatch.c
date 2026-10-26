#include "types.h"

extern s32 func_8002BE5C(void *record, s16 index);
extern s32 packed_field_primary_get(void *record, s16 index);
extern s32 packed_field_secondary_get(void *record, s16 index);
extern s32 func_8002C03C(void *record, s16 index);

s16 packed_field_dispatch(void *record, u32 index_arg)
{
    s32 type = *(u32 *)record >> 30;
    s32 result;

    if (type == 1) {
        goto primary;
    }
    if (type < 2) {
        if (type == 0) {
            goto base;
        }
        goto zero;
    }
    if (type == 2) {
        goto secondary;
    }
    if (type == 3) {
        goto tertiary;
    }
    goto zero;
base:
    result = func_8002BE5C(record, (s16)index_arg);
    goto extend;
primary:
    result = packed_field_primary_get(record, (s16)index_arg);
    goto extend;
secondary:
    result = packed_field_secondary_get(record, (s16)index_arg);
    goto extend;
tertiary:
    result = func_8002C03C(record, (s16)index_arg);
extend:
    return (s16)result;
zero:
    return 0;
}
