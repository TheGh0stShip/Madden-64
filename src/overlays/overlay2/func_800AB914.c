#include "types.h"

typedef struct Bytes3 {
    s8 bytes[3];
} Bytes3;

typedef struct Bytes6 {
    s8 bytes[6];
} Bytes6;

extern u8 D_800C5C40[][6];
extern s16 D_800C5016;
extern Bytes3 D_8008BDF4;
extern Bytes3 D_8008BDF8;
extern Bytes6 D_8008BDFC;

void func_800AB914(u16 index, void *output) {
    if (D_800C5C40[index][4] != 9) {
        if (D_800C5C40[index][0] == D_800C5016) {
            *(Bytes3 *)output = D_8008BDF4;
        } else {
            *(Bytes3 *)output = D_8008BDF8;
        }
    } else {
        *(Bytes6 *)output = D_8008BDFC;
    }
}
