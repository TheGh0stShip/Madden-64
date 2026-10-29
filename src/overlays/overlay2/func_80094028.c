#include "types.h"

typedef struct {
    s16 type;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    s16 mode;
} LoadRequest;

extern s32 D_80071C4C;
extern s32 D_80087AA8;
s32 func_8000D740(s32, s32, LoadRequest *);

void func_80094028(void) {
    LoadRequest request;

    if (D_80071C4C == 0) {
        request.mode = 2;
        request.type = 0x2F8;
        request.unk04 = 0;
        request.unk08 = 0;
        D_80071C4C = func_8000D740(D_80087AA8, 1, &request);
    }
}
