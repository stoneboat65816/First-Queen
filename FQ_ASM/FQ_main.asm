arch snes.cpu
hirom

define gengo				$0402
define buffer				$0404

	incsrc "FQ_ASM\FQ_kaizou.asm"
	incsrc "FQ_ASM\FQ_menu.asm"
	incsrc "FQ_ASM\FQ_vector.asm"
	incsrc "FQ_ASM\FQ_kaiwa.asm"
	incsrc "FQ_ASM\FQ_spc.asm"
	incsrc "FQ_ASM\FQ_code.asm"
	incsrc "FQ_ASM\FQ_incbin.asm"