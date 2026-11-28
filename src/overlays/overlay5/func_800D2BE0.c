typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Text3 {
    char c[3];
} Text3;

typedef struct Ctx {
    u8 pad00[0x60];
    s32 alternate;
} Ctx;

extern Text3 D_80002024;
extern s32 D_800E7A58;
extern char D_80088118[][11];
extern s16 D_80088170[];
extern s16 D_80088180[];
extern s16 D_80088190[];
extern s16 D_800881F0[][8];
extern s16 D_80088270[][8];
extern s16 D_800882F0[][8];
extern s16 D_80088370[][8];
extern s16 D_800883F0[][8];

void func_800167FC(s32, char *);
void func_8002E65C(char *, const char *);

/*
 * func_800D2BE0: write the text for column `kind` of entry `arg0` into dest.  Entries at or
 * past the current selection D_800E7A58 are shifted by one (the selected entry is skipped).
 * Kind 0 copies the entry's 11-byte name; kinds 1-5 print a number from a per-kind s16 table,
 * the per-selection tables when ctx->alternate is set; kinds 4 and 5 have no plain table and
 * print the blank string D_80002024 instead.
 */
void func_800D2BE0(u32 arg0, s32 kind, char *dest, Ctx *ctx) {
    Text3 blank = D_80002024;
    u32 index;
    Ctx *c = ctx;

    index = arg0;
    if (index >= D_800E7A58) {
        index++;
    }

    switch (kind) {
    case 0:
        func_8002E65C(dest, D_80088118[index]);
        break;
    case 1:
        if (c->alternate) {
            func_800167FC(D_800881F0[D_800E7A58][index], dest);
        } else {
            func_800167FC(D_80088170[index], dest);
        }
        break;
    case 2:
        if (c->alternate) {
            func_800167FC(D_80088270[D_800E7A58][index], dest);
        } else {
            func_800167FC(D_80088180[index], dest);
        }
        break;
    case 3:
        if (c->alternate) {
            func_800167FC(D_800882F0[D_800E7A58][index], dest);
        } else {
            func_800167FC(D_80088190[index], dest);
        }
        break;
    case 4:
        if (c->alternate) {
            func_800167FC(D_80088370[D_800E7A58][index], dest);
        } else {
            func_8002E65C(dest, blank.c);
        }
        break;
    case 5:
        if (c->alternate) {
            func_800167FC(D_800883F0[D_800E7A58][index], dest);
        } else {
            func_8002E65C(dest, blank.c);
        }
        break;
    }
}
