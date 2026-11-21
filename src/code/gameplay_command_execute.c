#include "types.h"

typedef struct {
    char *unk_00;
    char *unk_04;
    char *unk_08;
    char *unk_0C;
    char *unk_10;
    u8 pad14[4];
    s32 unk_18;
    u8 pad1C[4];
} Message;

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    s32 unk_0C;
    s32 unk_10;
    u8 pad14[0x14];
} NodeDesc;

extern u8 D_80069A30[];
extern u8 D_8008B3D0[];
extern u8 D_800696F0[];
extern s32 D_80088090;
extern s32 D_80087A64;
extern s32 D_80087AA8;
extern s16 D_800895D2;
extern u8 D_80089C18;
extern s16 D_80086DA8;
extern s8 D_80086DE4[];
extern s16 D_80084F6C;
extern char D_800C0A48[];
extern char D_800C0A4C[];
extern char D_800015A0[];
extern char D_800015AC[];
extern char D_800C09D4[];
extern char D_800C09F4[];
extern char D_800C0A1C[];
extern char D_800C2540[];
extern char D_800C258C[];
extern char D_800C25B0[];
extern char D_800C0994[];
extern char D_800C09B4[];
extern char D_800C09D0[];
extern char D_800C29D4[];
extern char D_800C0A38[];
void func_80000404(void);
void func_80000410(void);
void func_80000414(void);

void func_800334B8(void);
void func_8002FE58(void);
void display_texture_cache_initialize(void *cache);
void func_8000C930(void *a, s32 b, s32 c, s32 d);
s32 display_surface_create(s32 a, s32 b);
void func_8000C940(s32 surface, s32 b, s32 c);
void func_8000C964(s32 surface, s32 w, s32 h);
void object_scene_create(void *scene);
s32 object_children_create(s32 a, s32 b, s32 c);
void func_80016E80(s32 a, void *b, s32 c);
void func_80015C80(s32 a, s32 b, s32 c, void *d, s32 e);
s16 render_state_consume(s32 a);
s32 memory_block_update(void *a, s32 b);
void resource_context_reset(u16 a, s32 b);
void func_8001AD78(s32 a);
void func_8001B51C(s16 a, s16 b, s16 c, s16 d);
void func_8000C898(s32 a, s32 b);
void display_frame_context_initialize(void);
void func_80031A98(void);
s32 display_node_create(s32 a, s32 b, NodeDesc *desc);
void func_80016FE4(s32 node);
void func_800D67B8(Message *message);
s16 func_800D6454(Message *message);
s16 func_800E1588(s8 team);
s16 func_800E154C(s8 team);
void func_8000BE80(void);
void object_chain_release(s32 a);
void func_80015CFC(void);
void func_80016EE4(void);
void func_8001AB74(void);
void object_scene_reset(void);
void object_resource_cleanup(s32 a);
void memory_block_process(u16 a);
void display_system_shutdown(void);

void gameplay_command_execute(void) {
    NodeDesc desc;
    Message message;
    s32 block;
    s32 found;
    s32 i;
    s16 kind;
    s16 result;

    func_800334B8();
    func_8002FE58();
    display_texture_cache_initialize(D_80069A30);
    func_8000C930(D_8008B3D0, 0, 0, 0);
    D_80088090 = display_surface_create(4, 5);
    func_8000C940(D_80088090, 0, 0);
    func_8000C964(D_80088090, 320, 240);
    object_scene_create(D_800696F0);
    D_80087AA8 = D_80087A64 = object_children_create(0, 0, 0);
    func_80016E80(6, func_80000404, 0x720);
    func_80015C80(D_80087A64, 0, 2, func_80000414, 0x18);
    D_800895D2 = render_state_consume(0);
    block = memory_block_update(func_80000410, 0x2B8);
    resource_context_reset(block, 0x2B);
    func_8001AD78(0);
    func_8001B51C(D_800895D2, D_800895D2, D_800895D2, D_800895D2);
    func_8000C898(D_80088090, D_80087A64);
    func_800334B8();
    display_frame_context_initialize();
    display_frame_context_initialize();
    display_frame_context_initialize();
    func_80031A98();
    desc.unk_00 = 5;
    desc.unk_0C = 0;
    desc.unk_04 = 10;
    desc.unk_06 = 0;
    desc.unk_08 = 0;
    desc.unk_10 = 0;
    func_80016FE4(display_node_create(D_80087A64, 0, &desc));
    func_800D67B8(&message);
    if (D_80089C18 == 3) {
        if (D_80086DA8 == 0) {
            message.unk_00 = D_800C0A48;
            message.unk_04 = D_800C0A4C;
        } else {
            message.unk_00 = D_800015A0;
            message.unk_04 = D_800015AC;
        }
        message.unk_18 = 12;
    } else if (D_80089C18 == 1) {
        found = 0;
        for (i = 0; i < D_80086DA8; i++) {
            D_80084F6C = D_80086DE4[i];
            if (func_800E1588(D_80086DE4[i]) == 0) {
                found = 1;
                break;
            }
        }
        if (found == 1) {
            message.unk_00 = D_800C09D4;
            message.unk_04 = D_800C09F4;
            message.unk_08 = D_800C0A1C;
            kind = func_800E154C(D_80086DE4[i]);
            if (kind < 4) {
                if (kind >= 2) {
                message.unk_00 = D_800C2540;
                message.unk_04 = D_800C258C;
                message.unk_08 = D_800C25B0;
                }
            }
        } else {
            message.unk_00 = D_800C0994;
            message.unk_04 = D_800C09B4;
            message.unk_08 = D_800C09D0;
        }
        message.unk_0C = D_800C29D4;
        message.unk_10 = D_800C0A38;
        message.unk_18 = 12;
    }
    result = func_800D6454(&message);
    if (D_80089C18 == 1) {
        if (result == 0) {
            D_80089C18 = 0;
        }
    }
    display_frame_context_initialize();
    display_frame_context_initialize();
    display_frame_context_initialize();
    func_8000BE80();
    object_chain_release(D_80087A64);
    func_80015CFC();
    func_80016EE4();
    func_8001AB74();
    object_scene_reset();
    object_resource_cleanup(D_80088090);
    memory_block_process(block);
    display_system_shutdown();
    func_800334B8();
}
