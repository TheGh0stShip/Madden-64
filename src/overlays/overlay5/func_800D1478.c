#include "types.h"

typedef struct {
    u8 unk_00[8];
    s32 unk_08;
    u8 unk_0C[0x9F];
    u8 unk_AB[0x3C];
    char unk_E7[0x40];
    u8 unk_127;
    s8 unk_128;
    u8 unk_129;
    u8 unk_12A;
} Overlay5Entry;

typedef struct {
    char *unk_00;
    s32 unk_04;
    s32 unk_08;
} Overlay5Name;

typedef struct {
    s32 count;
    char *items[3];
} Overlay5Result;

typedef struct {
    s32 kind;
    char *items[3];
    s32 unk_10;
} Overlay5Query;

extern char D_80001F54[];
extern char D_80001F58[];
extern Overlay5Name D_80069ED8[];
extern char D_8006BDCC[];
extern char D_8006BFA0[];
extern char D_8006C01C[];
extern char D_8006C034[];
extern char D_8006C054[];
extern char D_8006C10C[];
extern char D_8006C16C[];
extern char D_8006C194[];
extern char D_8006C1A0[];
extern char D_8006C1C8[];
extern char D_8006C1F8[];
extern char D_8006D01C[];
extern char D_8006DA18[];
extern char D_8006DA28[];
extern char D_8006DEF0[];
extern u8 D_80088AF3;

void func_800167FC(s16 value, char *buf);
void func_8001EC20(s32 handle, s32 index);
char *func_80022A3C(s32 side, s32 team);
void func_80029954(s32 value, u8 *out);
s32 func_8002E628(char *a, char *b);
void func_8002E65C(void *dst, void *src);
void func_8002E688(void *dst, void *src);
void func_8003DDF8(void *text, Overlay5Query *query, Overlay5Result *result, s32 width, s32 flags);
void func_8003E23C(Overlay5Result *result);

void func_800D1478(Overlay5Entry *entry, s32 value) {
    char first[0x18];
    char second[0x18];
    char number[8];
    Overlay5Result result;
    Overlay5Query query;
    u32 i;
    u8 type;

    func_80029954((u8)value, &entry->unk_127);
    func_8002E65C(entry->unk_E7, D_8006BFA0);
    switch (entry->unk_127 & 0x7F) {
    case 1:
        func_8002E65C(entry->unk_AB, D_8006C01C);
        break;
    case 2:
        func_8002E65C(entry->unk_AB, D_8006C034);
        break;
    case 9:
        func_8002E65C(entry->unk_AB, D_8006BDCC);
        func_8002E688(entry->unk_AB, D_80001F54);
        if (entry->unk_12A < 19) {
            func_8002E688(entry->unk_AB, D_80069ED8[entry->unk_12A].unk_00);
        }
        func_8002E688(entry->unk_AB, D_8006C16C);
        break;
    case 4:
        func_8002E65C(entry->unk_AB, D_8006D01C);
        break;
    case 5:
        func_8002E65C(entry->unk_AB, D_8006DA28);
        break;
    case 6:
        func_8002E65C(entry->unk_AB, D_8006DA18);
        break;
    case 8:
        func_8002E65C(entry->unk_AB, D_8006DEF0);
        break;
    case 10:
        func_8002E65C(entry->unk_AB, D_8006C194);
        break;
    case 11:
        func_8002E65C(entry->unk_AB, D_8006C1A0);
        break;
    case 7:
        if (entry->unk_12A != 0) {
            func_8002E65C(entry->unk_AB, D_8006C10C);
        } else {
            func_8002E65C(entry->unk_AB, D_8006C1C8);
        }
        break;
    }
    if ((entry->unk_127 & 0x7F) == 1 || (entry->unk_127 & 0x7F) == 2 || (entry->unk_127 & 0x7F) == 9 || (entry->unk_127 & 0x7F) == 7) {
        result.count = 3;
        query.kind = 4;
        query.items[0] = first;
        query.items[1] = second;
        query.items[2] = number;
        func_800167FC(entry->unk_128, number);
        if ((entry->unk_127 & 0x7F) == 2) {
            if (entry->unk_12A == 0xFF) {
                func_8002E65C(entry->unk_AB, D_8006C054);
                func_8002E65C(first, D_8006BFA0);
            } else if ((entry->unk_129 & 0x80) == (entry->unk_12A & 0x80)) {
                func_8002E65C(first, func_80022A3C(D_80088AF3, entry->unk_12A & 0x7F));
            } else {
                func_8002E65C(first, func_80022A3C(D_80088AF3 ^ 1, entry->unk_12A & 0x7F));
                func_800167FC(-entry->unk_128, number);
                func_8002E65C(entry->unk_AB, D_8006C1F8);
            }
            func_8002E65C(second, func_80022A3C(D_80088AF3, entry->unk_129 & 0x7F));
        } else {
            func_8002E65C(first, func_80022A3C(D_80088AF3, entry->unk_129 & 0x7F));
            func_8002E65C(second, D_8006BFA0);
        }
        if (func_8002E628(number, D_80001F58) == 0) {
            for (i = 0; i < 0x26; i++) {
                if (entry->unk_AB[i] == 0) {
                    break;
                }
            }
            i -= 2;
            entry->unk_AB[i] = '.';
            entry->unk_AB[i + 1] = 0;
        }
        func_8003DDF8(entry->unk_AB, &query, &result, 0xD2, 0);
        func_8002E65C(entry->unk_AB, result.items[0]);
        if (result.items[1] != 0) {
            func_8002E65C(entry->unk_E7, result.items[1]);
        }
        func_8003E23C(&result);
    }
    func_8001EC20(entry->unk_08, 0xE);
    func_8001EC20(entry->unk_08, 0xF);
}
