.text
.align 2
.set noreorder
.globl func_800B9820
.ent func_800B9820
func_800B9820:
    lw          $v0, 0xC($s0)
    sll         $v0, $v0, 20
    sra         $v0, $v0, 22
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    sh          $v0, 0x76E4($at)
    lw          $v0, 0xC($s0)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800B9854
    addiu       $v1, $zero, -0x2
    lw          $v0, 0x14($a0)
    j           func_800B5138
    ori         $v0, $v0, 0x1
.L800B9854:
    lw          $v0, 0x14($a0)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lui         $a0, 0x8008
    lw          $a0, 0x7B54($a0)
    beqz        $a0, .L800B98C8
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $v0, 0x14($v1)
    andi        $v0, $v0, 0x1
    beql        $v0, $zero, .L800B98BC
    addiu       $v1, $zero, -0x2
    lw          $v0, 0x14($a0)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($a0)
    lw          $v0, 0x1C($v1)
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x20($v1)
    sw          $v0, 0x20($a0)
    lui         $v0, 0x8008
    lhu         $v0, 0x76E2($v0)
    lw          $v1, 0x8($a0)
    addiu       $v0, $v0, 0x400
    j           func_800B51A4
    sh          $v0, 0x12($v1)
.L800B98BC:
    lw          $v0, 0x14($a0)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
.L800B98C8:
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x76E0
    jal         func_8000EC8C
    nop
    andi        $a0, $s1, 0xFFFF
    andi        $v0, $a0, 0x7
    bnel        $v0, $zero, . + 4 + (0x5 << 2)
    srl         $a0, $a0, 3
    jal         func_800B545C
.end func_800B9820
