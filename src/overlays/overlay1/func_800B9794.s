.text
.align 2
.set noreorder
.globl func_800B9794
.ent func_800B9794
func_800B9794:
    bne         $a0, $v0, .L800B97B8
    addu        $s2, $a1, $v1
    lw          $v0, 0x8($s0)
    andi        $v0, $v0, 0x7
    beqz        $v0, .L800B97B8
    sll         $a1, $v0, 1
    lw          $a0, 0x4($s0)
    jal         func_8003CF78
    andi        $a0, $a0, 0x7F
.L800B97B8:
    lw          $v0, 0x8($s0)
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    sra         $v0, $v0, 21
    sll         $v0, $v0, 16
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x0($s0)
    sll         $v0, $v0, 20
    sra         $v0, $v0, 4
    sw          $v0, 0x20($a0)
    lw          $v0, 0x8($s0)
    sll         $v0, $v0, 11
    sra         $v0, $v0, 22
    sll         $v0, $v0, 16
    sw          $v0, 0x24($a0)
    lw          $v0, 0xC($s0)
    sra         $v0, $v0, 22
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    sh          $v0, 0x76E0($at)
    lw          $v0, 0xC($s0)
    sll         $v0, $v0, 10
    sra         $v0, $v0, 22
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    sh          $v0, 0x76E2($at)
.end func_800B9794
