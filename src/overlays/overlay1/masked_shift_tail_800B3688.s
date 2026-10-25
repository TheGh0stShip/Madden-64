.text
.align 2
.set noreorder
.globl masked_shift_tail_800B3688
.ent masked_shift_tail_800B3688
masked_shift_tail_800B3688:
    andi $v1,$a0,0x1f
    j func_800B3688
     sll $v1,$v1,22
.end masked_shift_tail_800B3688
