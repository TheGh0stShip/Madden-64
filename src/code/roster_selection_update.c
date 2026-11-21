#include "types.h"

typedef struct AudioFrameSmallRecord {
    u8 bytes[40];
} AudioFrameSmallRecord;

extern AudioFrameSmallRecord *D_80073430;
extern AudioFrameSmallRecord *D_8007343C;
extern AudioFrameSmallRecord D_8007A508;
extern u8 D_8006D2B4[];
extern u16 D_8008AF9C;
extern void func_80033308(s32, void *, s32, s32);
extern void func_8002E65C(void *, void *);
extern void func_800372B4(u16 index, u8 *destination);

AudioFrameSmallRecord *roster_selection_update(u16 index)
{
    AudioFrameSmallRecord *source;


    if (index == 0x1F3F) {
        func_80033308(0, &D_8007A508, 40, 0);
        func_8002E65C(&D_8007A508, D_8006D2B4);
        D_8007A508.bytes[16] = 0x48;
        D_8007A508.bytes[15] = 0x37;
    } else if (D_8008AF9C == 0) {
        source = &D_80073430[index];
        D_8007A508 = *source;
    } else {

        if (index & 0x8000) {
            source = &D_8007343C[index % 0x8000];
        } else {
            source = &D_80073430[index];
        }
        D_8007A508 = *source;
        func_800372B4(index, &D_8007A508.bytes[14]);
    }
    return &D_8007A508;
}
