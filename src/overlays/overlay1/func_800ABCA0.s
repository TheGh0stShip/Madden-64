.text
.align 2
.set noreorder
.globl func_800ABCA0
.ent func_800ABCA0
func_800ABCA0:
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5EE0
    sll         $t2, $t0, 2
    addu        $t1, $t2, $v0
    lw          $a1, 0x0($t1)
    sll         $a2, $t0, 1
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5EB8
    addu        $v1, $a2, $v1
    lhu         $a0, 0x0($v1)
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5EB4
    addu        $v0, $a2, $v0
    sh          $a0, 0x0($v0)
    sh          $zero, 0x0($v1)
    lhu         $v1, 0x0($v0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 1
    lui         $at, 0x8007
    addu        $at, $at, $a2
    lhu         $v1, -0x484C($at)
    addu        $v0, $v0, $a1
    lhu         $a3, 0x0($v0)
    beqz        $v1, . + 4 + (0x26 << 2)
    andi        $s1, $a3, 0xFFFF
    sll         $s0, $s1, 2
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $v0, -0x493C($at)
    addu        $a0, $t0, $zero
    sw          $v0, 0x0($t1)
    lui         $at, 0x8008
    addu        $at, $at, $t2
    sw          $v0, -0x5ED4($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sh          $v0, -0x5EAC($at)
    lui         $at, 0x8008
.end func_800ABCA0
