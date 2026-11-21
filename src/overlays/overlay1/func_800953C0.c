#include "types.h"

typedef struct {
    char c[4];
} Lit4;

typedef struct {
    s32 count;
    char *lines[3];
} TextLines;

typedef struct {
    s32 count;
    char *args[5];
} TextArgs;

typedef struct {
    u8 type;
    s8 value;
    u8 pad2[0x6];
} DriveRecord;

typedef struct {
    s32 unk_0;
    s32 drive;
    s32 unk_8;
    s32 start;
    s32 current;
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
} DriveInfo;

typedef struct {
    s32 count;
    char *lines[10];
} TextBox;

typedef struct {
    u8 pad0[0x84];
} PlayData;

typedef struct {
    u8 pad0[0x28];
} PlayEntry;

typedef struct {
    PlayEntry *entry;
    PlayData *data;
    u8 pad8[0x10];
    s32 unk_18;
    u8 pad1C[0x2130];
} TeamPlay;

typedef struct {
    u8 pad0[0x8];
    s32 unk_8;
} Task;

void func_800167FC(s16, char *);
void func_8001AEA8(DriveInfo *);
char *func_80022A3C(u8, u8);
void func_80028144(void);
u8 func_80029944(void);
void func_80029954(u8, DriveRecord *);
void func_8002E65C(void *, void *);
Task *func_8002FEA4(char *, s32, s32);
void func_80038150(s32);
void func_8003DDF8(u8 *, TextArgs *, TextLines *, s32, s32);
void func_8003E23C(TextLines *);
void func_80041BDC(s32, s32);
void func_80090C00(char *, s32, s32, char *);
void func_800A365C(s32);
s16 func_800AACE8(s32, TextBox *, s32);
void func_800AAEF0(s16, char *);
void func_800ABBE0(void);
s32 func_800AE680(void);
void func_800AEA9C(s32);
void func_800BC98C(void);
void func_800BCFAC(void);
void func_800BE784(void);
void func_800E1EF8(s32);
void object_active_callback_clear(void *);
void object_list_apply(void);
extern Lit4 D_800005B4;
extern PlayData D_8006AE48[];
extern PlayEntry D_8006AECC[];
extern PlayData D_8006AEF4[];
extern PlayEntry D_8006AF78[];
extern DriveInfo D_8006B968;
extern TextBox D_8006B98C;
extern char D_8006BFA0[];
extern char D_8006C01C[];
extern char D_8006C034[];
extern char D_8006C06C[];
extern char D_8006C094[];
extern char D_8006C0B8[];
extern char D_8006C0E0[];
extern char D_8006C10C[];
extern char D_8006C12C[];
extern char D_8006C148[];
extern char D_8006C178[];
extern char D_8006DB14[];
extern char D_8006DB20[];
extern char D_8006DB2C[];
extern char D_8006DB3C[];
extern char D_8006DB48[];
extern char D_8006DB58[];
extern PlayEntry D_80072EE0[];
extern s32 D_80080C10;
extern TeamPlay D_80082DB4[];
extern void *D_80085040[2][22];
extern char D_80085A58[10][40];
extern s16 D_80086BE4;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern u8 D_80088AE8;
extern s16 D_80088AEE;
extern u16 D_80088AF0;
extern u8 D_80088AF3;
extern u8 D_80088AF4;
extern u8 D_80088AF5;
extern u8 D_80088AF6;
extern s8 D_80088AF7;
extern s16 D_80089320;
extern u16 D_8008B672;
extern char D_8009153C[];
extern PlayData D_800C31E0[];

void func_80090C9C(void) {
    char name1[16];
    char name2[16];
    char number[8];
    TextLines out;
    TextArgs args;
    u8 text[40];
    s32 counts[3];
    s32 yards[3];
    DriveRecord record;
    s16 i;
    s32 j;
    u8 n;
    s32 line;
    s32 summary;
    char *str;

    summary = 0;
    if (D_80088AF6 == 0) {
        return;
    }
    func_80041BDC(8, 100);
    func_800ABBE0();
    D_8006B968.drive = D_80082DB4[D_80088AF3].unk_18;
    D_8006B968.current = D_8006B968.start = func_800AE680();
    D_8006B968.unk_1C = 0;
    D_8006B968.unk_18 = 0;
    D_8006B968.unk_14 = 0;
    func_8001AEA8(&D_8006B968);
    for (i = 0; i < 10; i++) {
        D_8006B98C.lines[i] = D_80085A58[i];
        func_8002E65C(D_80085A58[i], D_8006BFA0);
    }
    switch (D_80088AF6) {
    case 1:
        str = D_8006C01C;
        summary = 1;
        break;
    case 2:
        str = D_8006C034;
        summary = 1;
        break;
    case 3:
        str = D_8006C06C;
        summary = 1;
        break;
    case 4:
        str = D_8006C094;
        summary = 1;
        break;
    case 5:
        str = D_8006C0B8;
        summary = 1;
        break;
    case 6:
        str = D_8006C0E0;
        summary = 1;
        break;
    case 7:
        str = D_8006C10C;
        summary = 1;
        break;
    case 10:
        str = D_8006C12C;
        break;
    case 11:
        str = D_8006C148;
        break;
    case 12:
        str = D_8006C178;
        break;
    default:
        str = 0;
        break;
    }
    func_8002E65C(text, str);
    if (summary == 1 && D_80088AF7 == 1) {
        for (i = 0; i < 38; i++) {
            if (text[i] == 0) {
                break;
            }
        }
        i -= 2;
        text[i] = '.';
        text[i + 1] = 0;
    }
    out.count = 3;
    args.count = 4;
    args.args[0] = name1;
    args.args[1] = name2;
    args.args[2] = number;
    func_800167FC(D_80088AF7, number);
    func_8002E65C(name1, func_80022A3C(D_80088AF3, D_80088AF4));
    if (D_80088AF5 != 0xFF) {
        func_8002E65C(name2, func_80022A3C(D_80088AF3, D_80088AF5));
    } else {
        name2[0] = ' ';
        name2[1] = 0;
    }
    func_8003DDF8(text, &args, &out, 0xA0, 0);
    func_8002E65C(D_80085A58[3], out.lines[0]);
    if (out.lines[1] != 0) {
        func_8002E65C(D_80085A58[4], out.lines[1]);
    }
    if (out.lines[2] != 0) {
        func_8002E65C(D_80085A58[5], out.lines[2]);
    }
    func_8003E23C(&out);
    func_800167FC(D_80088AE8, D_80085A58[0]);
    if (D_80088AEE >= 0) {
        func_800AAEF0(D_80088AF0 - D_80088AEE, D_80085A58[2]);
    } else {
        *(Lit4 *)D_80085A58[2] = D_800005B4;
    }
    for (j = 0; j < 3; j++) {
        yards[j] = 0;
        counts[j] = 0;
    }
    n = func_80029944();
    for (j = 0; j < n; j++) {
        func_80029954(j, &record);
        switch (record.type & 0xF) {
        case 1:
            counts[0]++;
            yards[0] += record.value;
            break;
        case 2:
            counts[1]++;
            yards[1] += record.value;
            break;
        case 9:
            counts[2]++;
            yards[2] += record.value;
            break;
        }
    }
    line = 6;
    if (counts[0] != 0) {
        if (counts[0] != 1) {
            func_80090C00(D_80085A58[line], counts[0], yards[0], D_8006DB14);
        } else {
            func_80090C00(D_80085A58[line], 1, yards[0], D_8006DB20);
        }
        line++;
    }
    if (counts[1] != 0) {
        if (counts[1] != 1) {
            func_80090C00(D_80085A58[line], counts[1], yards[1], D_8006DB2C);
        } else {
            func_80090C00(D_80085A58[line], 1, yards[1], D_8006DB3C);
        }
        line++;
    }
    if (counts[2] != 0) {
        if (counts[2] != 1) {
            func_80090C00(D_80085A58[line], counts[2], yards[2], D_8006DB58);
        } else {
            func_80090C00(D_80085A58[line], 1, yards[2], D_8006DB48);
        }
    }
    if (counts[0] + counts[1] + counts[2] != 0) {
        func_800167FC(yards[0] + yards[1] + yards[2], D_80085A58[1]);
    } else {
        func_8002E65C(D_80085A58[1], number);
    }
    D_8006B98C.count = 10;
    D_80086BE4 = func_800AACE8(0x28, &D_8006B98C, 7);
    func_8002FEA4(D_8009153C, 10, 1)->unk_8 = 0;
    func_80028144();
    object_list_apply();
    if (D_80080C10 & 0x10) {
        func_800BC98C();
    }
    if (D_80089320 != -1) {
        D_80082DB4[D_80088AE4].data = D_8006AE48;
        D_80082DB4[D_80088AE4].entry = D_8006AECC;
        D_80082DB4[D_800886E0].data = D_8006AEF4;
        D_80082DB4[D_800886E0].entry = D_8006AF78;
    } else {
        D_80082DB4[D_80088AE4].data = &D_800C31E0[3];
        D_80082DB4[D_80088AE4].entry = &D_80072EE0[3];
        D_80082DB4[D_800886E0].data = &D_800C31E0[0];
        D_80082DB4[D_800886E0].entry = &D_80072EE0[0];
    }
    func_80038150(0);
    func_80038150(1);
    func_800BE784();
    func_800BCFAC();
    func_800E1EF8(0);
    func_800E1EF8(1);
    for (j = 0; j < D_8008B672 >> 1; j++) {
        object_active_callback_clear(D_80085040[0][j]);
        object_active_callback_clear(D_80085040[1][j]);
    }
    func_800A365C(0);
    func_800AEA9C(1);
}
