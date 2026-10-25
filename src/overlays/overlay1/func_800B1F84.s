.text
.align 2
.set noreorder
.globl func_800B1F84
.ent func_800B1F84
func_800B1F84:
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xD6A
    addu        $s0, $s0, $v0
    addu        $s0, $s0, $s1
    lui         $at, 0x8007
    sw          $s0, -0x466C($at)
    sll         $v0, $s2, 16
    sra         $s0, $v0, 16
    sll         $s1, $s0, 2
    addu        $v0, $s1, $s7
    lw          $a0, 0x8($v0)
    beqz        $a0, . + 4 + (0x43 << 2)
    addiu       $v0, $s2, 0x1
    lw          $v0, 0x4($a0)
    sll         $v1, $s0, 3
    addu        $v1, $v1, $fp
    sw          $v0, 0x0($v1)
    lbu         $v1, 0x0($a0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800B2060
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800B1FF0
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L800B2000
    sll         $v1, $s2, 16
    j           func_800AD96C
    nop
.L800B1FF0:
    beq         $v1, $v0, .L800B2030
    sll         $v1, $s2, 16
    j           func_800AD96C
    nop
.L800B2000:
    lbu         $a2, 0x1($a0)
    andi        $a0, $s3, 0xFFFF
    jal         func_80023C60
    andi        $a1, $s4, 0xFFFF
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    addu        $a1, $s1, $s0
    sll         $a1, $a1, 3
    jal         func_800167FC
    addu        $a1, $a1, $s5
    j           func_800AD96C
    sll         $v1, $s2, 16
.L800B2030:
    lbu         $a2, 0x1($a0)
    lbu         $a3, 0x2($a0)
    andi        $a0, $s3, 0xFFFF
    jal         func_80023E58
    andi        $a1, $s4, 0xFFFF
    addu        $a0, $s1, $s0
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s5
    jal         func_800AB3EC
    addu        $a1, $v0, $zero
    j           func_800AD96C
    sll         $v1, $s2, 16
.L800B2060:
    lbu         $a2, 0x1($a0)
    lbu         $a3, 0x2($a0)
    andi        $a0, $s3, 0xFFFF
    jal         func_80023D44
    andi        $a1, $s4, 0xFFFF
    addu        $a0, $s1, $s0
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s5
    sll         $v0, $v0, 16
    jal         func_800AB48C
    sra         $a1, $v0, 16
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    sll         $a0, $v1, 3
    addu        $a0, $a0, $s6
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s5
    sw          $v0, 0x0($a0)
    lw          $v0, -0x10($s6)
    addiu       $v0, $v0, 0x2
    sw          $v0, -0x10($s6)
    addiu       $v0, $s2, 0x1
.end func_800B1F84
