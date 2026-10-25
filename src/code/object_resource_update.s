.text
.align 2
.set noreorder
.globl object_resource_update
.ent object_resource_update
object_resource_update:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    sw          $ra, 0x18($sp)
    jal         func_8000C790
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($s1)
    lw          $a0, 0xF8($s0)
    jal         func_8000DE34
    nop
    jal         func_8000E3C8
    nop
    jal         func_8000E20C
    nop
    lhu         $v0, 0xA8($s0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8000F1C4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    lhu         $v0, 0x206($v0)
    andi        $v0, $v0, 0x100
    beqz        $v0, .L8000F0F0
    lui         $a3, 0x4
    ori         $a3, $a3, 0xCCCC
    lw          $t0, 0x1C($s1)
    sra         $t6, $a3, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    negu        $v0, $v0
    sw          $v0, 0xB4($s0)
    lw          $t0, 0x20($s1)
    sra         $t6, $a3, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    negu        $v0, $v0
    j .L8000F13C
    sw          $v0, 0xB8($s0)
.L8000F0F0:
    lw          $t0, 0x1C($s1)
    ori         $a3, $a3, 0xCCCC
    sra         $t6, $a3, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00003812  # mflo        $a3
    nop
    nop
    sw          $a3, 0xB4($s0)
    lui         $a3, 0x4
    ori         $a3, $a3, 0xCCCC
    lw          $t0, 0x20($s1)
    sra         $t6, $a3, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00003812  # mflo        $a3
    nop
    nop
    sw          $a3, 0xB8($s0)
.L8000F13C:
    lw          $s1, 0x24($s1)
    lui         $a3, 0x4
    ori         $a3, $a3, 0xCCCC
    sra         $t6, $a3, 8
    sra         $t7, $s1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00003812  # mflo        $a3
    nop
    nop
    jal         func_8002CBD4
    sw          $a3, 0xBC($s0)
    lhu         $v0, 0xA8($s0)
    andi        $v0, $v0, 0x4
    beqz        $v0, .L8000F1D4
    nop
    jal         func_8002DA14
    addiu       $a0, $s0, 0xB4
    jal         func_8002D350
    nop
    jal         func_8002D398
    nop
    jal         func_8002D3E0
    nop
    lhu         $a0, 0xAE($s0)
    jal         func_8002D14C
    andi        $a0, $a0, 0xFFF
    lhu         $a0, 0xAC($s0)
    jal         func_8002CF48
    andi        $a0, $a0, 0xFFF
    lhu         $a0, 0xAA($s0)
    jal         func_8002CD44
    andi        $a0, $a0, 0xFFF
    j .L8000F218
    nop
.L8000F1C4:
    jal         func_8000EAB4
    addu        $a0, $s1, $zero
    jal         func_8002CBD4
    nop
.L8000F1D4:
    jal         func_8002DA14
    addiu       $a0, $s0, 0xB4
    jal         func_8002D350
    nop
    jal         func_8002D398
    nop
    jal         func_8002D3E0
    nop
    lhu         $a0, 0xAA($s0)
    jal         func_8002CD44
    andi        $a0, $a0, 0xFFF
    lhu         $a0, 0xAC($s0)
    jal         func_8002CF48
    andi        $a0, $a0, 0xFFF
    lhu         $a0, 0xAE($s0)
    jal         func_8002D14C
    andi        $a0, $a0, 0xFFF
.L8000F218:
    lw          $a0, 0xC4($s0)
    lw          $a1, 0xC8($s0)
    lw          $a2, 0xCC($s0)
    jal         func_8002D8D0
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    sll         $a0, $a0, 6
    addiu       $a0, $a0, 0x28
    jal         func_8002DEF4
    addu        $a0, $s0, $a0
    lui         $a2, 0x106
    ori         $a2, $a2, 0x40
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    addu        $a0, $s0, $zero
    addiu       $v0, $a1, 0x8
    sll         $v1, $v1, 6
    addiu       $v1, $v1, 0x28
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addu        $v0, $a0, $v1
    lui         $v1, 0x8000
    subu        $v0, $v0, $v1
    sw          $a2, 0x0($a1)
    jal         func_8000ED98
    sw          $v0, 0x4($a1)
    jal         func_8002CD28
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xBD00
    sw          $v0, 0x0($v1)
    sw          $zero, 0x4($v1)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_resource_update
