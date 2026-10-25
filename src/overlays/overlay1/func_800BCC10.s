.text
.align 2
.set noreorder
.globl func_800BCC10
.ent func_800BCC10
func_800BCC10:
    lui         $a0, 0x8008
    lw          $a0, -0x5BB8($a0)
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    addiu       $v0, $zero, 0xDF
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lbu         $a0, 0x1E($a0)
    bne         $a0, $v0, .L800BCC54
    andi        $v1, $v1, 0x1
    xori        $v0, $v1, 0x1
    beqz        $v0, .L800BCC70
    nop
    j           func_800B8538
    nop
.L800BCC54:
    beqz        $v1, .L800BCC70
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    j           func_800B855C
    addiu       $v0, $v0, 0xD6
.L800BCC70:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xD3
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BD8
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0x8
.end func_800BCC10
