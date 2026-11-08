org $C0FFD7
	db $0B
org $DFFFFF
	db $00

org $C0C006
	JML init_wram
	
org $C0FE9E
	JSL make_pad
	NOP #4

org $C0C019
	JSL display_near
