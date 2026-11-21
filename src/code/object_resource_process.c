#include "types.h"

typedef struct {
    u8 pad0[0x4];
    u16 unk_04;
    u8 pad6[0x2];
    s32 unk_08;
    void *unk_0C;
} Material;

typedef struct {
    u8 pad0[0x4];
    Material *unk_04;
    u8 pad8[0x4];
    void *unk_0C;
    void *unk_10;
    u16 unk_14;
    u16 unk_16;
    u8 unk_18;
    u8 unk_19;
    u8 unk_1A;
    u8 unk_1B;
    u8 pad1C[0xA8 - 0x1C];
    u16 unk_A8;
    u8 padAA[0xD8 - 0xAA];
    u8 unk_D8[1];
} Object;

extern u32 *D_80084F5C;
void display_fog_color_set(u8, u8, u8, u8);
void display_texture_parameters_set(s32, s32, s32, s32, s32);
void func_80009E14(s32);
void func_80009E58(s32);
void func_80009E9C(s32);
void func_8000A22C(s32);
void func_8000A3C0(s32);
void func_8000A404(s32);
void func_8000A63C(s32, s32);
void func_8000A830(s32);
void func_8000A874(s32);
void func_8000A8B8(s32);
void func_8000A8FC(s32);
void func_8000A984(s32);
void func_8000AD84(s32);
void func_8000AECC(u16, u16);
void func_8000AFA8(s32);
void func_8000B184(s32, void *);

void object_resource_process(Object *obj) {
    Material *mat = obj->unk_04;

    if (mat == 0) {
        return;
    }
    {
        u32 *cmd = D_80084F5C;

        D_80084F5C = cmd + 2;
        cmd[0] = 0xE7000000;
        cmd[1] = 0;
    }
    func_80009E14(0x800000);
    func_8000A404(0);
    func_8000A22C(0);
    func_8000B184(1, mat->unk_0C);
    func_8000B184(4, obj->unk_D8);
    if (mat->unk_04 & 1) {
        {
            u32 *cmd = D_80084F5C;

            cmd[0] = 0xE7000000;
            cmd[1] = 0;
            D_80084F5C = cmd + 2;
        }
        if (obj->unk_A8 & 0x10) {
            func_8000A3C0(0x100000);
            func_8000AFA8(0x32205);
            func_8000AECC(obj->unk_14, obj->unk_16);
            display_fog_color_set(obj->unk_18, obj->unk_19, obj->unk_1A, obj->unk_1B);
            func_80009E9C(0);
        } else {
            func_8000A3C0(0);
            func_8000AFA8(0x22205);
            func_8000A63C(0x442078, 0x442078);
            {
                u32 *cmd = D_80084F5C;

                D_80084F5C = cmd + 2;
                cmd[0] = 0xFC60FEC1;
                cmd[1] = 0x55FE793C;
            }
        }
        if (mat->unk_04 & 4) {
            func_8000B184(2, obj->unk_10);
        }
        if (mat->unk_04 & 8) {
            func_8000B184(3, obj->unk_0C);
        }
        func_8000A984(0x80000);
        func_8000A874(0);
        func_8000A8FC(0);
        func_8000A8B8(0x2000);
        func_8000A830(0xC00);
        func_80009E58(0);
        display_texture_parameters_set(0x8000, 0x8000, 0, 0, 1);
        func_8000AD84(obj->unk_04->unk_08);
        display_texture_parameters_set(0, 0, 0, 0, 0);
    } else {
        func_8000AFA8(0x22205);
        func_8000A3C0(0);
        if (obj->unk_A8 & 8) {
            func_8000A63C(0x4049D8, 0x4049D8);
        } else {
            func_8000A63C(0x442078, 0x442078);
        }
        {
            u32 *cmd = D_80084F5C;

            cmd[0] = 0xFC61FEC3;
            cmd[1] = 0x55FE7F3F;
            D_80084F5C = cmd + 2;
        }
        func_8000AD84(obj->unk_04->unk_08);
    }
}
