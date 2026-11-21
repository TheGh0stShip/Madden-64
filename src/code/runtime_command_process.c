#include "types.h"

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    s16 unk_0A;
    s32 unk_0C;
    s32 unk_10;
    u8 unk_14[0x14];
} NodeDesc;

extern s32 D_80069A30[];
extern s32 D_800696F0[];
extern s32 D_80087A64;
extern s32 D_80088090;
extern s32 D_8008B3D0;

s32 func_8002FE58(void);
void display_texture_cache_initialize(s32 *);
s32 func_8000C930(s32 *, s32, s32, s32);
s32 display_surface_create(s32, s32);
void func_8000C940(s32, s32, s32);
void func_8000C964(s32, s32, s32);
void object_scene_create(s32 *);
s32 object_children_create(s32, s32, s32);
s32 func_80016E80(s32, void *, s32);
s32 func_8000C898(s32, s32);
void func_800334B8(void);
s32 display_node_create(s32, s32, NodeDesc *);
void func_80016FE4(s32);
void func_80031A78(void);
void display_frame_context_initialize(void);
void func_80031A98(void);
void func_8000BE80(void);
void node_resource_attach(s32, s32);
s32 func_80016EE4(void);
void object_scene_reset(void);
void object_resource_cleanup(s32);
void display_system_shutdown(void);
void func_80000404(void);

void runtime_command_process(s32 arg0, s32 arg1) {
    NodeDesc desc;
    s32 node;

    func_8002FE58();
    display_texture_cache_initialize(D_80069A30);
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    D_80088090 = display_surface_create(4, 5);
    func_8000C940(D_80088090, 0, 0);
    func_8000C964(D_80088090, 0x140, 0xF0);
    object_scene_create(D_800696F0);
    D_80087A64 = object_children_create(0, 0, 0);
    func_80016E80(6, func_80000404, 0x720);
    func_8000C898(D_80088090, D_80087A64);
    func_800334B8();
    desc.unk_04 = 8;
    desc.unk_0C = 1;
    desc.unk_06 = 0;
    desc.unk_08 = 0;
    desc.unk_10 = 0;
    desc.unk_00 = arg0;
    desc.unk_04 = 3;
    node = display_node_create(D_80087A64, 0, &desc);
    func_80016FE4(node);
    if (arg1 == 1) {
        func_80031A78();
    }
    display_frame_context_initialize();
    display_frame_context_initialize();
    func_80031A98();
    display_frame_context_initialize();
    display_frame_context_initialize();
    func_8000BE80();
    node_resource_attach(D_80087A64, node);
    func_80016EE4();
    object_scene_reset();
    object_resource_cleanup(D_80088090);
    display_system_shutdown();
    func_800334B8();
}
