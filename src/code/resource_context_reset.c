#include "types.h"

extern u16 D_8006928C;
extern u16 D_8006928E;
extern void *D_80069290;
extern void *D_80069294;
extern void *D_80069298;
extern void *D_8006929C;
extern void func_80035F88(u16 id, void *resource);
extern void *audio_entry_resource_mark(u16 id, void *resource);

void resource_context_reset(u16 id, void *resource)
{
    u16 *active = &D_8006928C;

    if (*active != 0) {
        func_80035F88(D_8006928E, D_80069290);
    }
    D_80069294 = audio_entry_resource_mark(id, resource);
    D_8006928E = id;
    D_80069290 = resource;
    *active = 1;
    D_80069298 = 0;
    D_8006929C = 0;
}
