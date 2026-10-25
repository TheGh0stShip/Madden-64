.text
.align 2
.set noreorder
.globl play_event_queue_advance
.ent play_event_queue_advance
play_event_queue_advance:
    lui $v0,0x8009
    lbu $v0,-0x6d5c($v0)
    beqz $v0,.Lreturn
     nop
    lui $a2,0x8009
    addiu $a2,$a2,-0x7507
    lbu $a0,0($a2)
    andi $v1,$a0,0xff
    sltiu $v0,$v1,0x1e
    beqz $v0,.Lwrap
     move $a1,$v1
    addiu $v0,$a0,1
    j .Lcopy
     sb $v0,0($a2)
.Lwrap:
    lui $v0,0x8009
    lbu $v0,-0x7506($v0)
    lui $v1,0x8888
    ori $v1,$v1,0x8889
    move $a1,$v0
    addiu $a0,$a1,1
    mult $a0,$v1
    sll $v1,$a1,2
    lui $v0,0x8009
    lbu $v0,-0x7508($v0)
    lui $at,0x8009
    addu $at,$at,$v1
    lbu $v1,-0x7504($at)
    addu $v0,$v0,$v1
    lui $at,0x8009
    sb $v0,-0x7508($at)
    sra $v0,$a0,31
    mfhi $a3
    addu $v1,$a3,$a0
    sra $v1,$v1,4
    subu $v1,$v1,$v0
    sll $v0,$v1,4
    subu $v0,$v0,$v1
    sll $v0,$v0,1
    subu $a0,$a0,$v0
    lui $at,0x8009
    sb $a0,-0x7506($at)
.Lcopy:
    sll $v1,$a1,2
    lui $v0,0x8009
    addiu $v0,$v0,-0x6d5c
    lwl $a0,0($v0)
    lwr $a0,3($v0)
    lui $at,0x8009
    addu $at,$at,$v1
    swl $a0,-0x7505($at)
    lui $at,0x8009
    addu $at,$at,$v1
    swr $a0,-0x7502($at)
    sb $zero,0($v0)
.Lreturn:
    jr $ra
     nop
.end play_event_queue_advance
