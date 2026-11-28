#include "types.h"

typedef struct {
    s32 id;
    s16 x04;
    s16 x06;
    s16 x08;
    s16 pad0A;
    s32 x0C;
    s32 x10;
    s32 pad14[5];
} Request;

typedef struct {
    u8 done;
    u8 mode;
    u8 page;
    u8 busy;
    u8 pad04[0xC];
    s32 group[2];
} State;

typedef struct {
    u8 pad00[0x48];
    s32 x48;
    s32 pad4C;
    s32 x50;
} Menu;

typedef struct {
    u8 flags;
    u8 pad01;
    u16 song;
    u16 track;
    u8 name[0x1A];
    s32 x20;
    s32 x24;
    s32 x28;
} Entry;

typedef struct {
    s32 count;
    void *items[8];
} List;

typedef struct {
    u8 pad00[0x60];
    State *state;
    u8 pad64[0x10];
    List list;
} Obj;

extern Entry D_800BDFF4[];
extern Entry D_800BEAC8[];
extern s16 D_800E7A90;
extern s16 D_800E7A92;
extern s16 D_800E7A94;
extern s16 D_800E7A96;
extern s16 D_800E7A98;
extern s16 D_800E7A9A;
extern s16 D_800E7B88;
extern s16 D_800E7B8A;
extern u16 D_800E7A74;
extern s32 D_800E7A78;
extern s32 D_800E7A7C;
extern s32 D_8008931C;

Menu *func_800DD634(void);
void func_800363F4(u16, s32, s32);
void func_80016FF4(s32);
void func_8000D834(s32, s32);
u16 func_80016FD4(void);
void func_8003647C(u16, s32);
s32 func_80036540(s32);
void func_80092B98(void);
s32 func_8000D8DC(s32, Request *);
void func_80016FE4(s32);
void func_8001EC20(s32, s32);

/* Shows the two music-test entries of the current page: for each, sets the
 * selected song (clamped to 45), retriggers playback when it changed, reloads
 * the entry's track, and refreshes its four labels; advances the page by two. */
void func_800A7014(Obj *obj) {
    State *state;
    Menu *menu;
    List *list;
    Entry *entry;
    Request request;
    s16 *song;
    s16 *last;
    s16 *pending;
    s16 *song2;
    s16 *last2;
    s16 *pending2;

    state = obj->state;
    list = &obj->list;
    menu = func_800DD634();
    if (state->mode == 0) {
        entry = &D_800BDFF4[state->page];
    } else {
        entry = &D_800BEAC8[state->page];
    }
    song = &D_800E7A90;
    *song = entry->song;
    if (*song >= 45) {
        *song = 0;
    }
    last = &D_800E7A98;
    if (*song != *last) {
        pending = &D_800E7B88;
        if (*pending != -1) {
            *last = *song;
            D_800E7A94 = *song;
            func_800363F4(D_800E7A74, *song, D_800E7A78);
            *pending = -1;
        } else {
            D_800E7A94 = *song;
        }
    }
    if (menu->x48 != 0) {
        func_80016FF4(menu->x48);
        func_8000D834(D_8008931C, menu->x48);
        menu->x48 = 0;
    }
    if (!(entry->flags & 2)) {
        func_8003647C(func_80016FD4(), entry->track);
        while (func_80036540(1)) {
            func_80092B98();
        }
        request.x0C = 0;
        request.x06 = 0;
        request.x08 = 0;
        request.x04 = 2;
        request.x10 = 0;
        request.id = entry->track;
        menu->x48 = func_8000D8DC(0, &request);
        func_80016FE4(menu->x48);
    }
    list->items[0] = entry->name;
    list->items[1] = (void *)entry->x20;
    list->items[2] = (void *)entry->x24;
    list->items[3] = (void *)entry->x28;
    func_8001EC20(state->group[0], 1);
    func_8001EC20(state->group[0], 2);
    func_8001EC20(state->group[0], 3);
    func_8001EC20(state->group[0], 4);
    if (entry->flags & 1) {
        state->busy = 1;
        state->page = 0;
        return;
    }
    entry++;
    song2 = &D_800E7A92;
    *song2 = entry->song;
    if (*song2 >= 45) {
        *song2 = 0;
    }
    last2 = &D_800E7A9A;
    if (*song2 != *last2) {
        pending2 = &D_800E7B8A;
        if (*pending2 != -1) {
            *last2 = *song2;
            D_800E7A96 = *song2;
            func_800363F4(D_800E7A74, *song2, D_800E7A7C);
            *pending2 = -1;
        } else {
            D_800E7A96 = *song2;
        }
    }
    if (menu->x50 != 0) {
        func_80016FF4(menu->x50);
        func_8000D834(D_8008931C, menu->x50);
        menu->x50 = 0;
    }
    if (!(entry->flags & 2)) {
        func_8003647C(func_80016FD4(), entry->track);
        while (func_80036540(1)) {
            func_80092B98();
        }
        request.x0C = 0;
        request.x06 = 0;
        request.x08 = 0;
        request.x04 = 2;
        request.x10 = 0;
        request.id = entry->track;
        menu->x50 = func_8000D8DC(0, &request);
        func_80016FE4(menu->x50);
    }
    list->items[4] = entry->name;
    list->items[5] = (void *)entry->x20;
    list->items[6] = (void *)entry->x24;
    list->items[7] = (void *)entry->x28;
    func_8001EC20(state->group[1], 5);
    func_8001EC20(state->group[1], 6);
    func_8001EC20(state->group[1], 7);
    func_8001EC20(state->group[1], 8);
    if (entry->flags & 1) {
        state->page = 0;
    } else {
        state->page += 2;
    }
    state->busy = 0;
}
