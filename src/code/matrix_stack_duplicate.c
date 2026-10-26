#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

#define COPY_CELL(offset) do { \
    current = *(s32 *)((u8 *)D_80085E68 + source_offset + (offset)); \
    *(s32 *)((u8 *)D_80085E68 + destination_offset + (offset)) = current; \
} while (0)

void matrix_stack_duplicate(void)
{
    register s32 current __asm__("$4");
    register s32 next __asm__("$5");
    register s32 source_offset __asm__("$2");
    register s32 destination_offset __asm__("$3");

    current = D_8008B35C;
    next = current + 1;
    destination_offset = next << 1;
    source_offset = current * 48;
    current = *(s32 *)((u8 *)D_80085E68 + source_offset);
    destination_offset = (destination_offset + next) << 4;
    *(s32 *)((u8 *)D_80085E68 + destination_offset) = current;
    COPY_CELL(0x04);
    COPY_CELL(0x08);
    COPY_CELL(0x0C);
    COPY_CELL(0x10);
    COPY_CELL(0x14);
    COPY_CELL(0x18);
    COPY_CELL(0x1C);
    COPY_CELL(0x20);
    COPY_CELL(0x24);
    COPY_CELL(0x28);
    source_offset = *(s32 *)((u8 *)D_80085E68 + source_offset + 0x2C);
    D_8008B35C = next;
    *(s32 *)((u8 *)D_80085E68 + destination_offset + 0x2C) = source_offset;
}
