#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad00[0x28];
    s32 mode;
} WindowData;

typedef struct {
    u8 pad00[8];
    WindowData *data;
} Window;

typedef struct {
    s32 style;
    u8 pad04[0x28];
    s32 content;
} WindowDesc;

typedef struct {
    s32 portrait;
    u8 pad04[0xAC];
} Coach;

typedef struct {
    u8 pad00[0x24];
    s32 portrait;
} Member;

typedef struct {
    Member *members[22];
} Group;

extern s32 D_80069AE8;
extern WindowDesc D_80069B18;
extern Window *D_80069B40;
extern Group D_80085040[];

extern Coach D_8008715C[];
extern s32 D_8008762C;
extern s32 D_80087A64;

Window *func_8000D740(s32, s32, WindowDesc *);
void func_80033B20(Window *, s32);
void func_80095104(Window *);
void func_8009562C(Window *);

void func_80098A4C(void) {
    Window *window;
    Member *member;
    s32 i;
    s32 t;
    s32 count;

    D_80069B40 = NULL;
    D_80069B18.style = D_80069AE8;
    D_80069B18.content = D_8008762C;
    window = func_8000D740(D_80087A64, 0xB, &D_80069B18);
    func_80095104(window);
    window->data->mode = 0x300;
    func_80033B20(window, 1);
    func_8009562C(window);
    D_80069B40 = window;
    i = 7;
    while (i-- != 0) {
        if (D_8008715C[i].portrait != 0) {
            D_80069B18.content = D_8008715C[i].portrait;
            func_80095104(func_8000D740(D_80087A64, 0xB, &D_80069B18));
        }
    }
    count = 11;
    t = 2;
    while (t-- != 0) {
        i = count;
        while (i-- != 0) {
            member = D_80085040[t].members[i];
            if (member != NULL && member->portrait != 0) {
                D_80069B18.content = member->portrait;
                func_80095104(func_8000D740(D_80087A64, 0xB, &D_80069B18));
            }
        }
    }
    D_80069B40 = NULL;
    D_80069B18.content = 0;
}
