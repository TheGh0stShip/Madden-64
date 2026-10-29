#include "types.h"

typedef struct {
    s16 v[3];
} Triple;

extern Triple D_800C4FBC[];

Triple *func_800A1C3C(s16 index) {
    return &D_800C4FBC[index];
}
