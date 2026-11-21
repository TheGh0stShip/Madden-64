#include "types.h"

typedef struct GfxCommand {
    u32 w0;
    u32 w1;
} GfxCommand;

typedef struct Light {
    u8 color[4];
    u8 color_copy[4];
    s8 direction[4];
    u8 pad0C[4];
} Light;

typedef struct LightEntry {
    s32 direction[3];
    u8 pad0C[4];
    Light light;
    s32 enabled;
    u8 pad24[4];
} LightEntry;

extern GfxCommand *D_80084F5C;
extern LightEntry D_80078300[];
typedef struct AmbientLight {
    Light light;
    u8 color[4];
} AmbientLight;

extern AmbientLight D_80078418;

void runtime_record_copy(s32 *destination);
void matrix_stack_duplicate(void);
void func_8002CB50(s32 *source);
void vector_transform_to_bytes(LightEntry *input, s8 *output);
void *func_8000DE18(void);
void *memory_move_overlap(void *destination, void *source, u32 size);
void display_env_color_set(s32 r, s32 g, s32 b, s32 a);
void func_8000B0EC(u32 value);
void func_8002CD28(void);

void vector_display_emit(void) {
    s32 matrix[12];
    void *light;
    u32 i;
    u8 count;

    count = 1;
    runtime_record_copy(matrix);
    for (i = 0; i < 9; i++) {
        matrix[i] = matrix[i];
    }
    matrix_stack_duplicate();
    func_8002CB50(matrix);
    for (i = 0; i < 7; i++) {
        if (D_80078300[i].enabled != 0) {
            vector_transform_to_bytes(&D_80078300[i], D_80078300[i].light.direction);
            light = func_8000DE18();
            memory_move_overlap(light, &D_80078300[i].light, 0x10);
            {
                GfxCommand *command = D_80084F5C;

                D_80084F5C = command + 1;
                command->w0 = ((((count - 1) * 2 + 0x86) & 0xFF) << 16) | 0x03000010;
                command->w1 = (u32)light;
            }
            count++;
        }
    }
    light = func_8000DE18();
    memory_move_overlap(light, &D_80078418.light, 0x10);
    {
        GfxCommand *command = D_80084F5C;

        command->w0 = ((((count - 1) * 2 + 0x86) & 0xFF) << 16) | 0x03000010;
        command->w1 = (u32)light;
        D_80084F5C = command + 1;
    }
    display_env_color_set(D_80078418.color[0], D_80078418.color[1], D_80078418.color[2], 0xFF);
    func_8000B0EC(count - 1);
    func_8002CD28();
}
