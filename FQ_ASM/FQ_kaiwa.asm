org $C0EEC7
	JSL vwf_kw_init
	NOP #3

org $C0F198
	JSL vwf_kw_init
	NOP #3

org $C0F2BC
	JML vwf_kw_line
	NOP #2

org $C0F018
	JSL vwf_kw_wait
	NOP #2

org $C0F536
	JML vwf_kw_scroll
	NOP

org $C0EF6C
	JML vwf_kw_frame
	NOP #3

org $C0EE92
	JML vwf_kw_end

org $C0930F
	JSL vwf_kw_hdma
	NOP #2

org $C0EAF3
	JSL vwf_frame_up

org $C08397
	JSL vwf_frame_up

org $C0F4FA
	JML vwf_kw_pgclr
	NOP #2

org $C0FC93
	JSL vwf_kw_curblk
	NOP #3

org $C0FCA3
	JSL vwf_kw_curblk
	NOP #3

org $C0FCDF
	JSL vwf_kw_cur_b

org $C0FCE9
	JSL vwf_kw_cur_a

org $C0FCFB
	JSL vwf_kw_cur_b

org $C09439
	JSL vwf_m2125

org $C0A426
	JSL vwf_m2130

org $C0AB65
	JSL vwf_m2130

org $C0B9B1
	JSL vwf_m2130

org $C0BBD2
	JSL vwf_m2130

org $C09EBD
	JSL vwf_m2131

org $C09EC9
	JSL vwf_m2131

org $C09EF1
	JSL vwf_m2131

org $C09EFD
	JSL vwf_m2131

org $C0A20F
	JSL vwf_m2131

org $C0A2A9
	JSL vwf_m2131

org $C0A2CC
	JSL vwf_m2131

org $C0A42C
	JSL vwf_m2131

org $C0AB05
	JSL vwf_m2131

org $C0AB1E
	JSL vwf_m2131

org $C0AB6B
	JSL vwf_m2131

org $C0B9B7
	JSL vwf_m2131

org $C0BBE4
	JSL vwf_m2131

org $C0BBF4
	JSL vwf_m2131

org $C09EB7
	JSL vwf_m2132

org $C09EDE
	JSL vwf_m2132

org $C09F12
	JSL vwf_m2132

org $C0A215
	JSL vwf_m2132

org $C0A2BB
	JSL vwf_m2132

org $C0A2DA
	JSL vwf_m2132

org $C0A432
	JSL vwf_m2132

org $C0AB13
	JSL vwf_m2132

org $C0AB2C
	JSL vwf_m2132

org $C0AB71
	JSL vwf_m2132

org $C0B9BD
	JSL vwf_m2132

org $C0BBD8
	JSL vwf_m2132

org $C0BBDE
	JSL vwf_m2132

org $C071A0
	JSL vwf_mfield
	NOP #11

org $C0E9C9
	JSL vwf_mmenu
	NOP #6

org $C0F3D8
	JML vwf_kw_sline
	NOP #2

org $C0F0C7
	db $B0

org $C0BA6F
	JML mode7_txt_delay
	
org $C09EAD
	JML senki_pos
	
org $C09E51
	JML opening_text_pos
org $C0F16F
	JSL vwf_end_pal
	NOP #2

org $C0A59D
	JML vwf_end_s5
	NOP #2

org $C0A5DE
	JML vwf_end_s6
	NOP #2
