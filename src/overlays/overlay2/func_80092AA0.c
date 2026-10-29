#include "types.h"

/* Season save block: a signature halfword followed by the season state. */
typedef struct {
    u16 words[0xB9E / 2];
} SeasonSave;

extern SeasonSave D_800C5098;
extern SeasonSave D_800C3D00;

void func_80093FD8(void);

void func_80092AA0(void) {
    D_800C5098 = D_800C3D00;
    func_80093FD8();
}
