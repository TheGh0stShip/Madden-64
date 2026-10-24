#include "types.h"

typedef struct SlotEntry {
    u8 bytes[48];
} SlotEntry;

extern s32 D_8008B35C;
extern SlotEntry D_80085E68[];
extern void func_8002CB18(SlotEntry* slot);

void func_8002CAD0(void) {
    D_8008B35C++;
    func_8002CB18(&D_80085E68[D_8008B35C]);
}
