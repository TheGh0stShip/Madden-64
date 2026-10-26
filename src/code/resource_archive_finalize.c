#include "types.h"

#define M2C_UNK s32
#define M2C_FIELD(x, type, offset) (*(type)((u8 *)(x) + (offset)))

M2C_UNK func_80017000(void *, s16, s16);
M2C_UNK func_80017030(void *, s32, s16, u16, s32, s32, s32, void *, s32, s32);
M2C_UNK func_80017504(void *, s16, s16, s16, s32, s32, s32);
M2C_UNK func_80017880(void *, s32, s16, s16, s32, s32, void *, s32);
M2C_UNK func_8002E17C(void *, void *, M2C_UNK);
M2C_UNK func_80033308(M2C_UNK, void *, M2C_UNK, M2C_UNK);

void resource_archive_finalize(void *arg0, void *arg1)
{
    s16 temp_a1;
    s32 temp_v1;
    void *temp_s0;
    void *temp_s3;

    temp_s3 = M2C_FIELD(arg0, void **, 8);
    func_80033308(0, temp_s3, 0x48, 0);
    M2C_FIELD(arg0, s32 *, 0x14) = 1;
    M2C_FIELD(arg0, s32 *, 0x18) = 0;
    M2C_FIELD(arg0, s32 *, 0x24) = 0;
    M2C_FIELD(arg0, s32 *, 0x20) = 0;
    M2C_FIELD(arg0, s32 *, 0x1C) = 0;
    M2C_FIELD(arg0, s32 *, 0x34) = 0;
    M2C_FIELD(arg0, s32 *, 0x30) = 0;
    M2C_FIELD(arg0, s32 *, 0x2C) = 0;
    M2C_FIELD(temp_s3, s32 *, 0x30) = (s32)M2C_FIELD(arg1, s32 *, 0xC);
    if (!(M2C_FIELD(arg1, s32 *, 0xC) & 0x20)) {
        goto block_3;
    }
    temp_s0 = M2C_FIELD(M2C_FIELD(arg1, void **, 0x14), void **, 8);
    func_8002E17C(temp_s3, temp_s0, 0x48);
    M2C_FIELD(temp_s0, void **, 0x34) = temp_s3;
    M2C_FIELD(temp_s3, s32 *, 0x34) = -1;
    M2C_FIELD(temp_s3, s32 *, 0x30) = (s32)M2C_FIELD(arg1, s32 *, 0xC);
    func_80017000(arg0, M2C_FIELD(arg1, s16 *, 6), M2C_FIELD(arg1, s16 *, 8));
    if (!(M2C_FIELD(arg1, s32 *, 0xC) & 8)) {
        goto block_8;
    }
    M2C_FIELD(temp_s3, s32 *, 8) =
        (s32)M2C_FIELD(M2C_FIELD(arg1, void **, 0x18), s32 *, 8);
    return;

block_3:
    M2C_FIELD(temp_s3, s32 *, 0x34) = 0;
    temp_v1 = M2C_FIELD(arg1, s32 *, 0xC);
    if (!(temp_v1 & 4)) {
        goto block_5;
    }
    temp_a1 = M2C_FIELD(arg1, s16 *, 4);
    func_80017504(temp_s3, temp_a1, M2C_FIELD(arg1, s16 *, 6),
                  M2C_FIELD(arg1, s16 *, 8), (s32)temp_a1,
                  (s32)M2C_FIELD(arg1, s16 *, 0x20),
                  M2C_FIELD(arg1, s32 *, 0x1C));
    return;

block_5:
    if (!(temp_v1 & 0x100)) {
        goto block_7;
    }
    M2C_FIELD(arg0, s32 *, 0x2C) = 1;
    M2C_FIELD(arg0, s32 *, 0x30) = 1;
    func_80017880(temp_s3, M2C_FIELD(arg1, s32 *, 0),
                  M2C_FIELD(arg1, s16 *, 4), M2C_FIELD(arg1, s16 *, 6),
                  (s32)M2C_FIELD(arg1, s16 *, 8),
                  (s32)M2C_FIELD(arg1, s16 *, 0xE),
                  M2C_FIELD(arg1, void **, 0x18), M2C_FIELD(arg1, s32 *, 0x24));
    return;

block_7:
    func_80017030(temp_s3, M2C_FIELD(arg1, s32 *, 0),
                  M2C_FIELD(arg1, s16 *, 4), (u16)M2C_FIELD(arg1, s16 *, 6),
                  (s32)(u16)M2C_FIELD(arg1, s16 *, 8),
                  (s32)M2C_FIELD(arg1, s16 *, 4),
                  (s32)M2C_FIELD(arg1, s16 *, 0xE),
                  M2C_FIELD(arg1, void **, 0x18), M2C_FIELD(arg1, s32 *, 0x24),
                  M2C_FIELD(arg1, s32 *, 0x1C));

block_8:
    return;
}
