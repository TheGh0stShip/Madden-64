#include "types.h"

typedef struct {
    u8 id;
    u8 pad01[0x6B];
    u8 payload[0x6E];
    u16 indices[1];
} League;

typedef struct {
    u8 pad00[0xD];
    u8 state;
    u8 pad0E[0x1A];
} Record;

extern char D_80002BA8[];
extern char D_80002BB0[];
extern u16 D_8006B9E0;
extern u16 D_8006B9E4[];
extern void *D_80073438;
extern Record *D_8007343C;
extern s32 D_80073440;
extern League D_80080C90;
extern u16 D_80086190[];
extern s8 D_800C4EEB;

void *memory_pool_range_take(s32 pool, u32 size);
void memory_pool_block_resize(u32 pool, void *address);
void func_800E2068(char *, void *, s32);
void func_800E2190(char *, void *, s32);
void audio_frame_payload_copy(u16 index, void *destination);
void audio_frame_collision_resolve(void *payload, u16 *indices);
void roster_runtime_copy(u32 roster);
void func_80039BB0(void);

void roster_record_process(s16 mode, s16 source) {
    u16 i;

    D_80073440 = 0;
    D_80073438 = memory_pool_range_take(0, 0x1456);
    func_800E2068(D_80002BA8, D_80073438, mode);
    if (source == 1) {
        for (i = 0; i < D_8006B9E0; i++) {
            D_80080C90.id = D_8006B9E4[i];
            audio_frame_payload_copy(D_8006B9E4[i], D_80080C90.payload);
            audio_frame_collision_resolve(D_80080C90.payload, D_80080C90.indices);
            roster_runtime_copy(0);
        }
        func_80039BB0();
    } else if (source == 2) {
        for (i = 0; i < (u16)D_800C4EEB; i++) {
            D_80080C90.id = D_80086190[i];
            audio_frame_payload_copy(D_80086190[i], D_80080C90.payload);
            audio_frame_collision_resolve(D_80080C90.payload, D_80080C90.indices);
            roster_runtime_copy(0);
        }
    }
    D_80073440 = 1;
    func_800E2190(D_80002BA8, D_80073438, mode);
    memory_pool_block_resize(0, D_80073438);
    D_80073438 = 0;
    D_8007343C = memory_pool_range_take(0, 0x3C0);
    func_800E2068(D_80002BB0, D_8007343C, mode);
    for (i = 0; i < 24; i++) {
        D_8007343C[i].state = 0xFF;
    }
    func_800E2190(D_80002BB0, D_8007343C, mode);
    memory_pool_block_resize(0, D_8007343C);
    D_8007343C = 0;
}
