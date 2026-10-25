#include "types.h"

typedef struct UiMetric {
    s16 value;
    u8 pad[0xD6];
} UiMetric;

extern UiMetric D_80088B7E[];

s16 func_80016BB0(s16 metric_index, const u8* text) {
    s16 value = D_80088B7E[metric_index].value;

    while (*text != 0) {
        if (*text == '\n') {
            value += D_80088B7E[metric_index].value;
        }
        text++;
    }
    return value;
}
