#include "types.h"

typedef struct {
    u8 pad00[0x89];
    u8 ids[1];
} Teams;

typedef struct {
    u8 pad00[0x68];
    Teams *teams;
} Screen;

void func_8002E65C(char *dst, char *src);
u16 func_8003DC54(u8);
char *func_8003A7B8(u16);

void func_800A4EEC(u16 row, char *dst, Screen *screen) {
    char bowl[12] = "MADDEN BOWL";
    char champ[17] = "EAS CHAMPIONSHIP";
    u8 id;

    id = screen->teams->ids[row];
    if (id == 0x1E) {
        func_8002E65C(dst, bowl);
    } else if (id == 0x25) {
        func_8002E65C(dst, champ);
    } else {
        func_8002E65C(dst, func_8003A7B8(func_8003DC54(id)) + 0x16);
    }
}
