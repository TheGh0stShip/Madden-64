.text
.align 2
.set noreorder
.globl func_800ACA0C
.ent func_800ACA0C
func_800ACA0C:
    addiu       $sp, $sp, -0x8
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4770
    sw          $s1, 0x4($sp)
    sw          $s0, 0x0($sp)
    lhu         $t8, 0x0($v0)
    lui         $s1, 0x8007
    lhu         $s1, -0x4762($s1)
    lui         $v1, 0x8007
    lhu         $v1, -0x476E($v1)
    lui         $a0, 0x8007
    lhu         $a0, -0x476C($a0)
    lui         $a1, 0x8007
    lhu         $a1, -0x476A($a1)
    lui         $a2, 0x8007
    lhu         $a2, -0x4768($a2)
    lui         $a3, 0x8007
    lhu         $a3, -0x4766($a3)
    lui         $t0, 0x8007
    lhu         $t0, -0x4764($t0)
    lui         $t1, 0x8007
    lhu         $t1, -0x475E($t1)
    lui         $t2, 0x8007
    lhu         $t2, -0x475C($t2)
    lui         $t3, 0x8007
    lhu         $t3, -0x475A($t3)
    lui         $t4, 0x8007
    lhu         $t4, -0x4758($t4)
    lui         $t5, 0x8007
    lhu         $t5, -0x4756($t5)
    lui         $t6, 0x8007
    lhu         $t6, -0x4754($t6)
    lui         $t7, 0x8007
    lhu         $t7, -0x4752($t7)
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4760
    lui         $at, 0x8007
    sh          $t8, -0x4762($at)
    lhu         $t8, 0x0($s0)
    sh          $v1, 0x0($v0)
    lui         $at, 0x8007
    sh          $a0, -0x476E($at)
    lui         $at, 0x8007
    sh          $a1, -0x476C($at)
    lui         $at, 0x8007
    sh          $a2, -0x476A($at)
    lui         $at, 0x8007
    sh          $a3, -0x4768($at)
    lui         $at, 0x8007
    sh          $t0, -0x4766($at)
    lui         $at, 0x8007
    sh          $s1, -0x4764($at)
    sh          $t1, 0x0($s0)
    lui         $at, 0x8007
    sh          $t2, -0x475E($at)
    lui         $at, 0x8007
    sh          $t3, -0x475C($at)
    lui         $at, 0x8007
    sh          $t4, -0x475A($at)
    lui         $at, 0x8007
    sh          $t5, -0x4758($at)
    lui         $at, 0x8007
    sh          $t6, -0x4756($at)
    lui         $at, 0x8007
    sh          $t7, -0x4754($at)
    lui         $at, 0x8007
    sh          $t8, -0x4752($at)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end func_800ACA0C
