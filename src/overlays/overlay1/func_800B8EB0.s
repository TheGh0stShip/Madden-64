.text
.align 2
.set noreorder
.globl func_800B8EB0
.ent func_800B8EB0
func_800B8EB0:
    addu        $at, $at, $v1
    lbu         $a1, 0x5E50($at)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x9
    addu        $a0, $a0, $v1
    bnez        $v0, . + 4 + (-0xE << 2)
    sb          $a1, 0x3D9($a0)
    addiu       $s2, $zero, 0x7
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x7AD0
    addiu       $a2, $zero, 0x1
    addiu       $a1, $zero, -0x2
.L800B8EEC:
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    sll         $v0, $s2, 16
    sra         $a0, $v0, 16
    sll         $v0, $a0, 2
    addu        $v1, $v1, $a0
    sb          $zero, 0x3E2($v1)
    addu        $v1, $v0, $a3
    lw          $v0, 0x0($v1)
    lw          $v0, 0x14($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800B8F30
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7128($v0)
    addu        $v0, $v0, $a0
    sb          $a2, 0x3E2($v0)
.L800B8F30:
    lw          $v0, 0x0($v1)
    addu        $a0, $s2, $zero
    lw          $v1, 0x14($v0)
    addiu       $s2, $s2, -0x1
    sll         $a0, $a0, 16
    and         $v1, $v1, $a1
    bnez        $a0, .L800B8EEC
    sw          $v1, 0x14($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x794C($v0)
    lw          $v0, 0x14($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800B8F78
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    j           func_800B4860
    sb          $v0, 0x3EA($v1)
.L800B8F78:
    lui         $v0, 0x8008
    lw          $v0, 0x7128($v0)
    sb          $zero, 0x3EA($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x794C($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x7128($a0)
    lw          $v0, 0x1C($v1)
    sw          $v0, 0x3F0($a0)
    lw          $v0, 0x20($v1)
    sw          $v0, 0x3F4($a0)
    lw          $v0, 0x24($v1)
    addu        $s2, $zero, $zero
    addu        $a1, $a0, $zero
    sw          $v0, 0x3F8($a1)
.L800B8FB4:
    sll         $v0, $s2, 16
    sra         $v0, $v0, 12
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0xC40($at)
    addu        $a0, $a1, $v0
    sw          $v1, 0x400($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0xC44($at)
    addiu       $v0, $s2, 0x1
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, .L800B8FB4
    sw          $v1, 0x404($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x7B80($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lw          $v0, 0x1C($a1)
    sw          $v0, 0x440($v1)
    lw          $v0, 0x20($a1)
    jal         func_8000C8EC
    sw          $v0, 0x444($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    sh          $v0, 0x3EC($v1)
    sll         $v0, $v0, 16
    beqz        $v0, . + 4 + (0xE << 2)
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x49E0($v1)
    lw          $v0, 0x20($v1)
    negu        $v0, $v0
    sw          $v0, 0x20($v1)
.end func_800B8EB0
