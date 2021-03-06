include(`commons.m4')main:

var_10          = -0x10
var_4           = -4

; _EN(`function prologue')_RU(`пролог функции'):
                lui     $gp, (dword_9C >> 16)
                addiu   $sp, -0x20
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x20+var_4($sp)
                sw      $gp, 0x20+var_10($sp)
                lui     $v0, (dword_A4 >> 16) ; ?
; _RU(`загрузить младшую 32-битную часть числа')_EN(`load low 32-bit part of') 32.01:
                lwc1    $f12, dword_9C
; _EN(`load address of pow() function')_RU(`загрузить адрес функции pow()'):
                lw      $t9, (pow & 0xFFFF)($gp)
; _RU(`загрузить страшую 32-битную часть числа')_EN(`load high 32-bit part of') 32.01:
                lwc1    $f13, $LC0
                lui     $v0, ($LC1 >> 16) ; ?
; _RU(`загрузить младшую 32-битную часть числа')_EN(`load low 32-bit part of') 1.54:
                lwc1    $f14, dword_A4
                or      $at, $zero ; load delay slot, NOP
; _RU(`загрузить страшую 32-битную часть числа')_EN(`load high 32-bit part of') 1.54:
                lwc1    $f15, $LC1
; _RU(`вызвать')_EN(`call') pow():
                jalr    $t9
                or      $at, $zero ; branch delay slot, NOP
                lw      $gp, 0x20+var_10($sp)
; _EN(`copy result from \$f0 and \$f1 to \$a3 and \$a2')_RU(`скопировать результат из \$f0 и \$f1 в \$a3 и \$a2'):
                mfc1    $a3, $f0
                lw      $t9, (printf & 0xFFFF)($gp)
                mfc1    $a2, $f1
; _RU(`вызвать')_EN(`call') printf():
                lui     $a0, ($LC2 >> 16)  # "32.01 ^ 1.54 = %lf\n"
                jalr    $t9
                la      $a0, ($LC2 & 0xFFFF)  # "32.01 ^ 1.54 = %lf\n"
; _EN(`function epilogue')_RU(`эпилог функции'):
                lw      $ra, 0x20+var_4($sp)
; _return 0:
                move    $v0, $zero
                jr      $ra
                addiu   $sp, 0x20

.rodata.str1.4:00000084 $LC2:           .ascii "32.01 ^ 1.54 = %lf\n"<0>

; 32.01:
.rodata.cst8:00000098 $LC0:           .word 0x40400147         # DATA XREF: main+20
.rodata.cst8:0000009C dword_9C:       .word 0xAE147AE1         # DATA XREF: main
.rodata.cst8:0000009C                                          # main+18
; 1.54:
.rodata.cst8:000000A0 $LC1:           .word 0x3FF8A3D7         # DATA XREF: main+24
.rodata.cst8:000000A0                                          # main+30
.rodata.cst8:000000A4 dword_A4:       .word 0xA3D70A4          # DATA XREF: main+14
