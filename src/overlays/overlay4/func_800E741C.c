#include "types.h"

typedef struct {
    u8 pad00[0x16];
    u16 frame;
} Playback;

typedef struct {
    u8 pad00[0x8];
    Playback *playback;
} Track;

typedef struct {
    u8 pad00[0x206];
    u16 flags;
} Movie;

typedef struct {
    Movie *movie;
    u8 pad04[0x4];
    Track *track;
} MovieInner;

typedef struct {
    s32 id;
    MovieInner *inner;
} MovieHandle;

typedef struct {
    u8 pad00[0x1E];
    u16 cueFrame;
    u16 flags;
    u8 pad22[0x25 - 0x22];
    s8 cue;
    u8 pad26[0x30 - 0x26];
} MovieCue;

extern s32 D_8008B3D0;
extern MovieHandle D_8007AB38;
extern MovieCue D_8006A520[];
extern void func_8000C930(s32 *arg0, s32 arg1, s32 arg2, s32 arg3);
extern void func_8000BEE8(s32 arg0);
extern u32 func_80021500(MovieHandle *handle, s32 x, s32 y, s32 width, s32 height);
extern void func_800412DC(Track *track, s32 arg1);
extern void func_80030910(void);
extern s32 func_80030DF0(void);
extern void func_8000BF08(void);
extern void func_8004583C(void);
extern void func_8000CE10(Movie *movie, s32 arg1, s32 cue);
extern void func_80030110(void);
extern void func_80030050(void);
extern void func_800217F4(MovieHandle *handle);

s32 func_800E741C(s32 arg0, s32 id) {
    Movie *movie;
    Track *track;
    Playback *playback;
    u32 length;
    s32 buttons;
    s32 cued;

    func_8000C930(&D_8008B3D0, 0, 0, 0);
    func_8000BEE8(4);
    D_8007AB38.id = id;
    buttons = 0;
    length = func_80021500(&D_8007AB38, 0, 0, 0x140, 0xF0);
    track = D_8007AB38.inner->track;
    movie = D_8007AB38.inner->movie;
    playback = track->playback;
    cued = 0;
    if (id == 9) {
        func_800412DC(track, 3);
    }
    if (playback->frame < length && (movie->flags & 8)) {
        do {
            func_80030910();
            buttons = func_80030DF0();
            func_8000BF08();
            func_8004583C();
            if ((D_8006A520[id].flags & 2) && playback->frame >= D_8006A520[id].cueFrame && (cued ^ 1)) {
                func_8000CE10(movie, 0, D_8006A520[id].cue);
                cued = 1;
            }
            func_80030110();
            func_80030050();
        } while (playback->frame < length && (movie->flags & 8) && !(buttons & 0x1000));
    }
    func_800217F4(&D_8007AB38);
    return (buttons & 0x1000) ? -1 : 1;
}
