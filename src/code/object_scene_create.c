#include "types.h"

typedef struct {
    u32 count;
    s32 size;
    u8 pad08[0x10];
} SceneTable;

typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    SceneTable tables[17];
} Scene;

extern void *D_80064BA8;
extern void *D_800782F0;
extern void *D_800782F4;
extern void **D_800782F8;
extern Scene *D_800782FC;
extern u32 D_80087940;
extern void *D_8008931C;

void object_chain_release(void *);
void *memory_pool_range_take(s32, s32);
void memory_pool_block_resize(s32, void *);
void *memory_table_create(s32, u16, s32);
void func_80033258(void *);
void *object_children_create(u32, u32, void *);

void object_scene_create(Scene *scene) {
    u16 index;

    while (D_80064BA8 != 0) {
        object_chain_release(D_80064BA8);
    }
    if (D_800782F0 != 0) {
        func_80033258(D_800782F0);
        D_800782F0 = 0;
    }
    if (D_800782F4 != 0) {
        func_80033258(D_800782F4);
        D_800782F4 = 0;
    }
    if (D_800782F8 != 0) {
        index = 0;
        do {
            if (D_800782F8[index] != 0) {
                func_80033258(D_800782F8[index]);
                D_800782F8[index] = 0;
            }
            index++;
        } while (index < 17);
        memory_pool_block_resize(0, D_800782F8);
        D_800782F8 = 0;
    }
    D_800782F0 = memory_table_create(0, scene->unk6, 0x10);
    D_800782F4 = memory_table_create(0, scene->unk2, 0x58);
    D_800782F8 = memory_pool_range_take(0, 0x44);
    for (index = 0; index < 17; index++) {
        if (scene->tables[index].count != 0) {
            D_800782F8[index] = memory_table_create(0, scene->tables[index].count, scene->tables[index].size);
        } else {
            D_800782F8[index] = 0;
        }
    }
    D_800782FC = scene;
    D_8008931C = object_children_create(0, 0, 0);
    D_80087940 = 0;
}
