#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

typedef struct {
    u8 unk_000[0xA];
    u16 unk_00A;
    u16 unk_00C;
    u8 unk_00E[0x1E8 - 0xE];
    u16 unk_1E8;
    s16 unk_1EA;
    u8 unk_1EC[0x1F8 - 0x1EC];
    u16 unk_1F8;
    u16 unk_1FA;
    u8 unk_1FC[0x218 - 0x1FC];
    u8 unk_218[1];
} DisplayContext;

void func_8000B184(s32, s32);
void func_8000A3C0(s32);
void func_80009E14(s32);
void display_combine_mode_set(s32, u16, u16, u16, u16);
void func_8000A8FC(s32);
void func_8000A940(s32);
void func_8000A874(s32);
void func_8000A984(s32);
void func_8000A8B8(s32);
void func_8000A830(s32);
void func_8000A270(s32);
void func_80009E58(s32);
void func_8000A63C(s32, s32);
void func_8000A22C(s32);
void func_8000B008(s32);
void display_texture_parameters_set(s32, s32, s32, s32, s32);
void func_8000AFA8(s32);
void func_8000C790(DisplayContext *);
void func_8000B140(u16);
void func_8000ADC0(s32);

extern Gfx *D_80084F5C;
extern DisplayContext *D_8008B654;
extern s16 D_80088634;
extern s32 D_80085294;
extern u32 D_8008A068[];
extern u32 D_800886F0;

void display_frame_setup(void) {
    Gfx *g;

    func_8000B184(0, 0);
    func_8000A3C0(0);
    func_80009E14(0);
    display_combine_mode_set(0, D_8008B654->unk_1F8, D_8008B654->unk_1FA, D_8008B654->unk_00A,
                             D_8008B654->unk_00C);
    func_8000A8FC(0);
    func_8000A940(0);
    func_8000A874(0);
    func_8000A984(0x80000);
    func_8000A8B8(0x2000);
    func_8000A830(0xC00);

    g = D_80084F5C++;
    g->w0 = 0xFCFFFFFF;
    g->w1 = 0xFFFE793C;

    func_8000A270(0);
    func_80009E58(0);
    func_8000A63C(0x0C084000, 0x03024000);
    func_8000A22C(0xC0);

    g = D_80084F5C++;
    g->w0 = 0xE7000000;
    g->w1 = 0;
    g = D_80084F5C++;
    g->w0 = 0x03800010;
    g->w1 = (u32)D_8008B654->unk_218 & 0x1FFFFFFF;

    func_8000B008(0x1F3204);
    display_texture_parameters_set(0, 0, 0, 0, 0);
    func_8000AFA8(0x204);

    g = D_80084F5C++;
    g->w0 = ((D_80088634 - 1) & 0xFFF) | 0xFF100000;
    g->w1 = D_8008A068[D_80085294] & 0x1FFFFFFF;
    g = D_80084F5C++;
    g->w0 = 0xFE000000;
    g->w1 = D_800886F0 & 0x1FFFFFFF;

    D_8008B654->unk_1EA = 2;
    func_8000C790(D_8008B654);
    func_8000B140(D_8008B654->unk_1E8);
    func_8000ADC0(2);
}
