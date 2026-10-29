/* rec3 program_metadata_record 0x00000000..0x00000020: generated from results/data-ledger.tsv by tools/gen.py */
#include "types.h"

struct ProgramMetadata {
    u32 kind;
    char version[4];
    u32 reserved;
    u16 revision;
    u16 rate;
    u16 tile_width;
    u16 tile_height;
    u16 display_width;
    u16 display_height;
    u16 safe_width;
    u16 safe_height;
    u16 buffers;
    u16 channels;
};

struct ProgramMetadata rec3_000000 = {
    0x07000000, { '.', '1', '0', '6' }, 0,
    1, 250, 8, 8, 320, 240, 304, 224, 3, 6
};
