#include "types.h"

void func_8001C444(s32);
void func_8001C494(s32);
void func_8001C4E4(s32);
void func_8001C534(s32);
s32 func_8001C670(void);
s32 func_8001CA44(void);
void func_80044C48(void *);
void object_state_initialize(void *, s32, s32, s32);
extern s16 D_800692B4;
typedef struct { u8 unk_00[0x58]; u8 unk_58[0x770]; } Obj;
extern Obj D_800784FC[];
extern u8 D_80078554[];
extern u8 *D_80079478;
extern s16 D_80079514;
extern s16 D_80079518;
extern s32 D_80088630;

void ui_layout_render(u8 *arg0, s16 *arg1) {
    s32 n0 = 0;
    s32 n1 = 0;
    s32 n2 = 0;
    s32 n3 = 0;
    s32 n4 = 0;
    s32 total;
    u16 index;
    u8 type;
    u8 c;
    s32 id;

    D_80079478 = arg0 + 4;
    total = 0;
    index = 0;
    while (~*D_80079478 & 0xFF) {
        total++;
        if (*D_80079478 & 0x80) {
            type = *D_80079478;
            n4++;
            if (type & 0x10) {
                D_80079478 += 2;
            } else {
                D_80079478 += 1;
            }
            D_80079514 = func_8001C670();
            D_80079518 = func_8001CA44();
            switch (type & 0xC) {
            case 0:
                D_80079478 += *D_80079478 + 1;
                break;
            case 4:
            case 8:
                D_80079478 += 1;
                break;
            }
        } else {
            c = *D_80079478++;
            switch (c & 0x1F) {
            case 16:
            case 21:
                n2++;
                func_8001C444(c);
                D_80079478 += 0x10;
                break;
            case 0:
            case 5:
                n2++;
                func_8001C444(c);
                D_80079478 += 8;
                break;
            case 29:
                id = c;
                func_8001C444(id);
                func_8001C494(id);
                func_8001C4E4(id);
                func_8001C534(id);
                n1++;
                D_80079478 += 0x10;
                break;
            case 22:
            case 23:
            case 24:
            case 25:
                id = c;
                func_8001C444(id);
                func_8001C494(id);
                n1++;
                D_80079478 += 0x10;
                break;
            case 17:
            case 18:
            case 19:
            case 20:
                id = c;
                func_8001C444(id);
                func_8001C494(id);
                n0++;
                D_80079478 += 0x10;
                break;
            case 1:
            case 2:
            case 3:
            case 4:
                id = c;
                func_8001C444(id);
                func_8001C494(id);
                n0++;
                D_80079478 += 8;
                break;
            case 6:
            case 7:
            case 8:
            case 9:
                id = c;
                func_8001C444(id);
                func_8001C494(id);
                n1++;
                D_80079478 += 8;
                break;
            case 13:
                id = c;
                func_8001C444(id);
                func_8001C494(id);
                func_8001C4E4(id);
                func_8001C534(id);
                n1++;
                D_80079478 += 8;
                break;
            case 15:
                n3++;
                D_80079478 += 5;
                break;
            case 30:
                D_800692B4 = -1;
                object_state_initialize(&D_800784FC[index], D_80088630, 0x60000, 0);
                func_80044C48(D_800784FC[index].unk_58);
                n3++;
                index++;
                D_80079478 += 9;
                break;
            }
        }
    }
    arg1[0] = n0;
    arg1[1] = n1;
    arg1[2] = n2;
    arg1[3] = n3;
    arg1[4] = n4;
    arg1[5] = total;
}
