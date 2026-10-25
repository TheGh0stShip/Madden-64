.text
.align 2
.set noreorder
.globl func_800AD124
.ent func_800AD124
func_800AD124:
    beqz        $s7, .L800AD178
    sll         $s0, $s5, 2
    lui         $t1, 0x8007
    addiu       $t1, $t1, -0x47FC
    addu        $s0, $s0, $t1
    lw          $a0, 0x0($s0)
    lw          $t1, 0x34($sp)
    sll         $v0, $s1, 2
    lui         $a3, 0x8008
    lw          $a3, 0x4F80($a3)
    addu        $v0, $v0, $t1
    lw          $a2, 0x0($v0)
    jal         func_8001D088
    addu        $a1, $s2, $zero
    lw          $t1, 0x5C($sp)
    lw          $a0, 0x0($s0)
    lui         $at, 0x8008
    addu        $at, $at, $t1
    lhu         $v1, -0x5ED8($at)
    j           func_800A8A84
    nop
.L800AD178:
    lw          $t1, 0x34($sp)
    lw          $a0, 0x0($s3)
    sll         $v0, $s1, 2
.end func_800AD124
