#include "types.h"

typedef struct {
    u8 pad00[8];
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 pad0D[3];
    s32 *unk10;
    u8 pad14[6];
    u16 unk1A;
    u8 unk1C;
    u8 pad1D;
    u8 unk1E;
    u8 pad1F;
    void **unk20;
    u8 *unk24;
    u8 *unk28;
    u8 unk2C;
    u8 pad2D;
    u8 unk2E;
    u8 pad2F[0xD];
    s32 *unk3C;
    s32 *unk40;
    void *unk44;
    u8 pad48[4];
    s32 unk4C;
} List;

extern s32 D_8007A418;

void func_8001EC20(void *, s32);
void overlay5_runtime_index_ranges_swap(void *, s32, s32, u32, s32);

void func_800DC1C8(List *list, s32 dir) {
    void (*full)(u32, s32, s32, s32);
    void (*row)(u16, s32, s32);
    u32 end;
    u32 i;
    u32 n;
    u32 k;
    u32 from;
    u32 to;
    u32 slot;
    void **funcs;

    end = list->unkA + list->unkC;
    if (list->unk8 < list->unkC) {
        end = list->unk8;
    }
    if (dir > 0) {
        for (i = list->unk1E; i < list->unk1C - 1; i++) {
            from = list->unk28[i + 1];
            to = list->unk28[i];
            if (list->unk24[i] != 0) {
                overlay5_runtime_index_ranges_swap(list->unk44, from, to, list->unkC, 1);
            } else {
                for (k = 0; k < end; k++) {
                    list->unk40[to++] = list->unk40[from++];
                }
            }
        }
        if (list->unk10 != 0 && list->unk2C != 0xFF) {
            overlay5_runtime_index_ranges_swap(list->unk44, list->unk2C + 1, list->unk2C, list->unk1C - list->unk1E - 1, 1);
            slot = list->unk2C + list->unk1C - list->unk1E - 1;
            list->unk3C[slot] = list->unk10[list->unk1A + (list->unk1C - list->unk1E) - 1];
            func_8001EC20(list->unk44, slot);
        }
    } else {
        for (i = list->unk1C - 1; list->unk1E < i; i--) {
            from = list->unk28[i - 1];
            to = list->unk28[i];
            if (list->unk24[i] != 0) {
                overlay5_runtime_index_ranges_swap(list->unk44, from, to, list->unkC, 1);
            } else {
                for (k = 0; k < end; k++) {
                    list->unk40[to++] = list->unk40[from++];
                }
            }
        }
        if (list->unk10 != 0 && list->unk2C != 0xFF) {
            overlay5_runtime_index_ranges_swap(list->unk44, list->unk2C + list->unk1C - list->unk1E - 2, list->unk2C + list->unk1C - list->unk1E - 1, list->unk1C - list->unk1E - 1, -1);
            slot = list->unk2C;
            list->unk3C[slot] = list->unk10[list->unk1A];
            func_8001EC20(list->unk44, slot);
        }
    }
    slot = list->unk28[i];
    funcs = list->unk20;
    full = (void (*)(u32, s32, s32, s32))funcs[0];
    row = (void (*)(u16, s32, s32))funcs[D_8007A418 = i + list->unk1A];
    if (list->unk24[i] != 0) {
        for (n = list->unkA; n < end; n++) {
            if (list->unk2E & 0x40) {
                full(n, D_8007A418, list->unk3C[slot], list->unk4C);
            } else {
                row(n, list->unk3C[slot], list->unk4C);
            }
            func_8001EC20(list->unk44, slot);
            slot++;
        }
    } else {
        for (n = list->unkA; n < end; n++) {
            if (list->unk2E & 0x40) {
                full(n, D_8007A418, (s32)&list->unk40[slot], list->unk4C);
            } else {
                row(n, (s32)&list->unk40[slot], list->unk4C);
            }
            slot++;
        }
    }
}
