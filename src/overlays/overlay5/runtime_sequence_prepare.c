#include "types.h"

typedef struct RuntimeSequence {
    u8 pad00[0x46];
    s16 mode;
    s16 values[4];
    u16 index;
    u8 pad52[2];
    s16 active;
    s16 state;
} RuntimeSequence;

void overlay5_runtime_sequence_prepare(RuntimeSequence *sequence) {
    sequence->active = 1;
    sequence->mode = 3;
    sequence->values[sequence->index] += 6;
    sequence->state = 5;
}
