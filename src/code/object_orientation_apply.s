.text
.align 2
.set noreorder
.globl object_orientation_apply
.ent object_orientation_apply
object_orientation_apply:
    lhu         $v0, 0x206($a0)
    andi        $v0, $v0, 0x100
    beqz        $v0, .L8000CAA0
    lui         $a2, 0x4
    lw          $v0, 0x0($a1)
    negu        $v0, $v0
    sra         $v0, $v0, 16
    sh          $v0, 0x20($a0)
    lw          $v0, 0x4($a1)
    ori         $a2, $a2, 0xCCCC
    negu        $v0, $v0
    sra         $v0, $v0, 16
    sh          $v0, 0x22($a0)
    lw          $v1, 0x0($a1)
    sra         $t6, $v1, 8
    sra         $t7, $a2, 8
    mult        $t6, $t7
    mflo        $v0
    nop
    nop
    negu        $v0, $v0
    sra         $v0, $v0, 16
    sh          $v0, 0x18($a0)
    lw          $v1, 0x4($a1)
    sra         $t6, $v1, 8
    sra         $t7, $a2, 8
    mult        $t6, $t7
    mflo        $v0
    nop
    nop
    j .L8000CAF8
    negu        $v0, $v0
.L8000CAA0:
    lh          $v0, 0x0($a1)
    sh          $v0, 0x20($a0)
    lh          $v0, 0x4($a1)
    lui         $v1, 0x4
    ori         $v1, $v1, 0xCCCC
    sh          $v0, 0x22($a0)
    lw          $a2, 0x0($a1)
    sra         $t6, $a2, 8
    sra         $t7, $v1, 8
    mult        $t6, $t7
    mflo        $v0
    nop
    nop
    sra         $v0, $v0, 16
    sh          $v0, 0x18($a0)
    lw          $a2, 0x4($a1)
    sra         $t6, $a2, 8
    sra         $t7, $v1, 8
    mult        $t6, $t7
    mflo        $v0
    nop
    nop
.L8000CAF8:
    sra         $v0, $v0, 16
    sh          $v0, 0x1A($a0)
    lh          $v0, 0x8($a1)
    lui         $v1, 0x4
    ori         $v1, $v1, 0xCCCC
    sh          $v0, 0x24($a0)
    lw          $a1, 0x8($a1)
    sra         $t6, $a1, 8
    sra         $t7, $v1, 8
    mult        $t6, $t7
    mflo        $v0
    nop
    nop
    sra         $v0, $v0, 16
    jr          $ra
    sh          $v0, 0x1C($a0)
.end object_orientation_apply
