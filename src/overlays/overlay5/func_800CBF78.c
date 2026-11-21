#include "types.h"

typedef struct {
    u8 unk_00[0x19];
} Entry19;

typedef struct {
    u8 pad00[5];
    u8 unk_05;
    u8 pad06[0xE];
    s32 unk_14;
    s32 unk_18;
    u8 pad1C[0xC];
} Entry28;

extern s32 D_80080C8C;
extern s32 D_80084F80;
extern Entry19 *D_800869EC;
extern Entry28 *D_80088094;
extern u8 **D_8008AF8C;

void func_80033308(s32 a, s32 b, s32 c, s32 d);
void func_8001DF98(s32 a, s32 b, Entry19 *entry, u8 *data, s32 e, s32 f);
void func_8001DA90(s32 a, s32 b, Entry19 *entry, u8 *data, s32 e, s32 f);
void func_8001D1E0(s32 a, s32 b, s32 c, u8 d);
void func_8001D898(s32 a, s32 b, Entry19 *entry, s32 d, s32 e);
void func_8001D6A8(s32 a, s32 b, Entry19 *entry, s32 d, s32 e);
void func_8001A998(s32 a, s32 b, s32 c);

void func_800CBF78(u16 index, u16 id, u16 flag, u16 mode, s32 arg4, s32 arg5) {
    Entry19 *entries = D_800869EC;
    u8 **data = D_8008AF8C;
    u8 *p;

    func_80033308(0, arg5, 0x900, 0);
    index &= 0xDFFF;
    if (mode == 2) {
        if (flag) {
            if (id & 0x2000) {
                id &= 0xDFFF;
                func_8001DF98(arg4, arg5, &entries[id], data[index], D_80080C8C, D_80084F80);
            } else {
                func_8001DA90(arg4, arg5, &entries[id], data[index], D_80080C8C, D_80084F80);
            }
            func_8001D1E0(arg4, arg5, D_80084F80, D_80088094[id].unk_05);
        } else {
            p = data[index];
            func_8001DA90(arg4, arg5, &entries[*p], p, D_80080C8C, D_80084F80);
            func_8001D1E0(arg4, arg5, D_80084F80, D_80088094[*p].unk_05);
        }
    } else if (mode == 1) {
        if (id & 0x2000) {
            func_8001D898(arg4, arg5, &entries[id & 0xDFFF], D_80084F80, D_80088094[id & 0xDFFF].unk_18);
        } else {
            func_8001D6A8(arg4, arg5, &entries[id], D_80084F80, D_80088094[id].unk_18);
        }
    } else if (flag) {
        if (id & 0x2000) {
            func_8001D898(arg4, arg5, &entries[id & 0xDFFF], D_80084F80, D_80088094[id & 0xDFFF].unk_14);
        } else {
            func_8001D6A8(arg4, arg5, &entries[id], D_80084F80, D_80088094[id].unk_14);
        }
    } else {
        func_8001D6A8(arg4, arg5, &entries[id], D_80084F80, D_80088094[id].unk_18);
    }
    func_8001A998(arg5, arg4, 0);
}
