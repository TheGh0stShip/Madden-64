#include "types.h"

typedef struct {
    u32 count;
} StreamTable;

typedef struct {
    u8 pad00[6];
    u8 unk_06;
} StreamInfo;

typedef struct {
    u8 pad00[0x18];
    StreamTable *table;
} StreamHeader;

typedef struct {
    StreamHeader *header;
    u8 pad04[0x14];
    StreamInfo *info;
} Stream;

extern void func_8002CA88(const char *format, ...);
extern u32 func_800430F4(Stream *stream, u16 position);
extern const char D_80002FA0[];
extern const char D_80002FDC[];

u32 stream_position_resolve(Stream *stream, u32 *result, u32 *secondary, u32 position) {
    u32 count = stream->header->table->count;
    if (position >= count) {
        func_8002CA88(D_80002FA0, position, count);
        func_8002CA88(D_80002FDC, stream->info->unk_06);
        position = stream->header->table->count - 1;
    }
    *result = func_800430F4(stream, position);
    *secondary = 0;
    return 0;
}
