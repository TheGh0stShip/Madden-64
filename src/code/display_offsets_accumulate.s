.text
.align 2
.set noreorder
.globl display_offsets_accumulate
.ent display_offsets_accumulate
display_offsets_accumulate:
    move $t1,$a0
    lui $a0,%hi(D_80086DA8)
    lh $a0,%lo(D_80086DA8)($a0)
    move $a3,$zero
    move $t0,$zero
    move $v0,$a0
    beqz $v0,.Lclamp
     addiu $a0,$a0,-1
    move $a2,$a0
.Lloop:
    lui $at,0x8008
    addu $at,$at,$a2
    lb $v1,0x6de4($at)
    move $a0,$a2
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,1
    lui $at,0x8009
    addu $at,$at,$v0
    lb $v1,-0x4c4e($at)
    lui $at,0x8009
    addu $at,$at,$v0
    lb $v0,-0x4c4d($at)
    addiu $a2,$a2,-1
    addu $a3,$a3,$v1
    bnez $a0,.Lloop
     addu $t0,$t0,$v0
.Lclamp:
    slti $v0,$a3,-0x50
    bnezl $v0,.La3_low_done
     addiu $a3,$zero,-0x50
.La3_low_done:
    slti $v0,$a3,0x51
    beqzl $v0,.La3_high
     addiu $a3,$zero,0x50
.La3_high:
    slti $v0,$t0,-0x50
    bnezl $v0,.Lt0_low
     addiu $t0,$zero,-0x50
.Lt0_low:
    slti $v0,$t0,0x51
.Lt0_high:
    beql $v0,$zero,.Lstore
     addiu $t0,$zero,0x50
.Lstore:
    sb $a3,0($t1)
    jr $ra
     sb $t0,0($a1)
.end display_offsets_accumulate
