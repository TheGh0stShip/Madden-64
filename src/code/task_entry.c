#include "types.h"

typedef struct TaskEntry {
    u8 bytes[48];
} TaskEntry;

extern s32 D_8008B35C;
extern TaskEntry D_80085E68[];

TaskEntry* func_8002DED0(void) {
    return &D_80085E68[D_8008B35C];
}
