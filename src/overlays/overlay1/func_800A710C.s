.text
.align 2
.set noreorder
.globl func_800A710C
.ent func_800A710C
func_800A710C:
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $v0, -0x13
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800A71E4
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L800A7184
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    bnez        $v0, .L800A716C
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A71E4
    addiu       $a1, $zero, 0xF
    addiu       $a0, $zero, 0x3B
    jal         func_80041DD4
    addiu       $a2, $zero, 0xF0
    j           func_800A2AC0
    nop
.L800A716C:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beqz        $v0, .L800A71CC
    nop
    j           func_800A2AB8
    nop
.L800A7184:
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800A71BC
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A71E4
    addiu       $a1, $zero, 0xF
    addiu       $a0, $zero, 0x3A
    jal         func_80041DD4
    addiu       $a2, $zero, 0x78
    j           func_800A2AC0
    nop
.L800A71BC:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A71DC
    nop
.L800A71CC:
    jal         func_80041E54
    addiu       $a0, $zero, 0xC
    j           func_800A2AC0
    nop
.L800A71DC:
    jal         func_8004192C
    addiu       $a0, $zero, 0x1
.L800A71E4:
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    addiu       $v0, $v0, -0x18
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800A72C0
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, .L800A7250
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    bnez        $v0, .L800A7238
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A72C0
    addiu       $a0, $zero, 0x3B
    addiu       $a1, $zero, 0xF
    j           func_800A2B94
    addiu       $a2, $zero, 0xF0
.L800A7238:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beqz        $v0, .L800A72A0
    nop
    j           func_800A2B5C
    nop
.L800A7250:
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800A7290
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A7280
    addiu       $a0, $zero, 0x3A
    addiu       $a1, $zero, 0xE
    j           func_800A2B94
    addiu       $a2, $zero, 0xF0
.L800A7280:
    jal         func_8004192C
    addiu       $a0, $zero, 0x1
    j           func_800A2B9C
    nop
.L800A7290:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A72B0
    addiu       $a0, $zero, 0x3A
.L800A72A0:
    jal         func_80041E54
    addiu       $a0, $zero, 0xC
    j           func_800A2B9C
    nop
.L800A72B0:
    addiu       $a1, $zero, 0xE
    addiu       $a2, $zero, 0x78
    jal         func_80041DD4
    nop
.L800A72C0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A710C
