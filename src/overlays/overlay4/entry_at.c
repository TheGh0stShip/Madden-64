#include "types.h"

typedef struct OverlayEntry {
    u8 bytes[16];
} OverlayEntry;

extern OverlayEntry D_80079530[];

OverlayEntry* func_800C78B0(u16 index) {
    return &D_80079530[index];
}
