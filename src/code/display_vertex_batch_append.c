#include "types.h"

typedef struct VertexInput {
    s16 value;
    u8 pad02[14];
} VertexInput;

extern u8 D_8007AB28;
extern u32 *D_8007AB24;
extern u32 D_80074A88;
extern u8 * volatile D_8007AB18;

u8 display_vertex_batch_append(VertexInput *vertices)
{
    VertexInput *saved_vertices = vertices;
    u16 index;
    u8 previous;

    if (D_8007AB28 == 32) {
        u32 *commands = D_8007AB24;
        u32 first = D_80074A88;
        u32 second = (u32)D_8007AB18;
        D_8007AB28 = 0;
        D_8007AB24 = commands + 2;
        commands[0] = first;
        commands[1] = second;
    }
    previous = D_8007AB28;
    index = 0;
    do {
        s32 value;
        do { vertices = (VertexInput *)D_8007AB18; } while (0);
        value = saved_vertices[index].value;
        *(s16 *)((u8 *)vertices + 0) = value;
        value = saved_vertices[index].value;
        *(s16 *)((u8 *)vertices + 2) = value;
        value = saved_vertices[index].value;
        D_8007AB18 = (u8 *)vertices + 0x10;
        *(s16 *)((u8 *)vertices + 6) = 0;
        *(s16 *)((u8 *)vertices + 4) = value;
        index++;
    } while (index < 8);
    D_8007AB28 += 8;
    return previous;
}
