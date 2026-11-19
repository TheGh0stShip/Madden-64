#include "m2c.h"

typedef struct { u8 pad[0xD]; u8 unkD; u8 unkE; u8 pad2[0x15]; u8 hi; u8 lo; } Team;
typedef struct { s32 pad[0x13]; s32 unk4C; } Pic;
typedef struct { s32 unk0; char *line[4]; } Text;
typedef struct { char a[0x28]; char b[0x28]; char c[0x28]; char d[0x28]; s32 unkA0; Pic *pic; Text *text; } Panel;
void func_800167FC(u8, char *);
void func_80017B80(s32);
void func_8001F25C(s32, u8, s32);
void func_8001F2B4(s32, Team *);
s32 func_80024B90(u16);
void func_8002AC68(s32, s32, char **, s32 *);
void func_8002B344(u16, s32 *);
void func_8002E65C(char *, char *);
void func_8002E688(char *, char *);
Team *func_8003AA28(u16);
void func_800AE6E0(s16, s32);
extern char D_8006BFA0[];
extern char D_8008C3A4[];
extern s32 D_800C48B8[];
extern u16 D_800C5C34[];
void func_800B9990(Panel *arg0) {
    char name[0x28];
    s32 info[4];
    Team *team;
    u8 idx;

    team = func_8003AA28(D_800C5C34[0]);
    arg0->a[0] = '#';
    arg0->a[1] = 0;
    func_800167FC(team->unkD, name);
    func_8002E688(arg0->a, name);
    func_8002E688(arg0->a, D_8008C3A4);
    func_8002E688(arg0->a, (char *) team);
    func_8002E65C(arg0->b, D_8006BFA0);
    func_8002E65C(arg0->c, D_8006BFA0);
    func_8002E65C(arg0->d, D_8006BFA0);
    arg0->text->line[0] = arg0->a;
    arg0->text->line[1] = arg0->b;
    arg0->text->line[2] = arg0->c;
    arg0->text->line[3] = arg0->d;
    if (D_800C5C34[0] != 0x1F3F) {
        func_8002B344(D_800C5C34[0], info);
        func_8002AC68(team->unkE & 0x3F, 3, &arg0->text->line[1], info);
    }
    func_800AE6E0((team->hi << 8) | team->lo, 1);
    if (D_800C5C34[0] != 0x1F3F) {
        if ((idx = func_80024B90(D_800C5C34[0])) != 0xFF) {
            arg0->pic->unk4C = D_800C48B8[idx];
            func_80017B80(arg0->pic->unk4C);
        }
    } else {
        idx = 0xFF;
    }
    if (idx == 0xFF) {
        idx = 0x7B;
    }
    func_8001F25C(0, idx, 0);
    func_8001F2B4(0, team);
}
