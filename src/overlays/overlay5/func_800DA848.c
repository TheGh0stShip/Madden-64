#include "m2c.h"

typedef struct { u8 pad[0x48]; s32 pic; } Disp;
typedef struct { u8 pad[0x54]; s32 shown; s32 want; s32 count; } Panel;
typedef struct { char name[0x6C]; char unk6C[0x6E]; char unkDA[4]; } Info;
typedef struct { s32 pic; u8 pad[0x2148]; } Side;
extern Info D_80080C90;
extern Side D_80082DC8[];
extern s32 D_800C48B8[];
extern s32 D_800E6C34;
Disp *func_800DD634(void);
s32 func_8003FA40(u16, u16, s32);
void func_8001F81C(s32, u16);
void func_8003A7DC(u16, Info *);
void func_8003A8CC(u16, char *);
void func_8003AE80(char *, char *);
void func_80092B98(void);
void func_80017C24(s32);
void func_80017B80(s32);
void func_8001F25C(s32, s16, s32);
s16 func_800DA848(Panel *arg0) {
    Disp *d = func_800DD634();
    s16 n;
    s16 i;
    u16 team;

    if (D_800E6C34 == 2) {
        team = (u16) arg0->want;
        n = 0;
        d->pic = D_80082DC8[team].pic;
        for (i = 0; i < 4; i++) {
            if (func_8003FA40(team, i, 0) != 0xB) {
                n++;
            }
        }
        func_8001F81C(0, team);
    } else if (D_800E6C34 == 1) {
        func_8003A7DC((u16) arg0->want, &D_80080C90);
        func_8003A8CC((u16) arg0->want, D_80080C90.unk6C);
        func_8003AE80(D_80080C90.unk6C, D_80080C90.unkDA);
        if (d->pic != 0) {
            d->pic = 0;
            func_80092B98();
            func_80092B98();
            func_80092B98();
            func_80017C24(D_800C48B8[arg0->shown]);
        }
        d->pic = D_800C48B8[arg0->want];
        n = 0;
        func_80017B80(D_800C48B8[arg0->want]);
        arg0->shown = arg0->want;
        for (i = 0; i < 4; i++) {
            if (func_8003FA40((u16) arg0->want, i, 0) != 0xB) {
                n++;
            }
        }
        func_8001F25C(0, (u16) arg0->want, 0);
    }
    arg0->count = n;
    if (n == 0) {
        n = 1;
    }
    return n;
}
