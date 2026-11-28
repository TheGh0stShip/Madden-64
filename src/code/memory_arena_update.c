#include "types.h"

/*
 * memory_arena_update: advance an object's animation script by `ticks`.
 *
 * The script is a list of 16-bit commands.  While the state's timer has run out, the next
 * command is interpreted by its top two bits: 0x0000 shows a frame (and adds the current
 * duration to the timer), 0xC000 sets that duration, 0x4000 does nothing, and 0x8000
 * selects a control command by its high byte: jump (0x81), set a flag bit (0x82), set a
 * global (0x84), move along or across the camera heading (0x85 / 0x87), face a heading
 * relative to the camera (0x86), place the object at a packed offset (0x91), start a sound
 * (0x92), and end the script clearing its flags (0xBE / 0xBF).  The catalogue name
 * predates this reading and is kept.
 */

typedef struct AnimScript {
    u16 count;
    u16 data[1];
} AnimScript;

typedef struct AnimState {
    u8 pad0[4];
    AnimScript *script;
    u16 pc;
    s16 timer;
    u16 duration;
    u8 padE[2];
    u16 elapsed;
    s16 heading;
} AnimState;

typedef struct AnimObject {
    u8 pad0[8];
    AnimState *state;
    u8 padC[8];
    s32 flags;
    s32 frame;
    s32 position[3];
} AnimObject;

typedef struct Camera {
    u8 pad0[0x14];
    s16 heading;
} Camera;

extern Camera *D_8007A458;
extern s16 D_80088470;

s32 func_8000C8EC(Camera *);
s32 func_8002E828(s32);
s32 func_8002E848(s32);
void func_80043E7C(AnimObject *, s32 *, s32);
void func_800E0E34(s32);

void memory_arena_update(AnimObject *object, s32 ticks) {
    AnimState *state = object->state;
    AnimScript *script = state->script;
    s32 word;
    s32 vector[3];

    if (script == 0) {
        return;
    }
    state->timer -= ticks;
    state->elapsed += ticks;
    while (state->timer <= 0) {
        word = script->data[state->pc];
        switch (word & 0xC000) {
            case 0x4000:
                break;
            case 0x8000:
                switch (word & 0xFF00) {
                    case 0x8100:
                        state->pc = word & 0xFF;
                        state->elapsed = 0;
                        break;
                    case 0x8200:
                        state->pc++;
                        object->flags |= 1 << ((word & 3) + 18);
                        break;
                    case 0x8400:
                        state->pc++;
                        D_80088470 = word & 0xFF;
                        break;
                    case 0x8500: {
                        s32 amount = (s8)word;
                        s32 angle = (func_8000C8EC(D_8007A458) != 0) << 11;
                        s32 dx = func_8002E848(angle - D_8007A458->heading) * amount;
                        s32 dz = amount * func_8002E828(angle - D_8007A458->heading);
                        object->position[1] += dx;
                        object->position[0] += dz;
                        state->pc++;
                        break;
                    }
                    case 0x8600: {
                        s32 amount;
                        s32 offset;
                        word &= 7;
                        amount = word;
                        if (func_8000C8EC(D_8007A458) != 0) {
                            amount = word + 4;
                        }
                        offset = -amount * 0x200 - 0x100;
                        state->heading = D_8007A458->heading - offset;
                        state->pc++;
                        break;
                    }
                    case 0x8700: {
                        s32 amount = (s8)word;
                        s32 angle = !func_8000C8EC(D_8007A458) ? -0x4000 : 0x4000;
                        s32 dx = func_8002E848(angle - D_8007A458->heading) * amount;
                        s32 dz = amount * func_8002E828(angle - D_8007A458->heading);
                        object->position[1] += dx;
                        object->position[0] += dz;
                        state->pc++;
                        break;
                    }
                    case 0x9100:
                        vector[0] = (s8)word;
                        word = script->data[state->pc + 1];
                        vector[0] = vector[0] << 12;
                        vector[1] = (s8)(word >> 8);
                        vector[2] = (s8)word;
                        vector[1] = vector[1] << 12;
                        vector[2] = vector[2] << 12;
                        func_80043E7C(object, vector, 0);
                        object->position[0] = vector[0];
                        object->position[1] = vector[1];
                        object->position[2] = vector[2];
                        state->pc += 2;
                        break;
                    case 0x9200:
                        func_800E0E34((word & 0xFF) * 16);
                        state->pc++;
                        break;
                    case 0xBE00:
                        state->timer = 1;
                        state->script = 0;
                        state->elapsed = 0;
                        object->flags &= ~0x30000;
                        break;
                    case 0xBF00:
                        state->timer = 1;
                        state->script = 0;
                        state->elapsed = 0;
                        object->flags &= ~0x20000;
                        break;
                }
                break;
            case 0xC000:
                state->duration = word & 0x3FFF;
                state->pc++;
                break;
            default:
                state->pc++;
                object->frame = word;
                state->timer += state->duration;
                break;
        }
    }
}
