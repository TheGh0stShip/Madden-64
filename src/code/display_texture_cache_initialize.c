#include "types.h"

/* display_texture_cache_initialize: reset the display/frame-buffer state, swap to the first buffer,
 * configure the display context at D_8008B3D0, carve the display arenas and, on first call, create the
 * VI/retrace message queues and start the display thread. */

typedef struct DisplayConfig {
    u16 heap_size;
    u8 pad02[4];
    u16 surface_id;
    u8 pad08[0xC];
    s32 entry_count;
} DisplayConfig;

extern volatile s16 D_8008B070;
extern volatile s32 D_80085294;
extern volatile s16 D_80089516;
extern volatile s32 D_8008790C;
extern s32 D_80087908;
extern volatile s32 D_80086174;
extern s32 D_80086170;
extern void *D_8008A068[];
extern s16 D_8008AFD4;
extern u16 D_80088DB0;
extern u8 D_8008B3D0[];
extern void *D_80064BA0;
extern s16 D_8008B5D6;
extern s16 D_8008B5CC;
extern s32 D_8008B608;
extern s16 D_8008B5C8;
extern s16 D_8008B5CA;
extern s16 D_8008B5CE;
extern s16 D_8008B5D4;
extern u8 D_8008B3D6;
extern u8 D_8008B3D7;
extern u8 D_8008B3D8;
extern s32 D_8008B5C0;
extern s32 D_80080A78;
extern u8 *D_8008B350;
extern u8 *D_8008B354;
extern void *D_80084F44;
extern void *D_80085038;
extern s32 D_8008AF98;
extern s32 D_80064B58;
extern u8 D_80085D18[];
extern u8 D_80088700[];
extern u8 D_80085A00[];
extern u8 D_8008862C[];
extern u8 D_8008B398[];
extern u8 D_80087754[];
extern u8 D_8008A400[];
extern u8 D_8008A050[];
extern u8 D_80050EA8[];
extern u8 D_80050F78[];
extern u8 *D_80064B68;
extern s32 D_80064B6C;
extern void *D_80064B80;
extern volatile s32 D_80088620;
extern s32 D_80085030;
extern s32 D_80085034;
extern s32 D_80085D38;
extern s32 D_80085D3C;

extern void osViSwapBuffer(void *);
extern void projection_scale_configure(void *);
extern void *memory_table_create(s32, u32, s32);
extern void func_8000C8F8(void *);
extern void display_viewport_configure(void *);
extern void *memory_arena_process(s16, u32, u32);
extern void osCreateMesgQueue(void *, void *, s32);
extern void osSetEventMesg(s32, void *, void *);
extern void osCreateThread(void *, s32, void (*)(void *), void *, void *, s32);
extern void osStartThread(void *);
extern void display_system_run(void *);
extern s32 func_80008DF8(s32);

void display_texture_cache_initialize(DisplayConfig *config)
{
    s32 count;

    D_80088DB0 = config->heap_size;
    D_8008B070 = 0;
    D_80085294 = 0;
    D_80089516 = 1;
    *(volatile s32 *)&D_80087908 = D_8008790C = 0;
    *(volatile s32 *)&D_80086170 = D_80086174 = 0;
    D_8008AFD4 = 0;
    osViSwapBuffer(D_8008A068[D_80085294]);
    D_80085294++;
    *(u16 *)(D_8008B3D0 + 4) = config->surface_id;
    projection_scale_configure(D_8008B3D0);
    D_80064BA0 = memory_table_create(0, config->heap_size, 0x248);
    D_8008B5D6 = 12;
    func_8000C8F8(D_8008B3D0);
    *(s32 *)D_8008B3D0 = 0;
    D_8008B5CC = 320;
    D_8008B608 = 0;
    D_8008B5C8 = 0;
    D_8008B5CA = 0;
    D_8008B5CE = 240;
    D_8008B5D4 = 0;
    D_8008B3D6 = 0;
    D_8008B3D7 = 0;
    D_8008B3D8 = 0;
    D_8008B5C0 = 0;
    display_viewport_configure(D_8008B3D0);
    count = config->entry_count;
    D_80080A78 = count * 8;
    D_8008B350 = memory_arena_process(0, count * 16, 16);
    D_8008B354 = D_8008B350 + D_80080A78;
    D_80084F44 = memory_arena_process(0, 0x400, 16);
    D_80085038 = memory_arena_process(0, 0x10000, 16);
    D_8008AF98 = 0x10000;
    if (D_80064B58 == 0) {
        D_80064B58 = 1;
        osCreateMesgQueue(D_80085D18, D_80088700, 1);
        osSetEventMesg(4, D_80085D18, 0);
        osCreateMesgQueue(D_80085A00, D_8008862C, 1);
        osSetEventMesg(9, D_80085A00, 0);
        osCreateMesgQueue(D_8008B398, D_80087754, 1);
        osCreateThread(D_8008A400, 0x47, display_system_run, 0, D_8008A050, 20);
        osStartThread(D_8008A400);
    }
    D_80064B68 = D_80050EA8;
    D_80064B6C = D_80050F78 - D_80050EA8;
    D_80064B80 = D_80084F44;
    *(s32 *)(D_8008B3D0 + 0x23C) = func_80008DF8(2);
    *(volatile s32 *)&D_80085030 = D_80088620;
    D_80085D38 = 0;
    D_80085D3C = 0;
    D_80085034 = D_80088620;
}
