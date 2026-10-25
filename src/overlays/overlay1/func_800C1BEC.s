.text
.align 2
.set noreorder
.globl func_800C1BEC
.ent func_800C1BEC
func_800C1BEC:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lw          $a1, 0x0($s0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lw          $a1, 0x10($a1)
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v1, $v0, $s5
    sll         $a1, $a1, 1
    addu        $a1, $a1, $v1
    lh          $v1, 0x0($a1)
    addu        $a2, $zero, $zero
    addu        $v0, $v0, $fp
    sll         $a1, $v1, 2
    addu        $a1, $a1, $v1
    sll         $a1, $a1, 3
    jal         func_80097D28
    addu        $a1, $v0, $a1
    j           func_800BD644
    sh          $s2, 0x3C($s1)
.end func_800C1BEC
