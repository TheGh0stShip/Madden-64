.text
.align 2
.set noreorder
.globl func_800B1C1C
.ent func_800B1C1C
func_800B1C1C:
    lui         $v0, 0x8008
    lh          $v0, 0x76DC($v0)
    addiu       $sp, $sp, -0x18
    xori        $v1, $v0, 0x2
    sltu        $v1, $zero, $v1
    xori        $v0, $v0, 0x4
    sltu        $v0, $zero, $v0
    and         $v1, $v1, $v0
    bnez        $v1, .L800B1C58
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x79
    bnez        $v0, .L800B1C60
    nop
.L800B1C58:
    jal         func_800AD54C
    nop
.L800B1C60:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1C1C
