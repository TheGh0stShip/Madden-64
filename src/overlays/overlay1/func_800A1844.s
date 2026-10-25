.text
.align 2
.set noreorder
.globl func_800A1844
.ent func_800A1844
func_800A1844:
    lw          $a0, 0x4F50($a0)
    slt         $v0, $v0, $a0
    beqz        $v0, .L800A18D0
    lui         $v0, 0x8000
    beq         $a0, $v0, .L800A18D0
    sra         $v0, $a0, 16
    lui         $v1, 0x8008
    lw          $v1, 0x57F4($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x57EC($a0)
    lui         $a1, 0xB
    ori         $a1, $a1, 0x6
    lui         $at, 0x8008
    sh          $v0, 0x7AB4($at)
    sll         $v1, $v1, 16
    srl         $v0, $v1, 21
    lui         $at, 0x8008
    sb          $v0, 0x7AB1($at)
    beq         $a0, $a1, .L800A18C0
    sra         $v0, $v1, 16
    addiu       $v0, $v0, 0x3FF
    andi        $v0, $v0, 0xFFF
    slti        $v0, $v0, 0x7FF
    beqz        $v0, .L800A1944
    lui         $v1, 0xC
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lw          $v0, 0x24($v0)
    lw          $v0, 0x24($v0)
    j           func_8009D210
    addu        $v0, $v0, $v1
.L800A18C0:
    lui         $at, 0x8008
    sw          $zero, 0x7AB8($at)
    j           func_8009D27C
    nop
.L800A18D0:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lw          $v1, 0x2C($a0)
    lui         $v0, 0xB
    ori         $v0, $v0, 0x6
    beq         $v1, $v0, .L800A1958
    nop
    lw          $a0, 0x24($a0)
    jal         func_800B9208
    addiu       $a0, $a0, 0x2C
    sll         $v0, $v0, 16
    srl         $v1, $v0, 21
    sra         $v0, $v0, 16
    addiu       $v0, $v0, 0x3FF
    andi        $v0, $v0, 0xFFF
    slti        $v0, $v0, 0x7FF
    lui         $at, 0x8008
    sb          $v1, 0x7AB1($at)
    beqz        $v0, .L800A1944
    lui         $v1, 0xE
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lw          $v0, 0x24($v0)
    lw          $v0, 0x24($v0)
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0x7AB8($at)
    j           func_8009D27C
    nop
.L800A1944:
    lui         $v0, 0x5
    lui         $at, 0x8008
    sw          $v0, 0x7AB8($at)
    j           func_8009D27C
    nop
.L800A1958:
    lui         $at, 0x8008
    sb          $zero, 0x7AB1($at)
    lui         $at, 0x8008
    sw          $zero, 0x7AB8($at)
    jal         func_800A29C0
    nop
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sh          $v0, 0x7AB4($at)
    j           func_8009D27C
    nop
.end func_800A1844
