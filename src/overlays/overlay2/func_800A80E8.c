#include "types.h"

typedef struct {
    s32 unk00;
    u8 pad04[0x14];
    s32 unk18;
    s32 unk1C;
    s32 unk20;
} Screen;

typedef struct {
    u8 pad00[0x78];
    s32 unk78;
} Global;

/* Final entry of func_800A7DBC's adjacent compiler-generated switch table. */
static const u32 D_8008BC18 = 0x800A7EA4;

extern char D_800BF2CC[];
extern s8 D_800C509C;
extern s8 D_800C509D;
extern Global *D_80072380;
extern char D_8006BEE8[];
extern char D_8006BEFC[];
extern char D_8006BF10[];
extern char D_8006BF20[];
extern char D_8006BF34[];
extern char D_8006BF40[];
extern u8 D_800BF35C[];
extern u8 D_800BF36C[];
extern u8 D_800BF37C[];

void func_800A844C(void);
void func_8002E65C(char *dst, char *src);
void func_8001EC20(s32, s32);
void func_800D5C1C(s32, Screen *, void *);
void func_800DFAF8(s32, void *, s32);

void func_800A80E8(Screen *screen) {
    char digits[] = ")!@#$%^&*(";
    s8 *week;

    func_800A844C();
    week = &D_800C509C;
    switch ((s8)(*week - 0x11)) {
    case 0:
        func_8002E65C(D_800BF2CC, D_8006BEE8);
        break;
    case 1:
        func_8002E65C(D_800BF2CC, D_8006BEFC);
        break;
    case 2:
        func_8002E65C(D_800BF2CC, D_8006BF10);
        break;
    case 3:
        func_8002E65C(D_800BF2CC, D_8006BF20);
        break;
    case 4:
        func_8002E65C(D_800BF2CC, D_8006BF34);
        break;
    default:
        func_8002E65C(D_800BF2CC, D_8006BF40);
        if (*week < 9) {
            char ch = digits[*week + 1];

            D_800BF2CC[6] = ' ';
            D_800BF2CC[7] = 0;
            D_800BF2CC[5] = ch;
        } else {
            char ch;

            D_800BF2CC[5] = '!';
            ch = digits[*week - 9];
            D_800BF2CC[7] = 0;
            D_800BF2CC[6] = ch;
        }
        break;
    }
    func_8001EC20(D_80072380->unk78, 1);
    screen->unk18 = 0x168;
    screen->unk1C = 0;
    screen->unk20 = 0xFA;
    func_800D5C1C(0x160, screen, D_800BF37C);
    if (D_800C509C == 0) {
        func_800DFAF8(screen->unk00, D_800BF35C, 0);
    }
    if (D_800C509D == 1) {
        func_800DFAF8(screen->unk00, D_800BF36C, 0);
    }
}
