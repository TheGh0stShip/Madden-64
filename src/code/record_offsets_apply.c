#include "types.h"

typedef struct OffsetRecords {
    u32 count;
    u32 values[1];
} OffsetRecords;

typedef struct OffsetRecordOwner {
    u8 pad[0x18];
    OffsetRecords* records;
    u32 offset;
} OffsetRecordOwner;

void func_800347B4(OffsetRecordOwner* owner) {
    register u32 i __asm__("$5");
    register u32 offset __asm__("$6");
    register u32* first __asm__("$2");
    register u32 count __asm__("$3");

    first = (u32*)owner->records;
    __asm__("addiu $sp,$sp,-8" : : "r"(first));
    i = 0;
    count = owner->records->count;
    offset = owner->offset;
    first++;
    if (count != 0) {
        register u32* value __asm__("$3");

        __asm__("addu %0,%1,$0" : "=r"(value) : "r"(first));
        do {
            *value += offset;
            i++;
            value++;
        } while (i < owner->records->count);
    }
    __asm__("addiu $sp,$sp,8");
}
