#include "m2c.h"

M2C_UNK func_800167FC();                   /* extern */
M2C_UNK func_8002E688();             /* extern */
extern M2C_UNK D_80002040;
extern s8 D_80002044;
extern s8 D_80002045;
extern M2C_UNK D_8006BE4C;
extern M2C_UNK D_80088118;
extern M2C_UNK D_800881B0;
extern M2C_UNK D_800881B2;
extern M2C_UNK D_800881D0;
extern M2C_UNK D_800881D2;
extern u8 D_800E7A48;
extern u8 D_800E7A54;
extern s32 D_800E7A58;
extern u8 D_800E7A80;
extern u8 D_800E7A8C;
struct Fields_var_arg0
{
  char pad_0[0xe4];
  u8 *unk_E4;
  char pad_E8[0x18];
  u8 *unk_100;
  char pad_104[0x18];
  void *unk_11C;
  u8 *unk_120;
  u8 *unk_124;
  u8 *unk_128;
};
struct Fields_object_D_800E7A5C
{
  u8 unk_0;
  s8 unk_1;
};
extern struct Fields_object_D_800E7A5C D_800E7A5C;

typedef struct { char c[2]; } Two;
void func_800D2D94(struct Fields_var_arg0 *arg0)
{
  u8 *var_s0_61;
  u8 *var_s0_90;
  if (arg0->unk_11C != (&D_8006BE4C))
  {
    arg0->unk_11C = (void *) ((M2C_UNK *) ((D_800E7A58 * 0xB) + ((s32) (&D_80088118))));
    func_800167FC(M2C_FIELD((M2C_UNK *) (((s8 *) (&D_80088118)) + (D_800E7A58 * 2)), s16 *, 0x58), &D_800E7A5C);
    func_800167FC(M2C_FIELD((M2C_UNK *) (((s8 *) (&D_80088118)) + (D_800E7A58 * 2)), s16 *, 0x68), &D_800E7A8C);
    func_800167FC(M2C_FIELD((M2C_UNK *) (((s8 *) (&D_80088118)) + (D_800E7A58 * 2)), s16 *, 0x78), &D_800E7A54);
    arg0->unk_120 = &D_800E7A5C;
    arg0->unk_124 = &D_800E7A8C;
    arg0->unk_128 = &D_800E7A54;
    var_s0_61 = &D_800E7A48;
    func_800167FC(*((s16 *) (((s8 *) (&D_800881B0)) + (D_800E7A58 * 4))), &D_800E7A48);
    func_8002E688(&D_800E7A48, &D_80002040);
    while (*var_s0_61++ != 0) { }
    func_800167FC(*((s16 *) (((s8 *) (&D_800881B2)) + (D_800E7A58 * 4))), var_s0_61 - 1);
    arg0->unk_E4 = &D_800E7A48;
    var_s0_90 = &D_800E7A80;
    func_800167FC(*((s16 *) (((s8 *) (&D_800881D2)) + (D_800E7A58 * 4))), &D_800E7A80);
    func_8002E688(&D_800E7A80, &D_80002040);
    while (*var_s0_90++ != 0) { }
    func_800167FC(*((s16 *) (((s8 *) (&D_800881D0)) + (D_800E7A58 * 4))), var_s0_90 - 1);
    arg0->unk_100 = &D_800E7A80;
    return;
  }
  *(Two *) &D_800E7A5C = *(Two *) &D_80002044;
  arg0->unk_120 = &D_800E7A5C;
  arg0->unk_124 = &D_800E7A5C;
  arg0->unk_128 = &D_800E7A5C;
  arg0->unk_E4 = &D_800E7A5C;
  arg0->unk_100 = &D_800E7A5C;
}
