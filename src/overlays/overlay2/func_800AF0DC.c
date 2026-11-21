#include "types.h"

typedef struct {
    /* 0x00 */ u8 unk_00[8];
    /* 0x08 */ u16 count;
    /* 0x0A */ u16 top;
    /* 0x0C */ u8 visible;
    /* 0x0D */ u8 cursor;
} ListState;

typedef struct {
    /* 0x00 */ u8 unk_00[0xC];
    /* 0x0C */ ListState *list;
} ListOwner;

typedef struct {
    /* 0x00 */ u8 unk_00[0x24];
    /* 0x24 */ ListOwner *owner;
} ListWidget;

void func_800DB0AC(ListState *list, s32 cursor, s32 arg2);
void func_800DB478(ListState *list);

void func_800AF0DC(ListWidget *widget, s32 arg1)
{
    ListState *list = widget->owner->list;
    u16 count = arg1;

    if (count != list->count) {
        if (count == 0) {
            func_800DB0AC(list, 0, 0);
            list->top = 0;
            list->cursor = 0;
            list->count = 1;
        } else if (count < list->count) {
            if (count < list->top + list->visible) {
                if (count <= list->visible) {
                    list->top = 0;
                    if (list->cursor >= count) {
                        func_800DB0AC(list, count - 1, 0);
                    }
                } else {
                    list->top -= list->count - arg1;
                }
            }
            list->count = count;
        } else {
            if (list->top + list->visible < count) {
                arg1 -= list->top;
            }
            if (arg1 < 100 && arg1 != list->cursor && arg1 > list->top) {
                list->count = count;
            } else {
                list->count = count;
            }
        }
    }
    func_800DB478(list);
}
