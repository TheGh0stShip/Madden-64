typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Sprite {
    u8 pad00[0x10];
    u8 *data;
} Sprite;

typedef struct Panel {
    u8 pad00[8];
    Sprite *sprite;
} Panel;

typedef struct Target {
    u8 pad00[0x14];
    s32 flags;
} Target;

typedef struct Setup {
    u8 pad00[0x50];
    Panel *panels[4];
    u16 levels[4];
    s32 saved[4];
} Setup;

typedef struct Owner {
    u8 pad00[0x3C];
    s32 handle;
    Target *target;
    u8 pad44[0x1C];
    Setup *setup;
} Owner;

typedef struct Spec {
    s32 kind;
    s32 resource;
    s32 flags;
    s32 unkC;
    s16 value;
} Spec;

typedef struct Levels {
    s32 level[4];
} Levels;

extern Levels D_800023D4;
extern u8 D_800C2258[];
extern u8 D_80087970[4];

void *func_800DD634(void);
void func_800DA174(s32, Target *, s32, s32, s32);
u32 func_80030C74(u32 *);
void overlay5_resource_mode_notify(void);
void func_800D3C0C(u8 *, u16);
void func_800D67EC(void *, s16);
void func_800325C0(s32, s32, s32, s32);
void func_80092B98(void);
void func_800DF72C(void);
void func_80032984(s32 *, s32 *, s32 *, s32 *);
void overlay5_packed_event_dispatch(s32, s32, s32, s32);
void overlay5_runtime_stack_advance(void);

/*
 * func_800D9B5C: colour-adjust screen (mode 13).  Polls the controller (func_80030C74) until
 * A/START style keys finish: left/right (0x800/0x400) move the selected channel, down/up
 * (0x200/0x100) change its level (the last two channels in double steps, clamped to 0..0x35),
 * 4 resets the levels to the defaults D_800023D4, 0x4000 restores the saved levels and
 * finishes, 2 shows the help panel.  Each frame redraws through func_800325C0.  On exit the
 * chosen colour is stored to D_80087970 and the panels are dismissed.
 */
void func_800D9B5C(Owner *owner, s32 unused, s16 mode) {
    Spec spec;
    u32 input[2];
    Levels defaults;
    s32 red;
    s32 green;
    s32 blue;
    s32 alpha;
    s32 handle;
    Target *target;
    Setup *setup;
    u16 sel;
    s32 done;
    u32 key;
    s32 i;
    s32 k;
    s32 level;
    u32 idx;
    u32 j;

    sel = 0;
    done = 0;
    func_800DD634();
    handle = owner->handle;
    target = owner->target;
    setup = owner->setup;
    if (mode != 13) {
        return;
    }
    func_800DA174(handle, target, 0, 0, 1);
    target->flags |= 1;
    spec.resource = 0;
    spec.flags = 0;
    spec.value = 4;
    key = func_80030C74(input);
    do {
        switch (key) {
        case 0x800:
            idx = sel;
            if (idx != 0) {
                overlay5_resource_mode_notify();
                sel--;
                func_800DA174(handle, target, idx - 1, idx + 1, idx);
            }
            break;
        case 0x400:
            idx = sel;
            if (idx < 3) {
                overlay5_resource_mode_notify();
                sel++;
                func_800DA174(handle, target, idx + 1, idx + 1, idx + 2);
            }
            break;
        case 0x200:
            if ((s16)setup->levels[sel] > 0) {
                overlay5_resource_mode_notify();
                setup->levels[sel]--;
                if (sel >= 2 && (s16)setup->levels[sel] > 0) {
                    setup->levels[sel]--;
                }
                func_800D3C0C(setup->panels[sel]->sprite->data, setup->levels[sel] * 2 + 0xC2);
            }
            break;
        case 0x100:
            if ((s16)setup->levels[sel] < 0x35) {
                overlay5_resource_mode_notify();
                setup->levels[sel]++;
                if (sel >= 2 && (s16)setup->levels[sel] < 0x35) {
                    setup->levels[sel]++;
                }
                func_800D3C0C(setup->panels[sel]->sprite->data, setup->levels[sel] * 2 + 0xC2);
            }
            break;
        case 2:
            func_800D67EC(D_800C2258, 0);
            break;
        case 4:
            defaults = D_800023D4;
            i = 3;
            do {
                level = defaults.level[i] + 27;
                setup->levels[i] = level;
                if (i >= 2) {
                    setup->levels[i] = level * 2 - 1;
                    if ((s16)setup->levels[i] > 0x35) {
                        setup->levels[i] = 0x35;
                    }
                }
                func_800D3C0C(setup->panels[i]->sprite->data, setup->levels[i] * 2 + 0xC2);
            } while (i-- != 0);
            break;
        case 0x4000:
            k = 3;
            do {
                level = setup->saved[k] + 27;
                setup->levels[k] = level;
                if (k >= 2) {
                    setup->levels[k] = level * 2 - 1;
                    if ((s16)setup->levels[k] > 0x35) {
                        setup->levels[k] = 0x35;
                    }
                }
                func_800D3C0C(setup->panels[k]->sprite->data, setup->levels[k] * 2 + 0xC2);
            } while (k-- != 0);
        case 0x1000:
            done = 1;
            break;
        case 0x8000:
            done = 1;
            break;
        }
        func_800325C0((s16)setup->levels[0] - 27, (s16)setup->levels[1] - 27, (((s16)setup->levels[2] + 1) >> 1) - 27,
                      (((s16)setup->levels[3] + 1) >> 1) - 27);
        func_80092B98();
        key = func_80030C74(input);
    } while (!done);
    func_800DF72C();
    func_80032984(&red, &green, &blue, &alpha);
    D_80087970[0] = red;
    D_80087970[1] = green;
    D_80087970[2] = blue;
    D_80087970[3] = alpha;
    target->flags &= ~1;
    overlay5_packed_event_dispatch(handle, 0xFA, 2, 10);
    for (j = 0; j < 4; j++) {
        overlay5_packed_event_dispatch((s32)setup->panels[j], 0xFA, 2, 10);
    }
    overlay5_runtime_stack_advance();
}
