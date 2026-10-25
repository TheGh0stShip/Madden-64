#include "types.h"

typedef struct FrameBufferPair {
    void* first_left;
    void* second_left;
    u8 pad08[4];
    void* second_right;
    void* first_right;
    u8 pad14[68];
} FrameBufferPair;

extern FrameBufferPair D_80085058[];
extern void func_800E1CF4(void* first, void* second);

void func_800380D4(s16 index) {
    func_800E1CF4(D_80085058[index].first_left,
                  D_80085058[index].first_right);
    func_800E1CF4(D_80085058[index].second_left,
                  D_80085058[index].second_right);
}
