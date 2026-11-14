#include "types.h"

typedef struct BuildDescriptor {
    u32 value;
    s16 mode;
    s16 field06;
    s16 field08;
    u8 pad0A[2];
    u32 count;
    u32 field10;
    u32 field14;
    void *source;
    u8 pad1C[8];
} BuildDescriptor;

typedef struct ParentRecord {
    u32 pad00[2];
    void *source;
} ParentRecord;

extern u8 D_80080C90;
extern void *D_80082DC8;
extern u8 D_80071A28[];

extern void *func_8000D8DC(void *, BuildDescriptor *);
extern void func_80016FE4(void *);

void roster_record_update(void)
{
    BuildDescriptor descriptor;
    s16 team = 0;

    *(volatile u32 *)&descriptor.count = 0;
    descriptor.mode = 3;
    descriptor.field06 = 0;
    descriptor.field08 = 0;
    descriptor.field10 = 0;
    do {
        s32 team_offset = team * 8524;
        u32 value;
        void *record;

        descriptor.count = 0;
        descriptor.source = 0;
        value = *(u8 *)(team_offset + (u32)&D_80080C90);
        descriptor.value = value + 2;
        record = func_8000D8DC(0, &descriptor);
        *(void **)(team_offset + (u32)&D_80082DC8) = record;
        func_80016FE4(record);

        value += 0x88;
        descriptor.count = 8;
        {
            void *zero = 0;
            const ParentRecord *parent = *(ParentRecord **)(team_offset + (u32)&D_80082DC8);
            descriptor.source = parent->source;
            descriptor.value = value;
            record = func_8000D8DC(zero, &descriptor);
        }
        *(void **)(team_offset + (u32)&D_80082DC8 + 4) = record;
        func_80016FE4(record);

        descriptor.value = 1;
        record = func_8000D8DC(0, &descriptor);
        *(void **)(team_offset + (u32)&D_80082DC8 + 12) = record;
        func_80016FE4(record);

        descriptor.value = D_80071A28[
            *(u8 *)(team_offset + (u32)&D_80080C90)];
        record = func_8000D8DC(0, &descriptor);
        *(void **)(team_offset + (u32)&D_80082DC8 + 8) = record;
        func_80016FE4(record);

        team++;
    } while (team < 2);
}
