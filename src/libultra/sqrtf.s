.set noreorder
.text

.globl sqrtf
.ent sqrtf
sqrtf:
    jr      $ra
     sqrt.s $f0, $f12
.end sqrtf
