#include "types.h"

typedef struct SessionObject {
    void *root;
    void *first;
    void *second;
    u16 identifier;
} SessionObject;

typedef struct GameSession {
    u32 index;
    SessionObject *object;
} GameSession;

typedef struct Model {
    u8 pad000[0x218];
    s16 unk_218;
    s16 unk_21A;
    u8 pad21C[0xC];
    f32 unk_228;
    f32 unk_22C;
} Model;

typedef struct MovieCue {
    s32 unk_00;
    u16 unk_04;
    u16 unk_06;
    s32 unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 audio;
    s32 timeline;
    s16 active;
    u16 unk_1E;
    u16 flags;
    u8 unk_22;
    s8 unk_23;
    s32 unk_24;
    s32 unk_28;
    u16 unk_2C;
} MovieCue;

typedef struct NodeSetup {
    u16 unk_00;
    u16 unk_02;
    s32 unk_04;
    s16 unk_08;
    s16 unk_0A;
    void *unk_0C;
    s32 unk_10;
    s32 unk_14;
    s32 unk_18;
    u16 unk_1C;
} NodeSetup;

extern MovieCue D_8006A520[];
extern s32 D_8008A6D0;
extern s32 func_8000041C;
extern s32 func_80000420;

extern u32 memory_pool_range_take(s32 pool, u32 size);
extern u16 memory_block_update(s32 *, s32);
extern void *display_surface_create(s32, s32);
extern void *object_children_create(s32, s32, s32);
extern void func_8000C898(void *object, void *other);
extern void func_8000C940(void *object, u16, u16);
extern void func_8000C964(void *object, u16 width, u16 height);
extern void func_8000CB78(void *, s32, s32);
extern void func_8000B7A4(Model *, u16);
extern void runtime_record_copy(s32 *);
extern void *display_node_create(void *, s32, NodeSetup *);
extern s32 func_8003C8E0(s32 *, s32, s32, s32);
extern void audio_bank_records_load(s32);
extern void audio_channel_prepare(s32, s32);
extern void func_800457F8(s32 sound);
extern void object_transform_configure(void *, s32, s32);

u16 game_session_update(GameSession *session, s32 x, s32 y, s32 width, s32 height)
{
    NodeSetup setup;
    u32 index = session->index;
    u16 result;

    session->object = (SessionObject *)memory_pool_range_take(0, 0x10);
    session->object->identifier = memory_block_update(&func_80000420, 0x648);
    session->object->root = display_surface_create(4, 5);
    session->object->first = object_children_create(0, 0, 0);
    func_8000C898(session->object->root, session->object->first);
    func_8000C940(session->object->root, x, y);
    func_8000C964(session->object->root, width, height);
    func_8000CB78(session->object->root, 0, 0);
    func_8000B7A4(session->object->root, 0xB0);
    ((Model *)session->object->root)->unk_228 = width;
    ((Model *)session->object->root)->unk_22C = height;
    ((Model *)session->object->root)->unk_218 = width << 2;
    ((Model *)session->object->root)->unk_21A = height << 2;
    runtime_record_copy(&D_8008A6D0);
    setup.unk_0A = 2;
    setup.unk_0C = session->object->root;
    setup.unk_04 = D_8006A520[index].unk_08;
    setup.unk_08 = D_8006A520[index].unk_00;
    setup.unk_00 = session->object->identifier;
    setup.unk_02 = session->object->identifier;
    setup.unk_10 = D_8006A520[index].unk_0C;
    setup.unk_18 = D_8006A520[index].unk_28;
    setup.unk_1C = D_8006A520[index].unk_2C;
    result = D_8006A520[index].unk_06;
    session->object->second = display_node_create(session->object->first, 0x10, &setup);
    setup.unk_10 = 0;
    if (D_8006A520[index].active != 0) {
        func_8003C8E0(&func_8000041C, 0xB1C, 0x42, 1);
        audio_bank_records_load(D_8006A520[index].active);
    }
    if (D_8006A520[index].audio != 0) {
        audio_channel_prepare(D_8006A520[index].audio, 0);
    }
    if (D_8006A520[index].timeline != 0) {
        func_800457F8(D_8006A520[index].timeline);
    }
    if (D_8006A520[index].flags & 1) {
        object_transform_configure(session->object->root, 0, D_8006A520[index].unk_23);
    }
    return result;
}
