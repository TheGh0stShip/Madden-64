.set noreorder
.set noat
.text

.globl exceptionPreamble
.ent exceptionPreamble
exceptionPreamble:
    lui     $k0, %hi(__osException)
    addiu   $k0, $k0, %lo(__osException)
    jr      $k0
     nop
.end exceptionPreamble
