#include "types.h"

typedef struct {
    void (*enter)(void *buffer);
    void (*event)(void *buffer, void *data, s32 code);
    void (*leave)(void *buffer);
    void *resource;
    u8 pad10[8];
    s16 id;
    u8 pad1A[2];
    u16 flags;
} RuntimeConfig;

typedef struct {
    u8 pad00[0x10];
    void *resource;
} Panel;

typedef struct {
    void *field00;
    RuntimeConfig *config;
    RuntimeConfig *next;
    void *buffer;
    u8 mode;
    u8 previous_mode;
    s8 field12;
    s8 field13;
    u8 pad14[0x5C];
    void *owner70;
    u8 pad74[0x1C];
    void *field90;
    u8 pad94[4];
    s32 field98;
} RuntimeState;

extern RuntimeState *D_80072380;
extern s32 D_8007238C;
extern void *D_80072390;
extern s16 D_80084F58;
extern void *D_80086DD8;
extern u8 D_800908B8[];

void func_8000BF08(void);
void func_80011308(void);
void *func_80011AA8(void *);
void func_80011B4C(void);
void func_80030050(void);
void func_80030110(void);
void func_80030A28(void);
void *func_80030B54(s16 index);
void *func_80030DF0(void);
void func_80031964(void);
void func_80094AB0(void *owner);
void func_800DD5E8(void *buffer, s32 size);
void func_800DD8C4(void);
void func_800DDDC4(void);
void func_800DF72C(void);
s32 func_800E01F8(void *, void **);
Panel *func_800E09F8(void);
void func_800E0D10(void);
s32 func_800E0E58(void);
void func_800E10D8(RuntimeState *state, void *input);
s32 func_800E11AC(RuntimeState *state);
void func_800E1220(RuntimeState *state);
void overlay5_resource_enqueue(void *resource);
void overlay5_runtime_stack_advance(void);

u8 func_800DCC14(void) {
    void *data;
    s16 code;

    switch (D_80072380->mode) {
    case 0:
        if ((u8)func_800E0E58() == 0) {
            if (D_80072380->config->leave != 0) {
                D_80072380->config->leave(D_80072380->buffer);
            }
            D_80072380->field98 = 0;
            if (D_80072380->next == 0) {
                D_80072380->mode = 7;
            } else {
                D_80072380->mode = 1;
                if (D_80072380->config->id != D_80072380->next->id && D_80072380->field90 != 0) {
                    func_80094AB0(D_80072380->owner70);
                    D_80072380->field90 = 0;
                }
                D_80072380->config = D_80072380->next;
            }
        }
        break;
    case 1:
        func_800DDDC4();
        func_800DD5E8(D_80072380->buffer, 0x800);
        func_800DD8C4();
        D_80072380->config->enter(D_80072380->buffer);
        D_8007238C = 1;
        func_800E0D10();
        D_80072380->mode = 2;
        break;
    case 2:
        if ((u8)func_800E0E58() == 0) {
            D_80072380->mode = 3;
            D_80072380->field98 = 0;
            if (D_80072380->config->event != 0) {
                D_80072380->config->event(D_80072380->buffer, 0, 0xD);
            }
        }
        break;
    case 3:
        if (D_80072380->field13 == -1) {
            D_80072390 = func_80030DF0();
        } else if (D_80072380->field13 == -2) {
            D_80072390 = 0;
        } else {
            D_80072390 = func_80030B54(D_80072380->field13);
        }
        if (D_80072390 != 0) {
            D_80072390 = func_80011AA8(D_80072390);
        }
        code = (u8)func_800E01F8(D_80072390, &data);
        D_80084F58 = code;
        switch (code) {
        case 0x11:
            if (D_80072380->config->event != 0) {
                D_80072380->config->event(D_80072380->buffer, data, 0x11);
            }
            if (!(D_80072380->config->flags & 0x40)) {
                if (D_80072380->config->flags & 0x20) {
                    overlay5_resource_enqueue(0);
                    func_800DF72C();
                } else if (D_80072380->field12 >= 0) {
                    overlay5_runtime_stack_advance();
                    func_800DF72C();
                }
            }
            break;
        case 0x10:
            data = func_800E09F8();
            if (data != 0 && ((Panel *)data)->resource != 0) {
                func_800E10D8(D_80072380, ((Panel *)data)->resource);
                D_80072380->previous_mode = D_80072380->mode;
                D_80072380->mode = 5;
            } else if (D_80072380->config->resource != 0) {
                func_800E10D8(D_80072380, D_80072380->config->resource);
                D_80072380->previous_mode = D_80072380->mode;
                D_80072380->mode = 5;
            }
            if (D_80072380->config->event != 0) {
                D_80072380->config->event(D_80072380->buffer, data, 0x10);
            }
            break;
        default:
            if (D_80072380->config->event != 0) {
                D_80072380->config->event(D_80072380->buffer, data, code);
            }
            break;
        }
        break;
    case 6:
        if (D_80072380->field13 == -1) {
            D_80072390 = func_80030DF0();
        } else {
            D_80072390 = func_80030B54(D_80072380->field13);
        }
        D_80084F58 = (u8)func_800E01F8(D_80072390, &data);
        if (D_80084F58 == 0x10) {
            data = func_800E09F8();
            if (((Panel *)data)->resource != 0) {
                func_800E10D8(D_80072380, ((Panel *)data)->resource);
                D_80072380->previous_mode = D_80072380->mode;
                D_80072380->mode = 5;
            } else if (D_80072380->config->resource != 0) {
                func_800E10D8(D_80072380, D_80072380->config->resource);
                D_80072380->previous_mode = D_80072380->mode;
                D_80072380->mode = 5;
            }
        }
        break;
    case 4:
        if (D_80072380->config->event != 0) {
            D_80072380->config->event(D_80072380->buffer, 0, 0xC);
        }
        D_8007238C = 0;
        if (D_80086DD8 != D_800908B8) {
            func_80011B4C();
        }
        if (D_80072380->next != 0) {
            func_80011308();
        }
        func_800E0D10();
        D_80072380->mode = 0;
        break;
    case 8:
        if ((u8)func_800E0E58() == 0) {
            D_80072380->mode = D_80072380->previous_mode;
            if (D_80072380->config->event != 0) {
                D_80072380->config->event(D_80072380->buffer, data, 0xE);
            }
        }
        break;
    case 5:
        if ((s16)func_800E11AC(D_80072380) == 0x11) {
            func_800E1220(D_80072380);
            D_80072380->mode = D_80072380->previous_mode;
        }
        break;
    }
    func_80030110();
    func_80030050();
    if (!(D_80072380->config->flags & 0x80)) {
        func_8000BF08();
    }
    func_80030A28();
    func_80031964();
    return D_80072380->mode;
}
