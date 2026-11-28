typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Side {
    u8 pad00[0xC];
    s32 unkC;
    s32 unk10;
    s32 unk14;
    u8 pad18[4];
    u16 flags;
} Side;

typedef struct Marker {
    u8 pad00[0x1C];
    s32 unk1C;
} Marker;

typedef struct Context {
    u8 pad00[4];
    Side *home;
    Side *away;
    u8 pad0C[0x6C];
    Marker *marker78;
    Marker *marker7C;
    Marker *marker80;
    Marker *marker84;
    Marker *marker88;
    u8 pad8C[8];
    Marker *marker94;
    void *node98;
} Context;

typedef struct ListInput {
    Marker *source;
    s16 value;
    u8 type;
    u8 flags;
} ListInput;

extern Context *D_80072380;

void *func_800E0BB4(ListInput *input);

/*
 * func_800DE074: queue the field markers of the current runtime state (D_80072380) into the
 * display list (func_800E0BB4).  The first-down marker (0x78) and the line marker (0x7C) are
 * shown when there is no away side value or it differs from the home side's; the remaining
 * markers are shown unless the away side's flags hide them.  Values +/-0x145 place a marker
 * on the side selected by the home flags.
 */
void func_800DE074(void) {
    ListInput input;
    Context *ctx;
    s16 show;
    Marker *marker;

    ctx = D_80072380;
    show = 0;
    if (ctx->away != 0 && ctx->away->unk10 != 0) {
        if (ctx->home->unk10 != ctx->away->unk10) {
            show = ctx->marker78 != 0;
        }
    } else if (ctx->marker78 != 0) {
        show = 1;
    }
    if (show == 1) {
        input.source = D_80072380->marker78;
        input.type = 0;
        input.flags = 10;
        if (D_80072380->home->flags & 8) {
            input.value = -0x145;
            input.type = 1;
        } else {
            input.value = 0x145;
            input.type = 0;
        }
        func_800E0BB4(&input);
        marker = D_80072380->marker80;
        if (marker != 0 && (D_80072380->home->flags & 0x10)) {
            input.flags = 10;
            input.value = -0x145;
            input.source = marker;
            input.type = 1;
            func_800E0BB4(&input);
        }
    }

    ctx = D_80072380;
    show = 0;
    if (ctx->away != 0 && ctx->away->unk14 != 0) {
        if (ctx->home->unk14 != ctx->away->unk14) {
            show = ctx->marker7C != 0;
        }
    } else if (ctx->marker7C != 0) {
        show = 1;
    }
    if (show == 1) {
        input.source = D_80072380->marker7C;
        input.source->unk1C = 0;
        input.value = 0x145;
        input.type = 0;
        input.flags = 10;
        func_800E0BB4(&input);
    }

    if (D_80072380->away == 0 || !(D_80072380->away->flags & 1)) {
        if (D_80072380->marker84 != 0) {
            input.source = D_80072380->marker84;
            input.source->unk1C = 0;
            input.value = 0x145;
            input.type = 0;
            input.flags = 10;
            D_80072380->node98 = func_800E0BB4(&input);
        }
    }
    if (D_80072380->away == 0 || !(D_80072380->away->flags & 2)) {
        if (D_80072380->marker80 != 0) {
            input.source = D_80072380->marker80;
            input.value = 0xF5;
            input.flags = 10;
            if (D_80072380->home->flags & 0x10) {
                input.value = -0x145;
                input.type = 1;
            } else {
                input.value = 0xF5;
                input.type = 2;
            }
            func_800E0BB4(&input);
        }
    }
    if (D_80072380->away == 0 || D_80072380->away->unkC == 0) {
        if (D_80072380->marker88 != 0) {
            input.source = D_80072380->marker88;
            input.source->unk1C = 0;
            input.value = 0x145;
            input.type = 0;
            input.flags = 7;
            func_800E0BB4(&input);
        }
    }
    if (D_80072380->away == 0 || !(D_80072380->away->flags & 4)) {
        if (D_80072380->marker94 != 0) {
            input.source = D_80072380->marker94;
            input.source->unk1C = 0;
            input.value = 0x145;
            input.type = 0;
            input.flags = 10;
            func_800E0BB4(&input);
        }
    }
}
