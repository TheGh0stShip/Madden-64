.text
.align 2
.set noreorder
.globl func_80040C04
.ent func_80040C04
func_80040C04:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    lw          $v0, 0x48($a2)
    beqz        $v0, .L80040C20
    addiu       $v0, $v0, -0x1
    j .L80040CFC
    sw          $v0, 0x48($a2)
.L80040C20:
    lw          $v0, 0x0($a1)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    lh          $v0, 0x0($v0)
    addu        $a3, $v0, $zero
    andi        $v1, $v0, 0xF000
    addiu       $v0, $zero, 0x4000
    beq         $v1, $v0, .L80040CDC
    slti        $v0, $v1, 0x4001
    beqz        $v0, .L80040C84
    addiu       $v0, $zero, 0x1000
    beq         $v1, $v0, .L80040CD4
    slti        $v0, $v1, 0x1001
    beql        $v0, $zero, .L80040C6C
    addiu       $v0, $zero, 0x2000
    beqz        $v1, .L80040CCC
    andi        $v0, $a3, 0xFFF
    j .L80040CFC
    nop
.L80040C6C:
    beq         $v1, $v0, .L80040CEC
    addiu       $v0, $zero, 0x3000
    beq         $v1, $v0, .L80040CDC
    nop
    j .L80040CFC
    nop
.L80040C84:
    addiu       $v0, $zero, 0x7000
    beq         $v1, $v0, .L80040CDC
    slti        $v0, $v1, 0x7001
    beqz        $v0, .L80040CB0
    addiu       $v0, $zero, 0x5000
    beq         $v1, $v0, .L80040CDC
    addiu       $v0, $zero, 0x6000
    beq         $v1, $v0, .L80040CDC
    nop
    j .L80040CFC
    nop
.L80040CB0:
    ori         $v0, $zero, 0x8000
    beq         $v1, $v0, .L80040CDC
    ori         $v0, $zero, 0x9000
    beq         $v1, $v0, .L80040CDC
    nop
    j .L80040CFC
    nop
.L80040CCC:
    j .L80040CDC
    sw          $v0, 0x0($a2)
.L80040CD4:
    andi        $v0, $a3, 0xFFF
    sw          $v0, 0x48($a2)
.L80040CDC:
    lw          $v0, 0x0($a1)
    addiu       $v0, $v0, 0x1
    j .L80040CFC
    sw          $v0, 0x0($a1)
.L80040CEC:
    sw          $zero, 0x0($a1)
    lw          $v0, 0x6C($a2)
    jal         func_80040C04
    sw          $v0, 0x0($a2)
.L80040CFC:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80040C04
