#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

typedef struct DisplayObject {
    u8 unk_00[8];
    void *unk_08;
} DisplayObject;

typedef struct DisplayNode {
    DisplayObject *object;
    u32 segment;
    u32 unk_08;
    struct DisplayNode *next;
} DisplayNode;

extern Gfx *D_80084F5C;
extern void *D_8008A3E0;
extern u8 D_80074A38[];
extern u8 D_80074A3C[];
extern s8 D_80074944[];
extern s8 D_80074958[];
typedef struct {
    u32 unk_00[8];
    u32 unk_20[3];
} SegmentRow;

extern SegmentRow D_8007A8E8[4];
extern DisplayObject *D_8007A9B0;
extern u32 D_8007A9B4;
extern DisplayNode *D_8007A9C0[4][20];
extern u8 D_00076D00[];
extern u8 D_00053398[];
extern u8 D_00075D00[];
extern u8 D_00050F78[];

extern void func_80008FA0(void);
extern void display_frame_setup(void);
extern void display_command_update(void);
extern void vector_slots_initialize(void *context);
extern void func_8000E3C8(void);
extern void vector_signed_components_load(u8 *color);
extern void func_8000E05C(u8 index, u8 *color);
extern void vector_display_emit(void);
extern void display_pipeline_setup(void *object, u32 segment_address, void *argument);

#define GFX2(word0, word1)           \
    {                                 \
        Gfx *g = D_80084F5C++;        \
        g->w0 = (word0);              \
        g->w1 = (word1);              \
    }

void display_command_process(void)
{
    u32 row;
    u32 i;
    s32 last;
    s32 tex;
    s32 pal;
    DisplayNode *node;

    GFX2(0xE7000000, 0);
    GFX2(0xB4000000, (u32)D_00076D00);
    GFX2(0xAF0007FF, (u32)D_00053398);
    func_80008FA0();
    display_frame_setup();
    display_command_update();
    vector_slots_initialize(D_8008A3E0);
    func_8000E3C8();
    vector_signed_components_load(D_80074A38);
    func_8000E05C(0, D_80074A3C);
    vector_display_emit();
    if (D_8007A9B4 != 0) {
        display_pipeline_setup(D_8007A9B0, D_8007A9B4, D_8007A9B0->unk_08);
    }
    vector_slots_initialize(D_8008A3E0);
    func_8000E3C8();
    vector_display_emit();
    for (row = 0; row < 4; row++) {
        last = -1;
        for (i = 0; i < 19; i++) {
            node = D_8007A9C0[row][i];
            if (node != 0) {
                tex = D_80074944[i];
                if (tex != last) {
                    GFX2(0xFD100000, D_8007A8E8[row].unk_20[tex]);
                    GFX2(0xE8000000, 0);
                    GFX2(0xF5000100, 0x07000000);
                    GFX2(0xE6000000, 0);
                    GFX2(0xF0000000, 0x073FC000);
                    GFX2(0xE7000000, 0);
                    last = tex;
                }
                pal = D_80074958[i];
                D_80084F5C->w0 = 0xBC000806;
                D_80084F5C->w1 = D_8007A8E8[row].unk_00[pal];
                D_80084F5C++;
                display_pipeline_setup(node->object, node->segment, node->object->unk_08);
                node = node->next;
                while (node != 0) {
                    display_pipeline_setup(node->object, node->segment, (u8 *)node->object->unk_08 + 0x38);
                    node = node->next;
                }
            }
        }
        node = D_8007A9C0[row][19];
        while (node != 0) {
            GFX2(0xBC000806, node->unk_08);
            display_pipeline_setup(node->object, node->segment, node->object->unk_08);
            node = node->next;
        }
    }
    GFX2(0xE7000000, 0);
    GFX2(0xB4000000, (u32)D_00075D00);
    GFX2(0xAF0007FF, (u32)D_00050F78);
    func_80008FA0();
    display_frame_setup();
}
