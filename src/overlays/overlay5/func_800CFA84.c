#include "types.h"

typedef struct {
    /* 0x00 */ u8 kind;
    /* 0x01 */ u8 unk_01[3];
    /* 0x04 */ u16 mode;
    /* 0x06 */ s16 time;
    /* 0x08 */ s8 yards;
    /* 0x09 */ u8 plays;
    /* 0x0A */ u8 unk_0A;
    /* 0x0B */ u8 unk_0B;
} SummaryEntry;

typedef struct {
    /* 0x00 */ u32 count;
    /* 0x04 */ SummaryEntry *entries[1];
} SummaryList;

typedef struct {
    /* 0x00 */ u8 unk_00[0x60];
    /* 0x60 */ SummaryList *list;
} SummaryOwner;

typedef struct {
    char text[17];
} SummaryText;

extern char D_8006BFA0[];
extern char D_80080CE5[];
extern char D_80082E31[];

void func_800167FC(s16 value, char *buf);
void func_8002E65C(char *dst, char *src);
void func_8002E688(char *dst, char *src);
void func_800CFD5C(u32 index, SummaryList *list, char *out);
void overlay5_mode_text_format(u32 mode, char *out);
void overlay5_time_text_format(s16 time, char *out);

void func_800CFA84(u32 index, u32 type, char *out, SummaryOwner *owner)
{
    char number[20];
    char drive[] = " YD DRIVE";
    char play[] = " PLAY ";
    char top[] = "T.O.P.";
    SummaryList *list = owner->list;

    if (list->count == 0 && type == 1 && index == 0) {
        *(SummaryText *)out = *(SummaryText *)"NO SUMMARIES YET";
        return;
    }
    if (index < list->count) {
        switch (type) {
            case 0:
                overlay5_mode_text_format(list->entries[index]->mode >> 13, out);
                return;
            case 1:
                func_800CFD5C(index, list, out);
                return;
            case 4:
                if (list->entries[index]->kind != 8 && list->entries[index]->plays != 0) {
                    func_800167FC(list->entries[index]->plays, out);
                    func_8002E688(out, play);
                    func_800167FC(list->entries[index]->yards, number);
                    func_8002E688(out, number);
                    func_8002E688(out, drive);
                    return;
                }
                break;
            case 5:
                if (list->entries[index]->kind != 8) {
                    func_8002E65C(out, top);
                    return;
                }
                break;
            case 6:
                if (list->entries[index]->kind != 8) {
                    overlay5_time_text_format(list->entries[index]->time, out);
                    return;
                }
                break;
            case 2:
                func_8002E65C(out, D_80080CE5);
                return;
            case 3:
                func_800167FC(list->entries[index]->unk_0A, out);
                return;
            case 7:
                func_8002E65C(out, D_80082E31);
                return;
            case 8:
                func_800167FC(list->entries[index]->unk_0B, out);
                return;
            default:
                return;
        }
    }
    func_8002E65C(out, D_8006BFA0);
}
