#include "types.h"

typedef struct Overlay5RuntimeObject {
    void *unk_00;
    struct Overlay5RuntimeObject *next;
    u8 type;
    u8 flags;
} Overlay5RuntimeObject;

typedef struct Overlay5ObjectType {
    void *unk_00;
    void *unk_04;
    s16 (*update)(Overlay5RuntimeObject *object, s32 key);
    void *unk_0C;
} Overlay5ObjectType;

typedef struct Overlay5ObjectSystem {
    Overlay5ObjectType *types;
    Overlay5RuntimeObject *current;
    Overlay5RuntimeObject *field08;
    u16 field0C;
    u16 field0E;
    u16 field10;
    u16 field12;
    s32 field14;
    s16 field18;
    u16 field1A;
    u16 field1C;
} Overlay5ObjectSystem;

extern Overlay5ObjectSystem *D_80072460;
extern s16 D_800880A8;
extern volatile u16 D_8008A5B4;

u16 func_80031A1C(s32);
void func_800DF72C(void);
s32 func_800E01D4(s32 value);
void func_800E078C(void *resource);
s16 func_800E0944();
s16 func_800E0A60(s32 mask);
void overlay5_runtime_object_replace(Overlay5RuntimeObject *object);

u8 func_800E01F8(s32 arg0, Overlay5RuntimeObject **out) {
    Overlay5RuntimeObject *object;
    Overlay5RuntimeObject *current;
    s16 key;
    s16 result;
    s16 saved;

    *out = D_80072460->current;
    if (D_80072460->current != 0 && (D_80072460->current->flags & 0x10)) {
        key = 0x19;
        D_80072460->field0C += D_8008A5B4;
        if (D_80072460->field0E < D_80072460->field0C) {
            key = func_800E0A60(D_80072460->field14);
            D_80072460->field0C = 0;
            D_80072460->field0E = D_80072460->field12 + func_80031A1C((u16)(D_80072460->field10 - D_80072460->field12 + 1));
        }
    } else {
        key = func_800E0944();
    }
    if (D_80072460->current != 0) {
        if (D_80072460->current->flags & 4) {
            switch (key) {
            case 0:
                key = 2;
                break;
            case 1:
                key = 3;
                break;
            case 2:
                key = 0;
                break;
            case 3:
                key = 1;
                break;
            }
        }
        D_80072460->field1A += D_8008A5B4;
        D_80072460->field1C += D_8008A5B4;
        if (key != 0x19) {
            if (key == D_80072460->field18) {
                if (D_80072460->field1C <= D_800880A8 * 3 + 2) {
                    if (func_800E01D4(key) && D_80072460->field1A > 0x1E) {
                        if (D_800880A8 >= 2) {
                            D_800880A8--;
                            D_80072460->field1A = 0;
                        } else {
                            D_80072460->field1A = 0;
                        }
                    }
                } else {
                    D_800880A8 = 8;
                    D_80072460->field18 = key;
                    D_80072460->field1A = 0;
                }
                D_80072460->field1C = 0;
            } else {
                D_800880A8 = 8;
                if (func_800E01D4(key) && func_800E01D4(D_80072460->field18)) {
                    D_800880A8 = 1;
                    key = 0x19;
                }
                D_80072460->field18 = key;
                D_80072460->field1A = 0;
            }
        }
        if (D_80072460->current != 0) {
            switch (key) {
            case 10:
            case 11:
            case 16:
            case 25:
                break;
            case 17:
                key = 0x11;
                if (D_80072460->current->flags & 8) {
                    if (D_80072460->current != D_80072460->field08) {
                        func_800E078C(D_80072460->current);
                        key = 0xF;
                    }
                }
                break;
            case 18:
                current = D_80072460->current;
                if (!(current->flags & 2)) {
                    object = current->next;
                    while (object != current) {
                        if (object == 0) {
                            object = D_80072460->field08;
                        } else {
                            if (!(object->flags & 1)) {
                                func_800DF72C();
                                overlay5_runtime_object_replace(object);
                                *out = D_80072460->current;
                                break;
                            }
                            object = object->next;
                        }
                    }
                }
                break;
            default:
                result = 0x17;
                saved = 0;
                object = D_80072460->current;
                while (result == 0x17) {
                    if (object == 0) {
                        break;
                    }
                    result = D_80072460->types[object->type].update(object, key);
                    if (result == 0x1A || result == 0x1B) {
                        saved = result;
                        result = 0x17;
                    }
                    object = object->next;
                }
                if (result != 0x17 && result != 0x19) {
                    key = result;
                }
                if (saved != 0) {
                    key = saved;
                }
                break;
            }
        }
    }
    return key;
}
