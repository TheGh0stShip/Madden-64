#include "types.h"

typedef struct {
    u8 pad00[0x68];
} Pfs;

typedef struct {
    u32 file_size;
    u32 game_code;
    u16 company_code;
    char ext_name[4];
    char game_name[16];
} PfsState;

typedef struct {
    u32 game_code;
    u16 company_code;
    char ext_name[4];
    char game_name[16];
    char name[17];
    char ext[5];
    s32 index;
    s16 blocks;
    char label[0x1A];
} Note;

extern char D_80002ED0[];
extern char D_80002ED4[];
extern s16 D_80084F6C;
extern Note *D_80085018;
extern Pfs D_80085860[];
extern s32 D_800886F4;
extern s32 D_800895B4;
extern s16 D_800895B6;

void func_8002E17C(char *, char *, s32);
s32 func_8002E628(char *, char *);
void func_8002E65C(char *, char *);
void func_8002E688(char *, char *);
void *func_80032E00(s32, s32);
s32 func_80049DB8(Pfs *, s32, PfsState *);
s32 func_8004A0A8(Pfs *, s32 *);
s32 func_8004B348(Pfs *, s32 *, s32 *);
void overlay5_runtime_record_table_release(void);
void overlay5_runtime_selected_record_process(void);
void overlay5_runtime_system_initialize(void);
void func_800E2480(void);
s16 overlay5_runtime_result_translate(s32);
void overlay5_packed_text_decode(char *, char *, s32);
void overlay5_string_trailing_spaces_trim(char *, s32);

s16 func_800E1B0C(void) {
    PfsState state;
    s32 max;
    s32 err;
    s16 i;
    Note *note;

    overlay5_runtime_system_initialize();
    overlay5_runtime_selected_record_process();
    if (D_80085018 != 0) {
        overlay5_runtime_record_table_release();
    }
    D_80085018 = 0;
    D_800895B4 = 0;
    D_800886F4 = 0;
    err = overlay5_runtime_result_translate(func_8004A0A8(&D_80085860[D_80084F6C], &D_800886F4));
    D_800886F4 /= 256;
    if (err != 0 || (err = overlay5_runtime_result_translate(func_8004B348(&D_80085860[D_80084F6C], &max, &D_800895B4))) != 0 || D_800895B4 == 0) {
        func_800E2480();
        D_800895B4 = 0;
        return 0;
    }
    note = func_80032E00(0, D_800895B4 * sizeof(Note));
    D_80085018 = note;
    for (i = 0; i < max; i++) {
        err = func_80049DB8(&D_80085860[D_80084F6C], i, &state);
        if (err != 0 && err != 5) {
            func_800E2480();
            D_800895B4 = 0;
            return 0;
        }
        if (err == 0) {
            note->blocks = state.file_size >> 8;
            note->game_code = state.game_code;
            note->company_code = state.company_code;
            func_8002E17C(note->ext_name, state.ext_name, 4);
            func_8002E17C(note->game_name, state.game_name, 16);
            note->index = i;
            overlay5_packed_text_decode(note->name, note->game_name, 16);
            overlay5_packed_text_decode(note->ext, note->ext_name, 4);
            note->name[16] = 0;
            note->ext[4] = 0;
            overlay5_string_trailing_spaces_trim(note->name, 16);
            overlay5_string_trailing_spaces_trim(note->ext, 4);
            func_8002E65C(note->label, note->name);
            if (func_8002E628(note->ext, D_80002ED0) != 0) {
                func_8002E688(note->label, D_80002ED4);
                func_8002E688(note->label, note->ext);
            }
            note++;
        }
    }
    func_800E2480();
    return D_800895B6;
}
