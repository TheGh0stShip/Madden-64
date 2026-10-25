.text
.align 2
.set noreorder
.globl func_80098A4C
.ent func_80098A4C
func_80098A4C:
    addiu       $sp, $sp, -0x30
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $v0, 0x8007
    lw          $v0, -0x6518($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x762C($v1)
    addiu       $a1, $zero, 0xB
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x64E8
    sw          $s1, 0x14($sp)
    addiu       $s1, $zero, 0x6
    sw          $s3, 0x1C($sp)
    addiu       $s3, $a2, 0x2C
    sw          $s2, 0x18($sp)
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8007
    sw          $zero, -0x64C0($at)
    sw          $v0, 0x0($a2)
    lui         $at, 0x8007
    sw          $v1, -0x64BC($at)
    jal         func_8000D740
    addiu       $s2, $zero, 0x420
    addu        $s0, $v0, $zero
    jal         func_80095104
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    lw          $v1, 0x8($s0)
    addiu       $a1, $zero, 0x1
    addiu       $v0, $zero, 0x300
    jal         func_80033B20
    sw          $v0, 0x28($v1)
    jal         func_8009562C
    addu        $a0, $s0, $zero
    lui         $at, 0x8007
    sw          $s0, -0x64C0($at)
.L80098AE8:
    lui         $at, 0x8008
    addu        $at, $at, $s2
    lw          $v0, 0x715C($at)
    beqz        $v0, .L80098B1C
    addu        $s0, $s1, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xB
    addiu       $a2, $s3, -0x2C
    jal         func_8000D740
    sw          $v0, 0x0($s3)
    jal         func_80095104
    addu        $a0, $v0, $zero
.L80098B1C:
    addiu       $s2, $s2, -0xB0
    bnez        $s0, .L80098AE8
    addiu       $s1, $s1, -0x1
    addiu       $s5, $zero, 0xB
    addiu       $s3, $zero, 0x1
    lui         $s4, 0x8007
    addiu       $s4, $s4, -0x64BC
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5098
.L80098B40:
    beqz        $s5, .L80098B98
    addiu       $s1, $s5, -0x1
    sll         $v0, $s1, 2
    addu        $s0, $v0, $s2
.L80098B50:
    lw          $v0, 0x0($s0)
    beql        $v0, $zero, .L80098B8C
    addiu       $s0, $s0, -0x4
    lw          $v0, 0x24($v0)
    beql        $v0, $zero, .L80098B8C
    addiu       $s0, $s0, -0x4
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0xB
    addiu       $a2, $s4, -0x2C
    jal         func_8000D740
    sw          $v0, 0x0($s4)
    jal         func_80095104
    addu        $a0, $v0, $zero
    addiu       $s0, $s0, -0x4
.L80098B8C:
    addu        $v0, $s1, $zero
    bnez        $v0, .L80098B50
    addiu       $s1, $s1, -0x1
.L80098B98:
    addiu       $s2, $s2, -0x58
    addu        $v0, $s3, $zero
    bnez        $v0, .L80098B40
    addiu       $s3, $s3, -0x1
    lui         $at, 0x8007
    sw          $zero, -0x64C0($at)
    lui         $at, 0x8007
    sw          $zero, -0x64BC($at)
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80098A4C
