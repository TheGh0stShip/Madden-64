#include "types.h"

typedef struct ScriptState {
    u32 value;
    u8 pad4[0x44];
    u32 delay;
    u8 pad4C[0x20];
    u32 restart_value;
} ScriptState;

void func_80040C04(s16 *script, u32 *position, ScriptState *state)
{
    s32 opcode;
    u64 stack_padding;

    __asm__("" : : "m"(stack_padding));

    if (state->delay != 0) {
        state->delay--;
        return;
    }

    opcode = script[*position];
    switch (opcode & 0xF000) {
    case 0x0000:
        state->value = opcode & 0xFFF;
        break;
    case 0x1000:
        state->delay = opcode & 0xFFF;
        break;
    case 0x2000:
        goto restart;
    case 0x3000:
    case 0x4000:
    case 0x5000:
    case 0x6000:
    case 0x7000:
    case 0x8000:
    case 0x9000:
        break;
    default:
        return;
    }
    (*position)++;
    return;

restart:
    *position = 0;
    state->value = state->restart_value;
    func_80040C04(script, position, state);
}
