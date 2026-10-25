.text
.align 2
.set noreorder
.globl vector_signed_components_load
.ent vector_signed_components_load
vector_signed_components_load:
    addu        $a1, $a0, $zero
    lb          $v0, 0x0($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x7BE8
    nor         $v1, $zero, $v0
    sra         $v1, $v1, 31
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sb          $v0, -0x7BE4($at)
    sb          $v0, 0x0($a0)
    lb          $v0, 0x1($a1)
    nor         $v1, $zero, $v0
    sra         $v1, $v1, 31
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sb          $v0, -0x7BE3($at)
    lui         $at, 0x8008
    sb          $v0, -0x7BE7($at)
    lb          $v0, 0x2($a1)
    addiu       $sp, $sp, -0x30
    nor         $v1, $zero, $v0
    sra         $v1, $v1, 31
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sb          $v0, -0x7BE2($at)
    lui         $at, 0x8008
    sb          $v0, -0x7BE6($at)
    lb          $v0, 0x0($a1)
    addiu       $a0, $a0, 0x10
    addu        $a2, $a0, $zero
    bgtz        $v0, .L8000DFBC
    addu        $v1, $v0, $zero
    j .L8000DFC0
    negu        $v0, $v1
.L8000DFBC:
    addu        $v0, $zero, $zero
.L8000DFC0:
    sb          $v0, 0x0($a2)
    sb          $v0, 0x0($a0)
    lb          $v0, 0x1($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x7BD7
    addu        $a2, $a0, $zero
    bgtz        $v0, .L8000DFE8
    addu        $v1, $v0, $zero
    j .L8000DFEC
    negu        $v0, $v1
.L8000DFE8:
    addu        $v0, $zero, $zero
.L8000DFEC:
    sb          $v0, 0x0($a2)
    sb          $v0, 0x0($a0)
    lb          $v0, 0x2($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x7BD6
    addu        $a1, $a0, $zero
    bgtz        $v0, .L8000E014
    addu        $v1, $v0, $zero
    j .L8000E018
    negu        $v0, $v1
.L8000E014:
    addu        $v0, $zero, $zero
.L8000E018:
    sb          $v0, 0x0($a1)
    sb          $v0, 0x0($a0)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end vector_signed_components_load
