#include "types.h"

typedef struct Gfx {
    u32 w0;
    u32 w1;
} Gfx;

typedef struct BufferInfo {
    u8 pad00[0x30];
    s32 vertices[2];
    s32 count;
} BufferInfo;

typedef struct Resource {
    u8 pad00[8];
    BufferInfo *info;
} Resource;

extern u16 D_8008AFD4;
extern s32 D_8008B654;
extern Gfx *D_80084F5C;
extern void func_8000C810(s32);
extern void func_8000A3C0(s32);
extern void func_80009E14(s32);
extern void func_8000A63C(s32, s32);
extern void func_8000B008(s32);
extern void func_8000AFA8(s32);
extern void func_8000A22C(s32);
extern void func_8000A984(s32);
extern void func_8000A270(s32);
extern void func_80009E58(s32);
extern void func_8000A830(s32);
extern void func_8000B1D8(s32, s32, s32, s32, s32);

void resource_buffers_process(Resource *resource)
{
    BufferInfo *info;
    s32 vertices;
    s32 count;
    s32 remaining;

    info = resource->info;
    vertices = info->vertices[D_8008AFD4];
    func_8000C810(D_8008B654);
    count = info->count;
    if (count != 0) {
        remaining = count;
        {
            Gfx *command = D_80084F5C;
            D_80084F5C = command + 1;
            if (remaining != 0) {
                command->w0 = 0xE7000000;
            }
            command->w1 = 0;
        }
        func_8000A3C0(0);
        func_80009E14(0);
        func_8000A63C(0x404240, 0x104240);
        func_8000B008(0xE3001);
        func_8000AFA8(0x204);
        func_8000A22C(0x80);
        func_8000A984(0x80000);
        {
            Gfx *command = D_80084F5C++;
            command->w0 = 0xFCFFFFFF;
            command->w1 = 0xFFFE793C;
        }
        func_8000A270(0);
        func_80009E58(0);
        func_8000A830(0xC00);
        func_8000B1D8(0x8000, 0x8000, 0, 0, 0);
        while (remaining-- != 0) {
            Gfx *command = D_80084F5C++;
            command->w1 = vertices;
            vertices += 0x40;
            command->w0 = 0x0400103F;
            command = D_80084F5C++;
            command->w0 = 0xB1000206;
            command->w1 = 0x604;
        }
    }
}
