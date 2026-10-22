.set noreorder
.set noat
.text

.globl __osCleanupThread
.ent __osCleanupThread
__osCleanupThread:
    .word   0x0C01173A
     or     $a0, $zero, $zero
    nop
    nop
.end __osCleanupThread
