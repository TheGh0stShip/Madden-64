.text
.align 2
.set noreorder
.globl func_800C5F80
.ent func_800C5F80
func_800C5F80:
    lw          $v0, 0x6178($v0)
    lw          $v1, 0x20($v0)
    lui         $v0, 0xFCE0
    slt         $v0, $v0, $v1
    beqz        $v0, . + 4 + (0x76 << 2)
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, . + 4 + (0x72 << 2)
    addiu       $v1, $zero, 0x26
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800C5FCC
    sb          $v1, 0x10($sp)
    lui         $s1, 0x8009
    lhu         $s1, -0x7920($s1)
    j           func_800C18B4
    addiu       $v0, $zero, 0xE
.L800C5FCC:
    lui         $s1, 0x8009
    lhu         $s1, -0x751C($s1)
    addiu       $v0, $zero, 0xE
    sb          $v0, 0x11($sp)
    jal         func_8001FA38
    addiu       $a0, $zero, 0xE
    sll         $v0, $v0, 16
    beqz        $v0, . + 4 + (0x2E << 2)
    addiu       $v0, $zero, 0x2
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    beqz        $v0, . + 4 + (0x28 << 2)
.end func_800C5F80
