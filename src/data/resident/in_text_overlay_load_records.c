#include "types.h"

typedef struct OverlayLoadRecord {
    u32 load_address;
    u32 checksum;
} OverlayLoadRecord;

OverlayLoadRecord D_800420A0 = { 0x8008B8E0, 0x037C4889 };
OverlayLoadRecord D_800420A8 = { 0x800C5F48, 0xDD357C60 };
