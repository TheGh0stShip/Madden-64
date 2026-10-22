#include "types.h"

typedef struct Record36 {
    u32 words[9];
} Record36;

void func_800CE1B4(Record36* records) {
    while (records[0].words[0] != 0) {
        records[0] = records[1];
        records++;
    }
}
