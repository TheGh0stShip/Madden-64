.text
.align 2
.set noreorder
.globl func_800BCFD8
.ent func_800BCFD8
func_800BCFD8:
    lui         $at, 0x8008
    sw          $s0, -0x5BB0($at)
    lh          $a1, 0x0($s0)
    jal         func_800B932C
    addu        $a0, $zero, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $v0, -0x5BAC($at)
    bltzl       $v0, .L800BD004
    negu        $v0, $v0
.L800BD004:
    slti        $v0, $v0, 0x32
    bnez        $v0, .L800BD2DC
    nop
    jal         func_80041BB4
    addiu       $a0, $zero, 0xA
    j           func_800B8BB8
    nop
    beqz        $s0, .L800BD050
    lui         $v1, 0x4
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    beqz        $v0, .L800BD050
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x6
    andi        $v0, $v0, 0xFFFF
    j           func_800B893C
    addiu       $v0, $v0, 0xA8
.L800BD050:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xAB
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BDC
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0x4
    beqz        $s0, .L800BD0A8
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xBD
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    j           func_800B8BB8
    nop
.L800BD0A8:
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    j           func_800B8BA0
    addiu       $v0, $zero, 0xBC
    bnez        $s0, .L800BD0C4
    addiu       $v0, $zero, 0x9A
    addiu       $v0, $zero, 0x99
.L800BD0C4:
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BDC
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0x4
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0xA4
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0xAB
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    j           func_800B8BA0
    addiu       $v0, $zero, 0x9B
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    j           func_800B8BA0
    addiu       $v0, $s0, 0x99
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0xB3
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0x9C
    beqz        $s0, .L800BD180
    addiu       $a0, $zero, 0x3
    addiu       $a0, $zero, 0x4
.L800BD180:
    jal         func_80031A1C
    nop
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xBD
    lui         $at, 0x8008
    sw          $v0, -0x5BE0($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BDC
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x0($a0)
    j           func_800B8BB0
    addiu       $a0, $a0, -0x4
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $a0, 0x2D94($at)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D94($at)
    lui         $at, 0x8008
    sw          $zero, -0x5BB4($at)
    addiu       $v0, $v0, 0x18
    slt         $v0, $v0, $a0
    beqz        $v0, .L800BD258
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x1E
    beqz        $v0, .L800BD258
    nop
    jal         func_80041BB4
    addiu       $a0, $zero, 0x1A
.L800BD258:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0xB8
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0x9F
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    j           func_800B8BA0
    addiu       $v0, $v0, 0xA4
    jal         func_80031A1C
    addiu       $a0, $zero, 0x3
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5BE0
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0xC1
    sw          $v0, 0x0($a0)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    jal         func_800B7BC0
    nop
.L800BD2DC:
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800BCFD8
