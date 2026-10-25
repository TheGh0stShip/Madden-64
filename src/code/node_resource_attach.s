.text
.align 2
.set noreorder
.globl node_resource_attach
.ent node_resource_attach
node_resource_attach:
    lui         $v0, 0x8009
    lw          $v0, -0x6CE4($v0)
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    beq         $s1, $v0, .L8000D9C4
    sw          $ra, 0x18($sp)
    jal         func_8000BE80
    nop
.L8000D9C4:
    lhu         $a0, 0x54($s0)
    lui         $v1, 0x8008
    lw          $v1, -0x7D04($v1)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    lw          $v0, 0x14($v1)
    jalr        $v0
    addu        $a0, $s0, $zero
    lhu         $v0, 0x54($s0)
    lui         $v1, 0x8008
    lw          $v1, -0x7D08($v1)
    lw          $a1, 0x8($s0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a0, 0x0($v0)
    jal         func_800332C8
    nop
    sw          $zero, 0x8($s0)
    lw          $v0, 0x8($s1)
    bne         $v0, $s0, .L8000DA3C
    nop
    lw          $v0, 0x4($s0)
    beqz        $v0, .L8000DA34
    sw          $v0, 0x8($s1)
    j .L8000DA70
    sw          $zero, 0x0($v0)
.L8000DA34:
    j .L8000DA70
    sw          $zero, 0xC($s1)
.L8000DA3C:
    lw          $v0, 0xC($s1)
    bne         $v0, $s0, .L8000DA58
    nop
    lw          $v0, 0x0($s0)
    sw          $v0, 0xC($s1)
    j .L8000DA70
    sw          $zero, 0x4($v0)
.L8000DA58:
    lw          $v1, 0x0($s0)
    lw          $v0, 0x4($s0)
    sw          $v0, 0x4($v1)
    lw          $v1, 0x4($s0)
    lw          $v0, 0x0($s0)
    sw          $v0, 0x0($v1)
.L8000DA70:
    lui         $a0, 0x8008
    lw          $a0, -0x7D0C($a0)
    jal         func_800332C8
    addu        $a1, $s0, $zero
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end node_resource_attach
