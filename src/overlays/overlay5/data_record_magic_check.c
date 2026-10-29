#include "types.h"

s32 overlay5_data_record_magic_check(u32 *record) {
    return record[0] == 0x4E384D45;
}
