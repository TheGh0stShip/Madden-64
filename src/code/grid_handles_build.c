#include "types.h"

typedef struct GridHandleRequest {
    u16 first;
    u16 second;
    u8 pad04[0xC];
    u32 value10;
} GridHandleRequest;

extern u32 D_8007A568[][4][14];
extern u32 func_8000E558(GridHandleRequest *request);

void grid_handles_build(u16 first, u16 second, u16 row, u16 column)
{
    GridHandleRequest request;
    u16 index = 0;
    register u32 column_sevens __asm__("$3");
    register u32 row_sevens __asm__("$2");
    register u32 *base __asm__("$6");
    register u32 column_bytes __asm__("$7");
    u32 *output;

    column_sevens = (u16)column * 7;
    __asm__("" : "=r"(column_sevens) : "0"(column_sevens));
    row_sevens = (u16)row * 7;
    row_sevens <<= 5;
    __asm__("" : "=r"(row_sevens) : "0"(row_sevens));
    base = &D_8007A568[0][0][0];
    column_bytes = column_sevens << 3;
    output = (u32 *)(column_bytes + (u32)((u8 *)base + row_sevens));

    request.first = first;
    request.second = second + (column_sevens << 1);
    request.value10 = 0;
    do {
        output[index] = func_8000E558(&request);
        request.second++;
        index++;
    } while (index < 14);
}
