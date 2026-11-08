org $C0ED33
	JML vwf_scr_on

org $C0ED42
	JML vwf_scr_off

org $C0EE1D
	JSL vwf_inidisp

org $C0EE40
	JSL vwf_inidisp

org $C0EE4E
	JSL vwf_inidisp

org $C10746
	JML vwf_win

org $C1079C
	JML vwf_reset

org $C10C59
	JSL vwf_cursor

org $C0EB73
	JML vwf_chimei

org $C0CA7F
	JSL vwf_tm

org $C0CB8D
	JSL vwf_tm

org $C10E3A
	JML vwf_upload
	NOP

org $C0E490
	JSL vwf_lv_pos

org $C107CB
	JSL vwf_def_ld
	NOP #10

org $C0D24B
	JSL vwf_team_up
	NOP #2

org $C0D27D
	JSL vwf_info_base
	NOP #8

org $C0DFDB
	JSL vwf_box_base
	NOP #7

org $C0E08C
	JSL vwf_box_base
	NOP #7

org $C0D9AA
	JSL vwf_trash
	NOP #2

org $C0D9B7
	JSL vwf_trash2
	NOP #2

org $C0E3F6
	JSL vwf_spr_y

org $C1077B
	JML vwf_win2

org $C0DF54
	JSL vwf_list_x
	NOP #2

org $C0E0C6
	JSL vwf_list_a

org $C0DFBB
	JSL vwf_list_clr
	NOP #2

org $C08467
	JSL vwf_form
	NOP

org $C10AD5
	JML vwf_hl_on

org $C10B10
	JML vwf_hl_off

org $C004B7
	JSL vwf_val
	NOP #6

org $C10838
	JSL vwf_curtile
	NOP #3

org $C10BB0
	JSL vwf_cur_sh
	NOP #5

org $C10B6B
	JSL vwf_blk_a
	NOP

org $C10B81
	JSL vwf_blk_w
	NOP #4

org $C10BCB
	JSL vwf_cur_vr
	NOP #10

org $C0D3D3
	JSL vwf_item
	NOP #19

org $C0614E
	JSL vwf_found

org $C06163
	JSL vwf_found_name
	NOP #7

org $C0618D
	JSL vwf_pg_init
	NOP #3

org $C06199
	JSL vwf_pg_sel
	NOP #10

org $C06224
	JSL vwf_pg_title
	NOP #9

org $C06255
	JSL vwf_pg_x
	NOP #6

org $C062DA
	JSL vwf_pg_item
	PLA
	NOP #14

org $C062FA
	JSL vwf_pg_end

org $C0631A
	JSL vwf_discard_name
	NOP #9

org $C00A90
	JSL vwf_name_w2e
	NOP #2

org $C00A98
	JSL vwf_name_d2e
	NOP #10

org $C0277F
	JSL vwf_name_w43
	NOP #2

org $C0278D
	JSL vwf_name_d43
	NOP #10

org $C0D28A
	JSL vwf_tsel
	db $90, $03
	JMP $D315
	NOP #12

org $C0D315
	JSL vwf_tname
	NOP #10

org $C0D3C4
	JSL vwf_tclass
	NOP #2

org $C0DF94
	JSL vwf_mmname
	PLA
	NOP #4

org $C0DA24
	JSL vwf_mbname
	NOP #6

org $C062C9
	JSL vwf_pg_name
	NOP #13

org $C00852
	JSL vwf_st_n21
	NOP #10

org $C008E6
	JSL vwf_st_n22
	NOP #10

org $C0DF7D
	JSL vwf_mmnum

org $C0630C
	JSL vwf_pg_2a
	NOP #2

org $C0CA4E
	JSL vwf_mb_keep
	NOP #2

org $C0CAAC
	JSL vwf_mb_loop
	NOP #2

org $C0DA19
	JSL vwf_mb_row
	NOP #7

org $C0CB1D
	JSL vwf_mb_hrow
	NOP #4

org $C0CB45
	JSL vwf_mb_hrow
	NOP #4

org $C00860
	JSL vwf_st_i21
	NOP #13

org $C008F4
	JSL vwf_st_i22
	NOP #13

org $C00874
	JSL vwf_st_sid

org $C00908
	JSL vwf_st_sid

org $C00878
	JSL vwf_st_s21
	NOP #3

org $C0090C
	JSL vwf_st_s22
	NOP #3

org $C0D592
	JSL vwf_pop_close
	NOP #2

org $C0BAE6
	JSL vwf_m7_name

org $C018AB
	JSL vwf_cc_win
	NOP #2

org $C018BB
	JSL vwf_cc_cls
	NOP #14

org $C018CD
	JSL vwf_cc_name
	NOP #10

org $C0D7D4
	JSL vwf_p14_up
	NOP #7

org $C0D870
	JSL vwf_p14_close
	NOP #2

org $C0D8D4
	JSL vwf_p14_close2
	NOP

org $C0D40F
	JML vwf_rest_pop

org $C0CEDE
	JSL vwf_pop_icon
	NOP #2

org $C0CE7B
	JSL vwf_xs
	NOP

org $C0CEA5
	JSL vwf_xl
	NOP #2

org $C0CEF3
	JSL vwf_xw
	NOP #4

org $C0CF04
	JSL vwf_xc
	NOP #3
