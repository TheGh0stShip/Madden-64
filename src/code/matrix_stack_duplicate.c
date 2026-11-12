#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[][12];

void matrix_stack_duplicate(void)
{
    s32 current = D_8008B35C;
    s32 next = current + 1;

    D_80085E68[next][0] = D_80085E68[current][0];
    D_80085E68[next][1] = D_80085E68[current][1];
    D_80085E68[next][2] = D_80085E68[current][2];
    D_80085E68[next][3] = D_80085E68[current][3];
    D_80085E68[next][4] = D_80085E68[current][4];
    D_80085E68[next][5] = D_80085E68[current][5];
    D_80085E68[next][6] = D_80085E68[current][6];
    D_80085E68[next][7] = D_80085E68[current][7];
    D_80085E68[next][8] = D_80085E68[current][8];
    D_80085E68[next][9] = D_80085E68[current][9];
    D_80085E68[next][10] = D_80085E68[current][10];
    D_8008B35C = next;
    D_80085E68[next][11] = D_80085E68[current][11];
}
