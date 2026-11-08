define vwf_buf				$7E7000
define vwf_pen				$7E7780
define vwf_wid				$7E7782
define vwf_bank			$7E7784
define vwf_src				$7E7786
define vwf_ncols			$7E7788
define vwf_col0				$7E778A
define vwf_row				$7E778C
define vwf_lines			$7E778E
define vwf_xoff				$7E7790
define vwf_tptr				$7E7792
define vwf_tbank			$7E7794
define vwf_tile				$7E7796
define vwf_need			$7E7798
define vwf_id					$7E779A
define vwf_blanked		$7E779C
define vwf_end				$7E779E
define vwf_pal				$7E77A0
define vwf_pcol				$7E7700
define vwf_cell				$7E77A2
define vwf_tmp				$7E77A4
define vwf_map				$7E0460
define vwf_sidx				$7E77A6
define vwf_lnum			$7E77A8
define vwf_opt				$7E7600
define vwf_srect			$7E7500
define vwf_ssize			$7E7400
define vwf_dret				$7E77AA
define vwf_dbank			$7E77AC
define vwf_dflag			$7E77AE
define vwf_nomark		$7E77B0
define vwf_font				$7E77B2
define vwf_drawn			$7E77B4
define vwf_adv				$7E77B6
define vwf_mw				$7E77B8
define vwf_ml				$7E77BA
define vwf_mt				$7E77BC
define vwf_mseen			$7E77BE
define vwf_zn					$7E77C0
define vwf_dirty			$7E77C4
define vwf_used			$7E77C6
define vwf_cmax			$7E77C8
define vwf_coff				$7E77CA
define vwf_mmn			$7E77D0
define vwf_mbp				$7E77D2
define vwf_mbk				$7E77D4
define vwf_classid		$7E77D6
define vwf_p7pos			$7E77D8
define vwf_p7size			$7E77DA
define vwf_nstr				$7E77E0
define vwf_kwp				$7E77F0
define vwf_kwb				$7E77F2
define vwf_kwon			$7E77F4
define vwf_kwf				$7E77F6
define vwf_kwid			$7E77EC
define vwf_pret				$7E77EE
define vwf_pbank			$7E77C2
define vwf_kwm			$7E7776
define vwf_kwt				$7E7778
define vwf_kwc				$7E777A
define vwf_stid				$7E777C

define vwf_next				$7E0410
define vwf_blank			$7E0412
define vwf_slot_n			$7E0414
define vwf_slots			$7E0420
define vwf_hidden		$7E04E0
define vwf_team			$7E04E2
define vwf_scrl				$7E04E4
define vwf_ctx				$7E04E6
define vwf_snp_n			$7E04E8
define vwf_snp_t			$7E3130
define vwf_snp_c			$7E04EA
define vwf_snp_e			$7E04EC
define vwf_blkad			$7E04EE
define vwf_itemid			$7E04F0
define vwf_pg					$7E04F2
define vwf_pg_on			$7E04F4
define vwf_pgt				$7E04FA
define vwf_nameid		$7E04FC
define vwf_pgnb			$7E04FE
define xl_list					$7800
define xl_n						$7820
define xl_pg					$7822
define xl_on					$7824
define xl_np					$7826
define xl_k						$7828
define xl_r						$782A
define xl_t						$782C
define xl_m						$782E
define xl_c						$7830
define xl_pend				$7832
define xl_stat					$7840
define xl_save					$7B00

define press_XY				$4040
define press_XU				$0840
define press_XR				$0140
define press_XL				$0240
define press_startup	$1800
define press_startdown $1400
define press_startright $1100
define press_startleft $1200
define pad_old				$7E0406
define gs_idx					$0408
define gs_cnt					$040A
define gs_pad					$040C
define gs_clk					$040E
define vn_bg					$7FFF
define vn_t						$E0
define vn_t2					$E2
define vn_r2					$E5
define vn_g2					$EA
define vn_r						$E3
define vn_d						$E6
define vn_g						$E8
define vn_pen					$EC
define vn_row				$EE
define vn_top					$F0
define vn_dc					$F2
define vn_mode				$F4
define vn_fl						$F6
define vn_clb					$F8
define vn_pad					$FA
define vn_w					$FC
define vn_c						$DA
define vn_k						$DC
define vn_m					$DE
define vn_bl					$D6
define vn_bc					$D8

org $D60000
init_wram:
	PHP
	REP #$10
	LDX #$0000
-
	STZ $0400,x
	INX
	CPX #$0100
	BNE -
	PLP
	LDA #$FF
	STA $2000
	PHP
	REP #$30
	LDX #$0000
	LDY #$0008
-
	LDA $DC0003+$F0,x
	CMP chk_string,x
	BNE +
	INX #2
	DEY
	BNE -
	PLP
	JML $C0C00B
+
	STP
	
chk_string:
	dw $AAAA, $00AA, $AAAA, $CCCC, $CCCC, $CCCC, $CE00, $EEEE

vwf_scr_on:
	PHP
	SEP #$20
	PHA
	LDA $7E2053
	STA $002100
	AND #$80
	STA {vwf_blank}
	PLA
	PLP
	RTL

vwf_scr_off:
	PHP
	SEP #$20
	PHA
	LDA #$8F
	STA $002100
	STA {vwf_blank}
	PLA
	PLP
	RTL

vwf_inidisp:
	PHP
	SEP #$20
	STA $002100
	PHA
	AND #$80
	STA {vwf_blank}
	PLA
	PLP
	RTL

vwf_reset:
	PHA
	PHX
	PHY
	PHP
	REP #$30
	LDA $7E4142
	CMP #$7400
	BNE vwf_reset_novram
	JSR vwf_reset_vram
vwf_reset_novram:
	LDA #$0000
	STA {vwf_snp_n}
	LDA #$0040
	STA {vwf_next}
	LDA #$0000
	STA {vwf_slot_n}
	REP #$30
	LDX #$007E
vwf_reset_map:
	STA {vwf_map},x
	DEX #2
	BPL vwf_reset_map
	JML $C107A0

vwf_reset_vram:
	LDA #$0000
	STA {vwf_zn}
vwf_reset_vram_loop:
	PHA
	LSR #3
	TAX
	LDA {vwf_map},x
	AND #$00FF
	BNE +
	PLA
	ORA #$0007
	INC
	BRA vwf_reset_vram_chk
+
	PLA
	JSR vwf_zadd
	INC
vwf_reset_vram_chk:
	CMP #$0400
	BCC vwf_reset_vram_loop
	JSR vwf_zflush
	RTS

vwf_zadd:
	PHX
	PHA
	JSR vwf_bit
	SEP #$20
	LDA {vwf_map},x
	AND {vwf_tmp}
	BEQ vwf_zadd_none
	LDA {vwf_tmp}
	EOR #$FF
	AND {vwf_map},x
	STA {vwf_map},x
	REP #$20
	LDA {vwf_zn}
	TAX
	LDA $01,s
	CLC
	ADC #$2800
	STA {vwf_buf},x
	TXA
	INC #2
	STA {vwf_zn}
	CMP #$0100
	BCC vwf_zadd_end
	JSR vwf_zflush
	BRA vwf_zadd_end

vwf_zadd_none:
	REP #$20
vwf_zadd_end:
	PLA
	PLX
	RTS

vwf_zflush:
	LDA {vwf_zn}
	BEQ vwf_zflush_end
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	LDX #$0000
-
	LDA {vwf_buf},x
	STA $002116
	LDA #$0000
	STA $002118
	INX #2
	TXA
	CMP {vwf_zn}
	BCC -
	JSR vwf_vram_off
	LDA #$0000
	STA {vwf_zn}
vwf_zflush_end:
	RTS

vwf_win:
	PHA
	PHX
	PHY
	PHP
	REP #$30
	AND #$00FF
	STA {vwf_id}
	SEP #$20
	LDA.l $7E0000+{gengo}
	BEQ vwf_window_jp
	REP #$20
	LDA $7E4142
	CMP #$7400
	BEQ vwf_window_menu
	CMP #$7C00
	BEQ vwf_window_menu
	CMP #$7800
	BNE vwf_window_jp
	JMP vwf_window_map

vwf_window_menu:
	LDA #$0000
	JSR vwf_ctx_set
	LDA {vwf_id}
	CMP #$0065
	BCS vwf_window_jp
	JSR vwf_snap_restore
	LDA {vwf_id}
	JSR vwf_team_flag
	CMP #$0019
	BCC +
	CMP #$0021
	BCS +
	JMP vwf_window_skip
+
	LDA {vwf_id}
	STA {vwf_tptr}
	ASL
	CLC
	ADC {vwf_tptr}
	TAX
	JSR vwf_lg_00
	NOP
	XBA
	AND #$00FF
	BEQ +
	STA {vwf_tbank}
	JSR vwf_lg_01
	NOP
	STA {vwf_tptr}
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_x,x
	AND #$00FF
	STA {vwf_xoff}
	JMP vwf_window_vn
	
vwf_window_jp:
	SEP #$20
	LDA {vwf_id}
	JML $C1074A
+
	LDA {vwf_id}
	JSL $C107BA
	JSR vwf_geom
	JML $C10750

vwf_window_map:
	LDA #$0001
	JSR vwf_ctx_set
	LDA {vwf_id}
	CMP #$0065
	BCS vwf_window_map_jp
	STA {vwf_tptr}
	ASL
	CLC
	ADC {vwf_tptr}
	TAX
	JSR vwf_lg_00
	NOP
	XBA
	AND #$00FF
	BEQ vwf_window_map_jp
	STA {vwf_tbank}
	JSR vwf_lg_01
	NOP
	STA {vwf_tptr}
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_x,x
	AND #$00FF
	STA {vwf_xoff}
	JSR vwf_map_close
	JMP vwf_window_vn

vwf_window_map_jp:
	JMP vwf_window_jp

vwf_ctx_set:
	CMP {vwf_ctx}
	BEQ vwf_ctx_set_end
	STA {vwf_ctx}
	LDA #$0000
	STA {vwf_slot_n}
	STA {vwf_snp_n}
	LDA {vwf_ctx}
	BEQ vwf_ctx_set_menu
	LDA #$0140
	STA {vwf_next}
	RTS

vwf_ctx_set_menu:
	LDA #$0040
	STA {vwf_next}
vwf_ctx_set_end:
	RTS

vwf_window_skip:
	LDA {vwf_id}
	JSL $C107BA
	REP #$30
	LDA $7E41D6
	LDX #$0000
vwf_window_skip_fill:
	STA $7E41EB,x
	INX #2
	CPX #$0080
	BCC vwf_window_skip_fill
	JMP vwf_window_text

vwf_win2:
	PHA
	PHX
	PHY
	PHP
	REP #$30
	AND #$00FF
	STA {vwf_id}
	SEP #$20
	LDA.l $7E0000+{gengo}
	BEQ vwf_win2_jp
	REP #$20
	LDA $7E4142
	CMP #$7400
	BNE vwf_win2_jp
	LDA {vwf_id}
	CMP #$0019
	BCC vwf_win2_jp
	CMP #$0021
	BCS vwf_win2_jp
	JMP vwf_window_skip

vwf_win2_jp:
	SEP #$20
	LDA {vwf_id}
	JML $C1077F

vwf_team_flag:
	LDA {vwf_id}
	CMP #$000C
	BNE +
	LDA #$0001
	STA {vwf_team}
	BRA vwf_team_flag_end
+
	CMP #$0001
	BEQ +
	CMP #$0005
	BEQ +
	CMP #$0034
	BNE vwf_team_flag_end
+
	LDA #$0000
	STA {vwf_team}
vwf_team_flag_end:
	LDA {vwf_id}
	RTS

vwf_window_vn:
	LDA {vwf_id}
	JSL $C107BA
	JSR vwf_geom
	JSR vwf_autow
	LDA {vwf_ctx}
	BNE vwf_window_vn_go
	LDA $7E4142
	CMP #$7C00
	BNE vwf_window_vn_snap
	LDA $7E4146
	STA {vwf_p7pos}
	LDA $7E4148
	STA {vwf_p7size}
	BRA vwf_window_vn_go

vwf_window_vn_snap:
	JSR vwf_snap_push
	JSR vwf_clear_win
vwf_window_vn_go:
	LDA $7E4146
	PHA
	AND #$FF00
	ORA #$0040
	STA $004202
	PLA
	AND #$00FF
	ASL
	CLC
	ADC $004216
	TAX
	LDA $7E4148
	TAY
	JSL $C10CB8
	JSR vwf_window
	SEP #$20
	LDA $7E414E
	CMP #$02
	BCC vwf_window_text
	LDX #$0084
	JSL $C10B90
vwf_window_text:
	PLP
	PLY
	PLX
	PLA
	RTL

vwf_geom:
	REP #$30
	LDA $7E4148
	AND #$00FF
	JSR vwf_width
	SEP #$20
	STA $7E4148
	REP #$20
	LDA $7E4148
	XBA
	AND #$00FF
	JSR vwf_height
	SEP #$20
	STA $7E4149
	REP #$20
	LDA $7E4146
	XBA
	AND #$00FF
	JSR vwf_ypos
	SEP #$20
	STA $7E4147
	REP #$20
	LDA $7E4146
	AND #$00FF
	JSR vwf_xpos
	SEP #$20
	STA $7E4146
	REP #$20
	RTS

vwf_xpos:
	PHX
	PHA
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_c,x
	AND #$00FF
	CMP #$00FF
	BEQ vwf_xpos_keep
	STA $01,s
vwf_xpos_keep:
	PLA
	PLX
	RTS

vwf_width:
	PHX
	PHA
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_w,x
	AND #$00FF
	BEQ +
	STA $01,s
+
	PLA
	PLX
	RTS

vwf_height:
	PHX
	PHA
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_h,x
	AND #$00FF
	BEQ vwf_height_auto
	STA $01,s
	BRA +
vwf_height_auto:
	LDA $01,s
	CMP #$0001
	BNE +
	LDA {vwf_id}
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_lg_02
	NOP
	AND #$00FF
	BEQ +
	LDA #$0002
	STA $01,s
+
	PLA
	PLX
	RTS

vwf_ypos:
	PHX
	PHA
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_y,x
	AND #$00FF
	BEQ vwf_ypos_keep
	CMP #$00FF
	BNE +
	LDA #$0000
+
	STA $01,s
vwf_ypos_keep:
	PLA
	PLX
	RTS

vwf_cursor:
	LDA.l $C10F40,x
	PHX
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	REP #$20
	BEQ vwf_cursor_skip
	LDA $7E4142
	CMP #$7400
	BEQ vwf_cursor_ctx
	CMP #$7C00
	BEQ vwf_cursor_ctx
	CMP #$7800
	BNE vwf_cursor_skip
vwf_cursor_ctx:
	LDA $7E4144
	AND #$00FF
	CMP #$0065
	BCC vwf_cursor_go
vwf_cursor_skip:
	JMP vwf_cursor_end

vwf_cursor_go:
	LDX #$0000
vwf_cursor_find:
	TXA
	CMP {vwf_slot_n}
	BCS vwf_cursor_cy
	LDA.l {vwf_slots},x
	CMP $7E4144
	BEQ vwf_cursor_slot
	INX #4
	BRA vwf_cursor_find

vwf_cursor_slot:
	TXA
	ASL #2
	TAX
	PHX
	LDA $7E4144
	AND #$00FF
	TAX
	LDA $7E4156,x
	AND #$00FF
	PLX
	CMP {vwf_opt},x
	BCS vwf_cursor_cy
	INC
	ASL
	STA {vwf_tmp}
	TXA
	CLC
	ADC {vwf_tmp}
	TAX
	LDA {vwf_opt},x
	STA $01,s
	LDA {vwf_tmp}
	STA {vwf_cmax}
	PHX
	JSR vwf_map_active
	PLX
	BCC vwf_cursor_optj
	JSR vwf_cursor_ow
	LDA $01,s
	SEC
	SBC #$0100
	STA $01,s
	JMP vwf_cursor_ret

vwf_cursor_optj:
	JMP vwf_cursor_end

vwf_cursor_cy:
	LDA $7E4144
	AND #$00FF
	TAX
	LDA.l vwf_window_cy,x
	AND #$00FF
	XBA
	STA {vwf_tmp}
	LDA.l vwf_window_cx,x
	AND #$00FF
	ORA {vwf_tmp}
	CLC
	ADC $01,s
	STA $01,s
	JSR vwf_map_active
	BCC vwf_cursor_end
	LDA $7E4144
	AND #$00FF
	CMP #$0029
	BNE vwf_cursor_cymap
	JSR vwf_pg_cur
	JMP vwf_cursor_ret

vwf_cursor_cymap:
	LDA $03,s
	SEC
	SBC $7E4154
	LSR
	XBA
	AND #$FF00
	STA {vwf_tmp}
	LDA $01,s
	AND #$00FF
	ORA {vwf_tmp}
	STA $01,s
	TYA
	AND #$00FF
	ORA #$0200
	TAY
vwf_cursor_end:
	JSR vwf_map_active
	BCC vwf_cursor_ret
	LDA $01,s
	AND #$00FF
	STA {vwf_tmp}
	LDA $7E4148
	AND #$00FF
	SEC
	SBC {vwf_tmp}
	BEQ vwf_cursor_end_one
	BCS vwf_cursor_end_w
vwf_cursor_end_one:
	LDA #$0001
vwf_cursor_end_w:
	STA {vwf_tmp}
	TYA
	AND #$FF00
	ORA {vwf_tmp}
	TAY
vwf_cursor_ret:
	JSR vwf_mb_cur
	JSR vwf_aw_cur
	PLA
	PLX
	RTL

vwf_aw_cur:
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_aw_cur_end
	LDA $7E4144
	AND #$00FF
	CMP #$0065
	BCS vwf_aw_cur_end
	TAX
	LDA.l vwf_window_a,x
	AND #$00FF
	BEQ vwf_aw_cur_end
	TXA
	ASL
	TAX
	LDA.l $C10E76,x
	TAX
	LDA.l $C10E78,x
	AND #$00FF
	STA {vwf_tmp}
	LDA $03,s
	AND #$00FF
	CMP {vwf_tmp}
	BNE vwf_aw_cur_end
	LDA $03,s
	AND #$FF00
	STA {vwf_tmp}
	LDA $7E4148
	AND #$00FF
	ORA {vwf_tmp}
	STA $03,s
vwf_aw_cur_end:
	RTS

vwf_mb_cur:
	JSR vwf_mb_vn
	BCC vwf_mb_cur_end
	LDA $7E4144
	AND #$00FF
	CMP #$0005
	BNE vwf_mb_cur_end
	LDA $05,s
	SEC
	SBC $7E4154
	LSR #2
	AND #$0007
	ASL
	CLC
	ADC #$0002
	XBA
	AND #$FF00
	STA {vwf_tmp}
	LDA $03,s
	AND #$00FF
	ORA {vwf_tmp}
	STA $03,s
vwf_mb_cur_end:
	RTS

vwf_mb_vn:
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_mb_vn_no
	LDA $7E4142
	CMP #$7400
	BNE vwf_mb_vn_no
	PLA
	SEC
	RTS

vwf_mb_vn_no:
	PLA
	CLC
	RTS

vwf_clear_win:
	LDA {vwf_id}
	ASL
	TAX
	LDA.l $C10E76,x
	TAX
	LDA.l $C10E76,x
	AND #$00FF
	JSR vwf_xpos
	STA {vwf_col0}
	LDA.l $C10E76,x
	XBA
	AND #$00FF
	JSR vwf_ypos
	STA {vwf_row}
	LDA.l $C10E78,x
	AND #$00FF
	JSR vwf_width
	INC #2
	STA {vwf_ncols}
	LDA.l $C10E78,x
	XBA
	AND #$00FF
	JSR vwf_height
	INC #2
	STA {vwf_lines}
	LDA #$0000
	STA {vwf_zn}
vwf_clear_row:
	LDA {vwf_row}
	CMP #$0020
	BCS vwf_clear_end
	ASL #2
	TAX
	LDA {vwf_map},x
	ORA {vwf_map}+2,x
	BEQ vwf_clear_rnext
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	STA {vwf_cell}
	LDA {vwf_ncols}
	TAY
vwf_clear_col:
	LDA {vwf_cell}
	JSR vwf_zadd
	INC
	STA {vwf_cell}
	DEY
	BNE vwf_clear_col
vwf_clear_rnext:
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_clear_row
vwf_clear_end:
	JSR vwf_zflush
	RTS

vwf_window:
	PHP
	REP #$30
	LDA $7E4146
	AND #$00FF
	INC
	STA {vwf_col0}
	LDA $7E4146
	XBA
	AND #$00FF
	INC
	STA {vwf_row}
	LDA $7E4148
	AND #$00FF
	STA {vwf_ncols}
	JSR vwf_coff_set
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_f,x
	AND #$00FF
	STA {vwf_font}
	LDA $7E4148
	XBA
	AND #$00FF
	STA {vwf_lines}
	LDA {vwf_font}
	CMP #$0002
	BEQ vwf_window_lh
	LDA {vwf_lines}
	LSR
	STA {vwf_lines}
vwf_window_lh:
	JSR vwf_count
	LDA {vwf_lines}
	BEQ vwf_window_end
	JSR vwf_alloc_win
	LDA {vwf_ctx}
	BNE vwf_window_pal_map
	JSR vwf_ghost
	LDA #$2C00
	BRA vwf_window_pal

vwf_window_pal_map:
	JSR vwf_jp_pal
vwf_window_pal:
	STA {vwf_pal}
	LDA #$0000
	STA {vwf_end}
	STA {vwf_lnum}
	STA {vwf_dflag}
	STA {vwf_nomark}
	INC
	STA {vwf_dirty}
	LDA {vwf_sidx}
	BMI vwf_window_line
	ASL #2
	TAX
	LDA #$0000
	STA {vwf_opt},x
vwf_window_line:
	LDA #$0000
	STA {vwf_drawn}
	JSR vwf_line
	JSR vwf_put_line
	LDA {vwf_lnum}
	INC
	STA {vwf_lnum}
	LDA {vwf_end}
	BNE vwf_window_end
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_window_line
vwf_window_end:
	PLP
	RTS

vwf_alloc_win:
	LDA {vwf_font}
	CMP #$0002
	BEQ vwf_alloc_win2
	JMP vwf_alloc

vwf_alloc_win2:
	LDA {vwf_lines}
	PHA
	JSR vwf_count2
	JSR vwf_alloc
	PLA
	STA {vwf_lines}
	RTS

vwf_count2:
	LDA {vwf_tptr}
	PHA
	LDY #$0000
	LDA #$0000
	STA {vwf_drawn}
vwf_count2_loop:
	JSR vwf_getc
	BEQ vwf_count2_end
	CMP #$0004
	BNE vwf_count2_arg
	LDA {vwf_drawn}
	BEQ vwf_count2_next
	INY
	LDA #$0000
	STA {vwf_drawn}
	BRA vwf_count2_next

vwf_count2_arg:
	CMP #$0002
	BEQ vwf_count2_skip
	CMP #$0003
	BEQ vwf_count2_skip
	CMP #$0005
	BEQ vwf_count2_skip
	CMP #$0006
	BCC vwf_count2_next
	LDA #$0001
	STA {vwf_drawn}
	BRA vwf_count2_next

vwf_count2_skip:
	JSR vwf_inc
vwf_count2_next:
	JSR vwf_inc
	BRA vwf_count2_loop

vwf_count2_end:
	LDA {vwf_drawn}
	BEQ vwf_count2_set
	INY
vwf_count2_set:
	PLA
	STA {vwf_tptr}
	TYA
	BNE vwf_count2_ok
	INC
vwf_count2_ok:
	STA {vwf_lines}
	RTS

vwf_put_line:
	LDA {vwf_font}
	CMP #$0002
	BNE vwf_put_line_go
	LDA {vwf_drawn}
	BNE vwf_put_line_go
	LDA {vwf_row}
	INC
	STA {vwf_row}
	RTS

vwf_put_line_go:
	JMP vwf_put

vwf_jp_pal:
	LDA {vwf_id}
	ASL
	TAX
	LDA.l $C10E76,x
	CLC
	ADC #$0E7A
	TAX
	LDY #$0006
vwf_jp_pal_loop:
	LDA.l $C10000,x
	AND #$00FF
	CMP #$0001
	BNE vwf_jp_pal_esc
	INX
	DEY
	BNE vwf_jp_pal_loop
	BRA vwf_jp_pal_def

vwf_jp_pal_esc:
	CMP #$005C
	BNE vwf_jp_pal_def
	LDA.l $C10001,x
	AND #$00FF
	SEC
	SBC #$0033
	BCC vwf_jp_pal_next
	CMP #$0007
	BCS vwf_jp_pal_def
	XBA
	ASL #2
	ORA #$2000
	RTS

vwf_jp_pal_next:
	INX #2
	DEY
	BNE vwf_jp_pal_loop
vwf_jp_pal_def:
	LDA #$2000
	RTS

vwf_getc:
	PHB
	SEP #$20
	LDA {vwf_tbank}
	PHA
	PLB
	REP #$20
	LDA {vwf_tptr}
	TAX
	LDA $0000,x
	PLB
	AND #$00FF
	RTS

vwf_count:
	LDA {vwf_tptr}
	PHA
	LDY #$0001
vwf_count_loop:
	JSR vwf_getc
	BEQ vwf_count_end
	CMP #$0004
	BNE vwf_count_arg
	INY
vwf_count_arg:
	CMP #$0002
	BEQ vwf_count_skip
	CMP #$0003
	BEQ vwf_count_skip
	CMP #$0005
	BEQ vwf_count_skip
	CMP #$00F0
	BEQ vwf_count_skip
	CMP #$00FB
	BEQ vwf_count_skip
	CMP #$00FC
	BNE vwf_count_next
vwf_count_skip:
	JSR vwf_inc
vwf_count_next:
	JSR vwf_inc
	BRA vwf_count_loop

vwf_count_end:
	PLA
	STA {vwf_tptr}
	TYA
	CMP {vwf_lines}
	BCS vwf_count_max
	STA {vwf_lines}
vwf_count_max:
	RTS

vwf_alloc:
	SEP #$20
	LDA {vwf_lines}
	STA $004202
	LDA {vwf_ncols}
	STA $004203
	REP #$20
	NOP #4
	LDA $004216
	ASL
	STA {vwf_need}
	LDA {vwf_ctx}
	BNE vwf_alloc_find
	LDA {vwf_font}
	CMP #$0002
	BEQ vwf_alloc_clamp
	JSR vwf_count_map
	STA {vwf_need}
vwf_alloc_clamp:
	LDA {vwf_next}
	CMP #$0040
	BCS vwf_alloc_find
	LDA #$0040
	STA {vwf_next}
vwf_alloc_find:
	LDX #$0000
vwf_alloc_loop:
	TXA
	CMP {vwf_slot_n}
	BCS vwf_alloc_new
	LDA.l {vwf_slots},x
	CMP {vwf_id}
	BEQ vwf_alloc_found
	INX #4
	BRA vwf_alloc_loop

vwf_alloc_found:
	TXA
	STA {vwf_sidx}
	LDA.l {vwf_slots}+2,x
	STA {vwf_tile}
	LDA {vwf_ctx}
	BEQ vwf_alloc_found_end
	LDA.l {vwf_srect}+2,x
	CLC
	ADC {vwf_tile}
	STA {vwf_next}
	TXA
	CLC
	ADC #$0004
	STA {vwf_slot_n}
vwf_alloc_found_end:
	RTS

vwf_alloc_new:
	LDX #$0000
vwf_alloc_same:
	TXA
	CMP {vwf_slot_n}
	BCS vwf_alloc_fresh
	LDA.l {vwf_srect},x
	CMP $7E4146
	BNE vwf_alloc_same_next
	LDA.l {vwf_srect}+2,x
	CMP {vwf_need}
	BCC vwf_alloc_same_next
	LDA {vwf_id}
	STA.l {vwf_slots},x
	TXA
	STA {vwf_sidx}
	LDA.l {vwf_slots}+2,x
	STA {vwf_tile}
	RTS

vwf_alloc_same_next:
	INX #4
	BRA vwf_alloc_same

vwf_alloc_fresh:
	LDA {vwf_ctx}
	BEQ vwf_alloc_menu
	JMP vwf_alloc_map

vwf_alloc_menu:
	LDA {vwf_next}
	CMP #$0100
	BCS vwf_alloc_hi
	CLC
	ADC {vwf_need}
	CMP #$0101
	BCC vwf_alloc_ok
	LDA #$01C0
	STA {vwf_next}
vwf_alloc_hi:
	LDA {vwf_next}
	CMP #$01C0
	BCS vwf_alloc_hi2
	LDA #$01C0
	STA {vwf_next}
vwf_alloc_hi2:
	CLC
	ADC {vwf_need}
	CMP #$0281
	BCC vwf_alloc_ok
	LDA #$0040
	STA {vwf_next}
	LDA #$0000
	STA {vwf_slot_n}
vwf_alloc_ok:
	LDA {vwf_next}
	STA {vwf_tile}
	CLC
	ADC {vwf_need}
	STA {vwf_next}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA {vwf_slot_n}
	CMP #$0040
	BCS vwf_alloc_end
	STA {vwf_sidx}
	TAX
	LDA {vwf_id}
	STA.l {vwf_slots},x
	LDA {vwf_tile}
	STA.l {vwf_slots}+2,x
	LDA $7E4146
	STA.l {vwf_srect},x
	LDA {vwf_need}
	STA.l {vwf_srect}+2,x
	LDA $7E4148
	STA.l {vwf_ssize},x
	TXA
	CLC
	ADC #$0004
	STA {vwf_slot_n}
vwf_alloc_end:
	RTS

vwf_alloc_map:
	JSR vwf_count_map
	STA {vwf_need}
	LDA {vwf_next}
	CMP #$0140
	BCC vwf_alloc_map_low
	CMP #$0200
	BCC vwf_alloc_map_chk
vwf_alloc_map_low:
	LDA #$0140
	STA {vwf_next}
vwf_alloc_map_chk:
	JSR vwf_alloc_map_fit
	BCC vwf_alloc_map_ok
	JSR vwf_wrap_close
	LDA #$0140
	STA {vwf_next}
	LDA #$0000
	STA {vwf_slot_n}
	JSR vwf_alloc_map_fit
vwf_alloc_map_ok:
	JMP vwf_alloc_ok

vwf_wrap_close:
	PHX
	PHY
	LDA {vwf_row}
	PHA
	LDA {vwf_col0}
	PHA
	LDA {vwf_cell}
	PHA
	LDA {vwf_mt}
	PHA
	LDA {vwf_ml}
	PHA
	LDX #$0000
vwf_wc_loop:
	TXA
	CMP {vwf_slot_n}
	BCS vwf_wc_frame
	PHX
	JSR vwf_mc_erase
	PLX
	INX #4
	BRA vwf_wc_loop

vwf_wc_frame:
	LDA $7E4146
	PHA
	AND #$FF00
	ORA #$0040
	STA $004202
	PLA
	AND #$00FF
	ASL
	CLC
	ADC $004216
	TAX
	LDA $7E4148
	TAY
	JSL $C10CB8
	REP #$30
	JSR vwf_vram_on
	JSL $C10E3A
	REP #$30
	JSR vwf_vram_off
	PLA
	STA {vwf_ml}
	PLA
	STA {vwf_mt}
	PLA
	STA {vwf_cell}
	PLA
	STA {vwf_col0}
	PLA
	STA {vwf_row}
	PLY
	PLX
	RTS

vwf_alloc_map_fit:
	LDA {vwf_next}
	CMP #$005C
	BCS vwf_amf_add
	CLC
	ADC {vwf_need}
	CMP #$005C
	BCC vwf_amf_add
	LDA {vwf_cmax}
	CLC
	ADC {vwf_need}
	STA {vwf_need}
vwf_amf_add:
	LDA {vwf_next}
	CLC
	ADC {vwf_need}
	CMP #$01F9
	BCS vwf_amf_over
	CLC
	RTS

vwf_amf_over:
	SEC
	RTS

vwf_coff_set:
	LDA #$0000
	STA {vwf_coff}
	LDA {vwf_ctx}
	BEQ vwf_coff_end
	LDA {vwf_xoff}
	LSR #3
	BEQ vwf_coff_end
	CMP {vwf_ncols}
	BCS vwf_coff_end
	STA {vwf_coff}
	CLC
	ADC {vwf_col0}
	STA {vwf_col0}
	LDA {vwf_ncols}
	SEC
	SBC {vwf_coff}
	STA {vwf_ncols}
	LDA {vwf_xoff}
	AND #$0007
	STA {vwf_xoff}
vwf_coff_end:
	RTS

vwf_col_pen:
	SEC
	SBC {vwf_coff}
	BCS vwf_col_pen_ok
	LDA #$0000
vwf_col_pen_ok:
	ASL #3
	RTS

vwf_count_map:
	LDA {vwf_tptr}
	PHA
	LDA {vwf_tbank}
	PHA
	LDA #$0000
	STA {vwf_mw}
	STA {vwf_dflag}
	STA {vwf_cmax}
	LDA {vwf_lines}
	STA {vwf_ml}
vwf_cm_line:
	LDA {vwf_xoff}
	STA {vwf_pen}
	LDA #$0000
	STA {vwf_drawn}
vwf_cm_next:
	JSR vwf_getc
	BNE vwf_cm_c
	JSR vwf_dict_pop
	BCC vwf_cm_next
	JSR vwf_cm_endline
	JMP vwf_cm_done

vwf_cm_c:
	PHA
	JSR vwf_inc
	PLA
	CMP #$0004
	BNE vwf_cm_arg
	JSR vwf_cm_endline
	LDA {vwf_ml}
	DEC
	STA {vwf_ml}
	BNE vwf_cm_line
	JMP vwf_cm_done

vwf_cm_arg:
	CMP #$0002
	BNE vwf_cm_3
	JSR vwf_getc
	JSR vwf_col_pen
	STA {vwf_pen}
	JSR vwf_inc
	JMP vwf_cm_next

vwf_cm_3:
	CMP #$0003
	BNE vwf_cm_5
	JSR vwf_inc
	JMP vwf_cm_next

vwf_cm_5:
	CMP #$0005
	BNE vwf_cm_chr
	JSR vwf_getc
	CMP #$0010
	BNE vwf_cm_5s
	LDA {vwf_pen}
	CLC
	ADC #$0007
	LSR #3
	INC
	ASL #3
	JSR vwf_opt_pull
	STA {vwf_pen}
vwf_cm_5s:
	JSR vwf_inc
	JMP vwf_cm_next

vwf_cm_chr:
	CMP #$0010
	BCS vwf_cm_draw
	CMP #$0006
	BCC vwf_cm_skip
	JSR vwf_dict
vwf_cm_skip:
	JMP vwf_cm_next

vwf_cm_draw:
	CMP #$00F0
	BNE vwf_cm_draw0
	JSR vwf_dictf
	JMP vwf_cm_next

vwf_cm_draw0:
	CMP #$00FE
	BNE vwf_cm_draw3
	JSR vwf_itemstr
	JMP vwf_cm_next

vwf_cm_draw3:
	CMP #$00FF
	BNE vwf_cm_draw4
	JSR vwf_namestr
	JMP vwf_cm_next

vwf_cm_draw4:
	CMP #$00FD
	BNE vwf_cm_draw2
	JSR vwf_classstr
	JMP vwf_cm_next

vwf_cm_draw2:
	CMP #$00B0
	BCS vwf_cm_skip
	JSR vwf_cwidth1
	CLC
	ADC {vwf_pen}
	STA {vwf_pen}
	LDA #$0001
	STA {vwf_drawn}
	JMP vwf_cm_next

vwf_cm_done:
	PLA
	STA {vwf_tbank}
	PLA
	STA {vwf_tptr}
	LDA #$0000
	STA {vwf_dflag}
	LDA {vwf_mw}
	RTS

vwf_cm_endline:
	JSR vwf_line_used
	ASL
	PHA
	CMP {vwf_cmax}
	BCC vwf_cm_endline_max
	STA {vwf_cmax}
vwf_cm_endline_max:
	PLA
	CLC
	ADC {vwf_mw}
	STA {vwf_mw}
	RTS

vwf_cwidth1:
	CMP #$0060
	BCS vwf_cwidth1_b
	SEC
	SBC #$0010
	TAX
	LDA.l font1a_width,x
	AND #$00FF
	RTS

vwf_cwidth1_b:
	SEC
	SBC #$0060
	TAX
	LDA.l font1b_width,x
	AND #$00FF
	RTS

vwf_line:
	LDA {vwf_dirty}
	BEQ vwf_line_clean
	LDA {vwf_ncols}
	INC
	ASL #5
	TAY
	LDX #$0000
	LDA #$0000
	STA {vwf_dirty}
vwf_line_clear:
	STA {vwf_buf},x
	INX #2
	DEY #2
	BNE vwf_line_clear
vwf_line_clean:
	LDA {vwf_ncols}
	INC
	TAY
	LDX #$0000
	LDA {vwf_pal}
vwf_line_pal:
	STA {vwf_pcol},x
	INX #2
	DEY
	BNE vwf_line_pal
	LDA {vwf_xoff}
	STA {vwf_pen}
vwf_line_next:
	JSR vwf_getc
	BEQ vwf_line_stop
	PHA
	JSR vwf_inc
	PLA
	CMP #$0004
	BEQ vwf_line_done
	CMP #$0005
	BNE vwf_line_arg
	JSR vwf_getc
	CMP #$0010
	BNE vwf_line_setpal
	JSR vwf_opt_set
	JSR vwf_inc
	BRA vwf_line_next

vwf_line_setpal:
	AND #$0007
	XBA
	ASL #2
	ORA #$2000
	STA {vwf_pal}
	JSR vwf_inc
	BRA vwf_line_next

vwf_line_arg:
	CMP #$0002
	BNE vwf_line_arg3
	JSR vwf_getc
	JSR vwf_col_pen
	STA {vwf_pen}
	JSR vwf_inc
	BRA vwf_line_next

vwf_line_arg3:
	CMP #$0003
	BNE vwf_line_chr
	JSR vwf_inc
	BRA vwf_line_next

vwf_line_chr:
	CMP #$0010
	BCS vwf_line_draw
	CMP #$0006
	BCC vwf_line_next
	JSR vwf_dict
	BRA vwf_line_next

vwf_line_draw:
	JSR vwf_char_fe
	BRA vwf_line_next

vwf_line_stop:
	JSR vwf_dict_pop
	BCC vwf_line_next
	LDA #$0001
	STA {vwf_end}
vwf_line_done:
	RTS

vwf_dict:
	SEC
	SBC #$0006
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_dnest
	BCS vwf_dict_end
	NOP
	LDA {vwf_tptr}
	STA {vwf_dret}
	LDA {vwf_tbank}
	STA {vwf_dbank}
	LDA.l vwf_dict_ptr,x
	STA {vwf_tptr}
	LDA.l vwf_dict_ptr+2,x
	AND #$00FF
	STA {vwf_tbank}
	LDA #$0001
	STA {vwf_dflag}
vwf_dict_end:
	RTS

vwf_dictf:
	JSR vwf_getc
	PHA
	JSR vwf_inc
	PLA
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	CMP.l dictF0
	BCS vwf_dictf_end
	TAX
	JSR vwf_dfnest
	BCS vwf_dictf_end
	NOP
	LDA.l dictF0,x
	BEQ vwf_dictf_end
	PHA
	LDA {vwf_tptr}
	STA {vwf_dret}
	LDA {vwf_tbank}
	STA {vwf_dbank}
	PLA
	CLC
	ADC.w #dictF0
	STA {vwf_tptr}
	LDA.w #dictF0>>16
	ADC #$0000
	STA {vwf_tbank}
	LDA #$0001
	STA {vwf_dflag}
vwf_dictf_end:
	RTS

vwf_dict_pop:
	JSR vwf_dpop2
	BCS vwf_dict_pop_end
	NOP
	LDA #$0000
	STA {vwf_dflag}
	LDA {vwf_dret}
	STA {vwf_tptr}
	LDA {vwf_dbank}
	STA {vwf_tbank}
	CLC
	RTS

vwf_dict_pop_end:
	SEC
	RTS

vwf_opt_set:
	LDA {vwf_pen}
	CLC
	ADC #$0007
	LSR #3
	PHA
	INC
	ASL #3
	JSR vwf_opt_pull
	STA {vwf_pen}
	PLA
	CLC
	ADC {vwf_coff}
	STA {vwf_tmp}
	LDA {vwf_sidx}
	BMI vwf_opt_end
	ASL #2
	TAX
	LDA {vwf_opt},x
	CMP #$0007
	BCS vwf_opt_end
	INC
	STA {vwf_opt},x
	ASL
	PHA
	TXA
	CLC
	ADC $01,s
	TAX
	PLA
	LDA {vwf_lnum}
	ASL
	INC
	XBA
	ORA {vwf_tmp}
	STA {vwf_opt},x
vwf_opt_end:
	RTS

vwf_inc:
	LDA {vwf_tptr}
	INC
	STA {vwf_tptr}
	RTS

vwf_char:
	PHA
	LDA {vwf_font}
	CMP #$0002
	BNE vwf_char_vwf
	PLA
	JMP vwf_char2

vwf_char_vwf:
	PLA
	CMP #$00AE
	BCC vwf_char_ok
	RTS

vwf_char_ok:
	PHA
	PLA
	CMP #$0060
	BCS vwf_char_b
	SEC
	SBC #$0010
	TAX
	LDA {vwf_font}
	CMP #$0003
	BEQ vwf_char_a3
	CMP #$0000
	BNE vwf_char_a0
	LDA.l font1a_width,x
	LDY.w #font1a>>16
	BRA vwf_char_set

vwf_char_a0:
	LDA.l font0a_width,x
	LDY.w #font0a>>16
	BRA vwf_char_set

vwf_char_a3:
	LDA.l font3a_width,x
	LDY.w #font3a>>16
	BRA vwf_char_set

vwf_char_b3:
	LDA.l font3b_width,x
	LDY.w #font3b>>16
	BRA vwf_char_set

vwf_char_b:
	SEC
	SBC #$0060
	TAX
	LDA {vwf_font}
	CMP #$0003
	BEQ vwf_char_b3
	CMP #$0000
	BNE vwf_char_b0
	LDA.l font1b_width,x
	LDY.w #font1b>>16
	BRA vwf_char_set

vwf_char_b0:
	LDA.l font0b_width,x
	LDY.w #font0b>>16
vwf_char_set:
	AND #$00FF
	STA {vwf_wid}
	TYA
	STA {vwf_bank}
	TXA
	ASL #6
	STA {vwf_src}
	LDA {vwf_pen}
	AND #$0007
	ASL
	TAX
	LDA.l vwf_shift,x
	CLC
	ADC {vwf_src}
	TAY
	LDA {vwf_pen}
	LSR #3
	CMP {vwf_ncols}
	BCS vwf_char_end
	PHA
	ASL
	TAX
	LDA {vwf_pal}
	STA {vwf_pcol},x
	STA {vwf_pcol}+2,x
	PLA
	ASL #5
	TAX
	PHB
	SEP #$20
	LDA {vwf_bank}
	PHA
	PLB
	REP #$20
	LDA #$0020
	PHA
vwf_copy:
	LDA $0000,y
	ORA {vwf_buf},x
	STA {vwf_buf},x
	INY #2
	INX #2
	LDA $01,s
	DEC
	STA $01,s
	BNE vwf_copy
	PLA
	PLB
	LDA {vwf_pen}
	CLC
	ADC {vwf_wid}
	STA {vwf_pen}
	LDA #$0001
	STA {vwf_dirty}
	STA {vwf_drawn}
vwf_char_end:
	RTS

vwf_char2:
	SEC
	SBC #$0010
	CMP #$009F
	BCC vwf_char2_ok
	RTS

vwf_char2_ok:
	TAX
	LDA.l font2_width,x
	AND #$00FF
	STA {vwf_adv}
	TXA
	ASL #4
	CLC
	ADC.w #font2
	TAY
	LDA {vwf_pen}
	LSR #3
	CMP {vwf_ncols}
	BCC vwf_char2_col
	RTS

vwf_char2_col:
	PHA
	ASL
	TAX
	LDA {vwf_pal}
	STA {vwf_pcol},x
	STA {vwf_pcol}+2,x
	PLA
	ASL #5
	PHA
	LDA {vwf_pen}
	AND #$0007
	EOR #$0007
	TAX
	LDA.l vwf_bits,x
	AND #$00FF
	STA {vwf_wid}
	PLX
	PHB
	SEP #$20
	LDA.b #font2>>16
	PHA
	PLB
	REP #$20
	LDA #$0010
	PHA
vwf_char2_copy:
	SEP #$20
	LDA $0000,y
	STA $004202
	LDA {vwf_wid}
	STA $004203
	REP #$20
	NOP #3
	LDA $004216
	ASL
	SEP #$20
	ORA {vwf_buf}+32,x
	STA {vwf_buf}+32,x
	XBA
	ORA {vwf_buf},x
	STA {vwf_buf},x
	REP #$20
	INY
	INX
	LDA $01,s
	DEC
	STA $01,s
	BNE vwf_char2_copy
	PLA
	PLB
	LDA {vwf_pen}
	CLC
	ADC {vwf_adv}
	STA {vwf_pen}
	LDA #$0001
	STA {vwf_drawn}
	STA {vwf_dirty}
	RTS

vwf_put:
	LDA {vwf_ctx}
	BEQ vwf_put_vram
	JMP vwf_put_mapline

vwf_put_vram:
	JSR vwf_menu_used
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$7000
	STA $004302
	LDA {vwf_used}
	ASL #5
	STA $004305
	LDA {vwf_tile}
	ASL #3
	CLC
	ADC #$6000
	STA $002116
	LDA {vwf_used}
	BEQ vwf_put_menu
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
vwf_put_menu:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	STA {vwf_cell}
	CLC
	ADC #$2800
	STA $002116
	LDA {vwf_tile}
	JSR vwf_put_row
	LDA {vwf_font}
	CMP #$0002
	BEQ vwf_put_one
	LDA {vwf_row}
	INC
	ASL #5
	CLC
	ADC {vwf_col0}
	STA {vwf_cell}
	CLC
	ADC #$2800
	STA $002116
	LDA {vwf_tile}
	INC
	JSR vwf_put_row
	JSR vwf_vram_off
	LDA #$0002
	JSR vwf_put_mark
	LDA {vwf_used}
	ASL
	CLC
	ADC {vwf_tile}
	STA {vwf_tile}
	LDA {vwf_row}
	CLC
	ADC #$0002
	STA {vwf_row}
	RTS

vwf_put_one:
	JSR vwf_vram_off
	LDA #$0001
	JSR vwf_put_mark
	LDA {vwf_used}
	ASL
	CLC
	ADC {vwf_tile}
	STA {vwf_tile}
	LDA {vwf_row}
	INC
	STA {vwf_row}
	RTS

vwf_hl_on:
	PHY
	REP #$30
	PHA
	LDA #$2000
	BRA vwf_hl_go

vwf_hl_off:
	PHY
	REP #$30
	PHA
	LDA #$2400
vwf_hl_go:
	STA {vwf_mw}
	PHX
	JSR vwf_map_active
	PLX
	PLA
	BCS vwf_hl_map
	TAY
	SEP #$20
	LDA {vwf_mw}+1
	CMP #$24
	BEQ vwf_hl_jp_off
	JML $C10AD9

vwf_hl_jp_off:
	JML $C10B14

vwf_hl_map:
	STA {vwf_cell}
	LDA $01,s
	XBA
	AND #$00FF
	STA {vwf_ml}
	LDA $01,s
	AND #$00FF
	STA {vwf_mt}
	JSR vwf_hl_pg
	JSL $C0ED33
	PHB
	PEA $7E7E
	PLB
	PLB
	REP #$30
	LDA $77A2
	PHA
	LDA $77BA
	PHA
vwf_hl_row:
	REP #$20
	LDA $77A2
	SEC
	SBC #$7800
	ASL
	TAX
	LDY $77BC
	SEP #$20
vwf_hl_col:
	LDA $41EC,x
	AND #$03
	ORA $77B9
	STA $41EC,x
	INX #2
	DEY
	BNE vwf_hl_col
	REP #$20
	LDA $77A2
	CLC
	ADC #$0020
	STA $77A2
	DEC $77BA
	BNE vwf_hl_row
	PLA
	STA $77BA
	PLA
	STA $77A2
	JSR vwf_hl_wait
	JSL $C0ED42
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	LDA #$1801
	STA $004300
	LDA $77BC
	ASL
	STA $77BC
vwf_hl_dma:
	LDA $77A2
	STA $002116
	SEC
	SBC #$7800
	ASL
	CLC
	ADC #$41EB
	STA $004302
	LDA $77BC
	STA $004305
	SEP #$20
	LDA #$7E
	STA $004304
	LDA #$01
	STA $00420B
	REP #$20
	LDA $77A2
	CLC
	ADC #$0020
	STA $77A2
	DEC $77BA
	BNE vwf_hl_dma
	PLB
	JML $C10B01

vwf_hl_wait:
	PHP
	SEP #$20
	LDA {vwf_blank}
	BNE vwf_hl_wait_end
	LDA $004212
	BPL vwf_hl_wait2
	LDA $00213F
	LDA $002137
	LDA $00213D
	XBA
	LDA $00213D
	AND #$01
	BNE vwf_hl_wait1
	XBA
	CMP #$F5
	BCC vwf_hl_wait_end
vwf_hl_wait1:
	LDA $004212
	BMI vwf_hl_wait1
vwf_hl_wait2:
	LDA $004212
	BPL vwf_hl_wait2
vwf_hl_wait_end:
	PLP
	RTS

vwf_hl_pg:
	LDA $7E4144
	AND #$00FF
	CMP #$0029
	BNE vwf_hl_pg_end
	LDA {vwf_pg_on}
	BEQ vwf_hl_pg_end
	LDA {vwf_cell}
	SEC
	SBC #$0020
	STA {vwf_cell}
	LDA #$0002
	STA {vwf_ml}
vwf_hl_pg_end:
	RTS

vwf_pg_2a:
	PHP
	REP #$30
	LDA {vwf_pg_on}
	BEQ vwf_pg_2a_go
	PHX
	LDX #$0142
vwf_pg_2a_clr:
	TXA
	AND #$003F
	BEQ vwf_pg_2a_nx
	CMP #$003E
	BCS vwf_pg_2a_nx
	CPX #$0180
	BCS vwf_pg_2a_wr
	CMP #$0014
	BCS vwf_pg_2a_nx
vwf_pg_2a_wr:
	LDA #$2020
	STA $7E41EB,x
vwf_pg_2a_nx:
	INX #2
	CPX #$0580
	BCC vwf_pg_2a_clr
	PLX
	LDA {vwf_pgnb}
	BEQ vwf_pg_2a_go
	STA {vwf_next}
	LDA #$0004
	STA {vwf_slot_n}
vwf_pg_2a_go:
	PLP
	LDA #$2A
	JMP vwf_pg_2a_tail
	NOP #2

vwf_val:
	PHP
	REP #$30
	PHX
	JSR vwf_map_active
	PLX
	BCC vwf_val_jpj
	LDA $7E4144
	AND #$00FF
	CMP #$0025
	BEQ vwf_val_map
vwf_val_jpj:
	JMP vwf_val_jp

vwf_val_map:
	PHB
	PHX
	PHY
	TXA
	LSR
	STA {vwf_ml}
	LDA $7E4146
	AND #$00FF
	CLC
	ADC $7E4148
	AND #$00FF
	DEC #2
	STA {vwf_col0}
	LDA $7E4146
	XBA
	AND #$00FF
	CLC
	ADC #$0007
	STA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	ASL
	TAX
	LDA $7E41EB,x
	AND #$FC00
	STA {vwf_pal}
	JSR vwf_lg_03
	STA {vwf_tptr}
	JSR vwf_lg_04
	STA {vwf_tbank}
vwf_val_skip:
	LDA {vwf_ml}
	BEQ vwf_val_draw
vwf_val_skipc:
	JSR vwf_getc
	PHA
	JSR vwf_inc
	PLA
	CMP #$0004
	BNE vwf_val_skipc
	LDA {vwf_ml}
	DEC
	STA {vwf_ml}
	BRA vwf_val_skip

vwf_val_draw:
	LDA #$0003
	STA {vwf_ncols}
	LDA #$01F8
	STA {vwf_tile}
	LDA #$0004
	STA {vwf_xoff}
	LDA #$0000
	STA {vwf_font}
	STA {vwf_drawn}
	STA {vwf_dflag}
	STA {vwf_end}
	STA {vwf_coff}
	INC
	STA {vwf_dirty}
	JSR vwf_line
	JSR vwf_put
	PLY
	PLX
	PLB
	PLP
	RTL

vwf_val_jp:
	SEP #$20
	LDA.l $C00522,x
	STA $00469F
	LDA.l $C00523,x
	STA $0046A1
	PLP
	RTL

vwf_val_put:
	AND #$00FF
	STA {vwf_mt}
	TYX
	LDA $7E41EB,x
	AND #$FC00
	ORA {vwf_mt}
	STA $7E41EB,x
	RTS

vwf_map_active:
	LDA.l $7E0000+{gengo}
	AND #$00FF
	BEQ vwf_map_active_no
	LDA $7E4142
	CMP #$7800
	BNE vwf_map_active_no
	LDA $7E4144
	AND #$00FF
	CMP #$0065
	BCS vwf_map_active_no
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_lg_02
	NOP
	AND #$00FF
	BEQ vwf_map_active_no
	SEC
	RTS

vwf_map_active_no:
	CLC
	RTS

vwf_menu_used:
	LDA {vwf_font}
	CMP #$0002
	BNE vwf_menu_used_vwf
	LDA {vwf_ncols}
	STA {vwf_used}
	RTS

vwf_menu_used_vwf:
	JSR vwf_line_used
	STA {vwf_used}
	RTS

vwf_put_mapline:
	JSR vwf_line_used
	STA {vwf_used}
	BNE vwf_put_mapdma
	JMP vwf_put_map

vwf_put_mapdma:
	JSR vwf_put_skip
	JSR vwf_opaque
	JSR vwf_pack2
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$7000
	STA $004302
	JSR vwf_map_len
	STA $004305
	LDA {vwf_tile}
	ASL #3
	CLC
	ADC #$6000
	STA $002116
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	JSR vwf_vram_off
	JSR vwf_put_map
	JSR vwf_map_sync
	RTS

vwf_map_sync:
	LDA $7E4144
	AND #$00FF
	CMP #$0021
	BEQ vwf_map_sync_go
	CMP #$0022
	BEQ vwf_map_sync_go
	RTS

vwf_map_sync_go:
	LDA $7E4146
	XBA
	AND #$00FF
	STA {vwf_mt}
	LDA $7E4148
	XBA
	AND #$00FF
	INC #2
	STA {vwf_ml}
	JSR vwf_nohide_on
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
vwf_map_sync_row:
	LDA {vwf_mt}
	ASL #5
	STA {vwf_tmp}
	LDA $7E4146
	AND #$00FF
	CLC
	ADC {vwf_tmp}
	PHA
	CLC
	ADC $7E4142
	STA $002116
	PLA
	ASL
	CLC
	ADC #$41EB
	STA $004302
	LDA $7E4148
	AND #$00FF
	INC #2
	ASL
	STA $004305
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	LDA {vwf_mt}
	INC
	STA {vwf_mt}
	LDA {vwf_ml}
	DEC
	STA {vwf_ml}
	BNE vwf_map_sync_row
	JSR vwf_vram_off
	JSR vwf_nohide_off
	RTS

vwf_map_len:
	LDA {vwf_used}
	ASL #4
	PHA
	LDA {vwf_font}
	CMP #$0002
	PLA
	BEQ vwf_map_len_end
	ASL
vwf_map_len_end:
	RTS

vwf_pack2:
	LDA {vwf_font}
	CMP #$0002
	BNE vwf_pack2_end
	PHB
	LDA #$0001
	STA {vwf_mt}
vwf_pack2_loop:
	LDA {vwf_mt}
	CMP {vwf_used}
	BCS vwf_pack2_done
	ASL #4
	CLC
	ADC #$7000
	TAY
	ASL
	SEC
	SBC #$7000
	TAX
	LDA #$000F
	MVN $7E,$7E
	LDA {vwf_mt}
	INC
	STA {vwf_mt}
	BRA vwf_pack2_loop

vwf_pack2_done:
	PLB
vwf_pack2_end:
	RTS

vwf_line_used:
	LDA {vwf_drawn}
	BEQ vwf_line_used_zero
	LDA {vwf_pen}
	CLC
	ADC #$0007
	LSR #3
	CMP {vwf_ncols}
	BCC vwf_line_used_end
	LDA {vwf_ncols}
vwf_line_used_end:
	RTS

vwf_line_used_zero:
	LDA #$0000
	RTS

vwf_put_skip:
	LDA {vwf_tile}
	CMP #$005C
	BCS vwf_put_skip_end
	LDA {vwf_used}
	ASL
	CLC
	ADC {vwf_tile}
	CMP #$005C
	BCC vwf_put_skip_end
	LDA #$005C
	STA {vwf_tile}
vwf_put_skip_end:
	RTS

vwf_form:
	REP #$30
	PHX
	JSR vwf_map_active
	BCC vwf_form_end
	LDA $7E4144
	AND #$00FF
	CMP #$0003
	BNE vwf_form_end
	LDA $7E4146
	AND #$00FF
	INC
	STA {vwf_cell}
	LDA $7E4148
	AND #$00FF
	STA {vwf_ml}
vwf_form_col:
	LDA {vwf_cell}
	CMP #$0012
	BCC vwf_form_clr
	CMP #$001A
	BCC vwf_form_next
vwf_form_clr:
	ASL
	CLC
	ADC #$0380
	TAX
	LDA #$2020
	STA $7E41EB,x
	STA $7E422B,x
vwf_form_next:
	LDA {vwf_cell}
	INC
	STA {vwf_cell}
	LDA {vwf_ml}
	DEC
	STA {vwf_ml}
	BNE vwf_form_col
vwf_form_end:
	PLX
	LDA #$2900
	RTL

vwf_map_close:
	LDX #$0000
vwf_mc_find:
	TXA
	CMP {vwf_slot_n}
	BCS vwf_mc_end
	LDA.l {vwf_slots},x
	CMP {vwf_id}
	BEQ vwf_mc_next
	INX #4
	BRA vwf_mc_find

vwf_mc_next:
	INX #4
	TXA
	CMP {vwf_slot_n}
	BCS vwf_mc_end
	PHX
	JSR vwf_mc_erase
	PLX
	BRA vwf_mc_next

vwf_mc_end:
	RTS

vwf_mc_erase:
	LDA.l {vwf_ssize},x
	AND #$00FF
	INC #2
	STA {vwf_mt}
	LDA.l {vwf_ssize},x
	XBA
	AND #$00FF
	INC #2
	STA {vwf_ml}
	LDA.l {vwf_srect},x
	XBA
	AND #$00FF
	STA {vwf_row}
	LDA.l {vwf_srect},x
	AND #$00FF
	STA {vwf_col0}
vwf_mc_row:
	LDA {vwf_row}
	CMP #$0020
	BCS vwf_mc_done
	ASL #5
	CLC
	ADC {vwf_col0}
	ASL
	TAX
	LDA {vwf_col0}
	STA {vwf_cell}
	LDA {vwf_mt}
	TAY
vwf_mc_col:
	LDA {vwf_cell}
	CMP #$0020
	BCS vwf_mc_rnext
	LDA #$0000
	STA $7E41EB,x
	INX #2
	LDA {vwf_cell}
	INC
	STA {vwf_cell}
	DEY
	BNE vwf_mc_col
vwf_mc_rnext:
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_ml}
	DEC
	STA {vwf_ml}
	BNE vwf_mc_row
vwf_mc_done:
	RTS

vwf_ghost:
	LDA {vwf_tile}
	CLC
	ADC {vwf_need}
	STA {vwf_mt}
	LDA $7E4146
	AND #$00FF
	STA {vwf_dret}
	CLC
	ADC $7E4148
	AND #$00FF
	INC
	STA {vwf_dbank}
	LDA $7E4146
	XBA
	AND #$00FF
	STA {vwf_ml}
	LDA $7E4148
	XBA
	AND #$00FF
	SEC
	ADC {vwf_ml}
	STA {vwf_adv}
	LDA #$0000
	STA {vwf_zn}
	JSR vwf_ghost_half
	LDA #$0200
	JSR vwf_ghost_half
	JSR vwf_gflush
	RTS

vwf_ghost_half:
	STA {vwf_mw}
	STA {vwf_cell}
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	LDA {vwf_mw}
	CLC
	ADC #$2800
	STA $002116
	LDA $002139
	SEP #$20
	LDA #$81
	STA $004300
	LDA #$39
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$7000
	STA $004302
	LDA #$0400
	STA $004305
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	JSR vwf_vram_off
vwf_ghost_loop:
	LDA {vwf_cell}
	JSR vwf_bit
	LDA {vwf_map},x
	AND {vwf_tmp}
	AND #$00FF
	BEQ vwf_ghost_next
	LDA {vwf_cell}
	SEC
	SBC {vwf_mw}
	ASL
	TAX
	LDA {vwf_buf},x
	AND #$03FF
	CMP {vwf_tile}
	BCC vwf_ghost_next
	CMP {vwf_mt}
	BCS vwf_ghost_next
	LDA {vwf_cell}
	LSR #5
	CMP {vwf_ml}
	BCC vwf_ghost_out
	CMP {vwf_adv}
	BEQ vwf_ghost_in
	BCS vwf_ghost_out
vwf_ghost_in:
	LDA {vwf_cell}
	AND #$001F
	CMP {vwf_dret}
	BCC vwf_ghost_out
	CMP {vwf_dbank}
	BEQ vwf_ghost_next
	BCC vwf_ghost_next
vwf_ghost_out:
	LDA {vwf_cell}
	JSR vwf_ghost_add
vwf_ghost_next:
	LDA {vwf_cell}
	INC
	STA {vwf_cell}
	SEC
	SBC {vwf_mw}
	CMP #$0200
	BCC vwf_ghost_loop
	RTS

vwf_ghost_add:
	PHA
	JSR vwf_bit
	SEP #$20
	LDA {vwf_tmp}
	EOR #$FF
	AND {vwf_map},x
	STA {vwf_map},x
	REP #$20
	LDA {vwf_zn}
	TAX
	PLA
	CLC
	ADC #$2800
	STA $7E3020,x
	TXA
	INC #2
	STA {vwf_zn}
	CMP #$0100
	BCC vwf_ghost_add_end
	JSR vwf_gflush
vwf_ghost_add_end:
	RTS

vwf_gflush:
	LDA {vwf_zn}
	BEQ vwf_gflush_end
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	LDX #$0000
vwf_gflush_loop:
	LDA $7E3020,x
	STA $002116
	LDA #$0000
	STA $002118
	INX #2
	TXA
	CMP {vwf_zn}
	BCC vwf_gflush_loop
	JSR vwf_vram_off
	LDA #$0000
	STA {vwf_zn}
vwf_gflush_end:
	RTS

vwf_opt_pull:
	PHX
	PHA
	LDA {vwf_id}
	AND #$00FF
	TAX
	LDA.l vwf_window_o,x
	AND #$00FF
	STA {vwf_wid}
	PLA
	SEC
	SBC {vwf_wid}
	PLX
	RTS

vwf_snap_restore:
	LDA {vwf_snp_n}
	BEQ vwf_snr_end
	DEC
	STA {vwf_snp_c}
vwf_snr_find:
	LDA {vwf_snp_c}
	ASL
	TAX
	LDA.l {vwf_snp_t},x
	TAX
	LDA $7E0000,x
	CMP {vwf_id}
	BEQ vwf_snr_found
	LDA {vwf_snp_c}
	BEQ vwf_snr_end
	DEC
	STA {vwf_snp_c}
	BRA vwf_snr_find

vwf_snr_found:
	LDA {vwf_snp_n}
	DEC
	CMP {vwf_snp_c}
	BEQ vwf_snr_done
	STA {vwf_snp_n}
	ASL
	TAX
	LDA.l {vwf_snp_t},x
	JSR vwf_snap_put
	BRA vwf_snr_found

vwf_snr_done:
	LDA {vwf_snp_c}
	INC
	STA {vwf_snp_n}
vwf_snr_end:
	RTS

vwf_p7_clear:
	LDA {vwf_p7size}
	BNE vwf_p7_clear_go
	RTS

vwf_p7_clear_go:
	AND #$00FF
	STA {vwf_ncols}
	LDA {vwf_p7size}
	XBA
	AND #$00FF
	STA {vwf_lines}
	LDA {vwf_p7pos}
	AND #$00FF
	INC
	STA {vwf_col0}
	LDA {vwf_p7pos}
	XBA
	AND #$00FF
	INC
	STA {vwf_row}
	LDA #$0000
	STA {vwf_p7size}
	JSR vwf_nohide_on
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
vwf_p7_clear_row:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	CLC
	ADC #$2800
	JSR vwf_item_clr_row
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_p7_clear_row
	JSR vwf_vram_off
	JSR vwf_nohide_off
	RTS

vwf_p14_up:
	PHP
	REP #$30
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_p14_up_jp
	LDX #$0140
	STX $00
	LDX #$452B
	LDY #$7DA0
	PLP
	RTL

vwf_p14_up_jp:
	LDX #$00C0
	STX $00
	LDX #$456B
	LDY #$7DC0
	PLP
	RTL

vwf_p14_close:
	PHP
	REP #$30
	JSR vwf_p7_clear
	PLP
	PHP
	PHK
	PEA vwf_p14_close_r-1
	PEA $EC62
	JML $C0D40F

vwf_p14_close_r:
	PLP
	STZ $2023
	RTL

vwf_p14_close2:
	PHP
	REP #$30
	JSR vwf_p7_clear
	PLP
	PHP
	PHK
	PEA vwf_p14_close2_r-1
	PEA $EC62
	JML $C0D40F

vwf_p14_close2_r:
	PLP
	LDA #$0A
	RTL

vwf_pop_close:
	PHP
	REP #$30
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_pop_close_go
	LDA $7E4142
	CMP #$7C00
	BNE vwf_pop_close_go
	JSR vwf_p7_clear
vwf_pop_close_go:
	PLP
	PHK
	PEA vwf_pop_close_r-1
	PEA $EC62
	JML $C0D40F

vwf_pop_close_r:
	LDA $2022
	RTL

vwf_snap_push:
	LDA {vwf_snp_n}
	BEQ vwf_snp_first
	DEC
	ASL
	TAX
	LDA.l {vwf_snp_t},x
	TAX
	LDA $7E0000,x
	CMP {vwf_id}
	BNE vwf_snp_more
	RTS

vwf_snp_more:
	LDA {vwf_snp_n}
	CMP #$0008
	BCC vwf_snp_room
	RTS

vwf_snp_room:
	LDA $7E0004,x
	AND #$00FF
	INC #2
	STA {vwf_mt}
	LDA $7E0004,x
	XBA
	AND #$00FF
	INC #2
	STA {vwf_ml}
	JSR vwf_snp_mul
	CLC
	ADC #$0006
	STA {vwf_tmp}
	TXA
	CLC
	ADC {vwf_tmp}
	BRA vwf_snp_at

vwf_snp_first:
	LDA #$3140
vwf_snp_at:
	STA {vwf_snp_e}
	LDA $7E4148
	AND #$00FF
	INC #2
	STA {vwf_mt}
	LDA $7E4148
	XBA
	AND #$00FF
	INC #2
	STA {vwf_ml}
	JSR vwf_snp_mul
	CMP #$0259
	BCC vwf_snp_small
	RTS

vwf_snp_small:
	CLC
	ADC #$0006
	CLC
	ADC {vwf_snp_e}
	CMP #$34C0
	BCC vwf_snp_fit
	RTS

vwf_snp_fit:
	LDA {vwf_snp_n}
	ASL
	TAX
	LDA {vwf_snp_e}
	STA.l {vwf_snp_t},x
	TAX
	LDA {vwf_id}
	STA $7E0000,x
	LDA $7E4146
	STA $7E0002,x
	LDA $7E4148
	STA $7E0004,x
	LDA {vwf_snp_n}
	INC
	STA {vwf_snp_n}
	TXA
	CLC
	ADC #$0006
	STA {vwf_snp_c}
	LDA $7E4146
	AND #$00FF
	STA {vwf_col0}
	LDA $7E4146
	XBA
	AND #$00FF
	STA {vwf_row}
	LDA {vwf_ml}
	STA {vwf_lines}
vwf_snp_r1:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	ASL
	TAX
	LDA {vwf_snp_c}
	TAY
	LDA {vwf_mt}
	STA {vwf_cell}
vwf_snp_c1:
	LDA $7E41EB,x
	PHX
	TYX
	STA $7E0000,x
	PLX
	INX #2
	INY #2
	LDA {vwf_cell}
	DEC
	STA {vwf_cell}
	BNE vwf_snp_c1
	TYA
	STA {vwf_snp_c}
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_snp_r1
	LDA $7E4146
	XBA
	AND #$00FF
	STA {vwf_row}
	LDA {vwf_ml}
	STA {vwf_lines}
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
vwf_snp_r2:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	CLC
	ADC #$2800
	STA $002116
	LDA $002139
	SEP #$20
	LDA #$81
	STA $004300
	LDA #$39
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA {vwf_snp_c}
	STA $004302
	LDA {vwf_mt}
	ASL
	STA $004305
	CLC
	ADC {vwf_snp_c}
	STA {vwf_snp_c}
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_snp_r2
	JSR vwf_vram_off
	RTS

vwf_snp_mul:
	SEP #$20
	LDA {vwf_mt}
	STA $004202
	LDA {vwf_ml}
	STA $004203
	REP #$20
	NOP #4
	LDA $004216
	ASL #2
	RTS

vwf_snap_put:
	TAX
	LDA $7E0002,x
	AND #$00FF
	STA {vwf_col0}
	LDA $7E0002,x
	XBA
	AND #$00FF
	STA {vwf_row}
	LDA $7E0004,x
	AND #$00FF
	INC #2
	STA {vwf_mt}
	LDA $7E0004,x
	XBA
	AND #$00FF
	INC #2
	STA {vwf_ml}
	STA {vwf_lines}
	TXA
	CLC
	ADC #$0006
	TAY
vwf_spu_r1:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	ASL
	TAX
	LDA {vwf_mt}
	STA {vwf_cell}
vwf_spu_c1:
	PHX
	TYX
	LDA $7E0000,x
	PLX
	STA $7E41EB,x
	INX #2
	INY #2
	LDA {vwf_cell}
	DEC
	STA {vwf_cell}
	BNE vwf_spu_c1
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_spu_r1
	LDA {vwf_row}
	SEC
	SBC {vwf_ml}
	STA {vwf_row}
	LDA {vwf_ml}
	STA {vwf_lines}
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
vwf_spu_r2:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	STA {vwf_mw}
	CLC
	ADC #$2800
	STA $002116
	LDA {vwf_mt}
	STA {vwf_cell}
vwf_spu_c2:
	PHX
	TYX
	LDA $7E0000,x
	PLX
	STA $002118
	STA {vwf_dret}
	LDA {vwf_mw}
	JSR vwf_spu_mark
	LDA {vwf_mw}
	INC
	STA {vwf_mw}
	INY #2
	LDA {vwf_cell}
	DEC
	STA {vwf_cell}
	BNE vwf_spu_c2
	LDA {vwf_row}
	INC
	STA {vwf_row}
	LDA {vwf_lines}
	DEC
	STA {vwf_lines}
	BNE vwf_spu_r2
	JSR vwf_vram_off
	RTS

vwf_spu_mark:
	PHX
	JSR vwf_bit
	LDA {vwf_dret}
	AND #$03FF
	CMP #$0040
	BCC vwf_spu_clr
	CMP #$0100
	BCC vwf_spu_set
	CMP #$011C
	BCC vwf_spu_clr
vwf_spu_set:
	SEP #$20
	LDA {vwf_map},x
	ORA {vwf_tmp}+0
	BRA vwf_spu_st

vwf_spu_clr:
	SEP #$20
	LDA {vwf_tmp}+0
	EOR #$FF
	AND {vwf_map},x
vwf_spu_st:
	STA {vwf_map},x
	REP #$20
	PLX
	RTS

vwf_curtile:
	LDA.l $C10848,x
	STA $41E6
	PHX
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_curtile_end
	LDA $7E4142
	CMP #$7800
	BNE vwf_curtile_menu
	LDA $7E4144
	AND #$00FF
	CMP #$0030
	BNE vwf_curtile_end
	LDA #$01FF
	STA {vwf_tmp}
	LDX #$0000
	JSR vwf_curtile_fix
	LDX #$0004
	JSR vwf_curtile_fix
	JSR vwf_cur_upload_map
	BRA vwf_curtile_end

vwf_curtile_menu:
	CMP #$7400
	BNE vwf_curtile_end
	LDA $7E4144
	AND #$00FF
	CMP #$0005
	BEQ vwf_curtile_end
	LDX #$0143
	CMP #$0018
	BEQ vwf_curtile_ok
	LDX #$0141
	CMP #$000C
	BCC vwf_curtile_ok
	CMP #$0010
	BCC vwf_curtile_end
vwf_curtile_ok:
	TXA
	STA {vwf_tmp}
	LDX #$0000
	JSR vwf_curtile_fix
	LDX #$0004
	JSR vwf_curtile_fix
	JSR vwf_cur_upload
vwf_curtile_end:
	PLX
	RTL

vwf_curtile_fix:
	LDA $41E0,x
	AND #$03FF
	CMP #$005B
	BNE vwf_curtile_fix_end
	LDA $41E0,x
	AND #$FC00
	ORA {vwf_tmp}
	STA $41E0,x
vwf_curtile_fix_end:
	RTS

vwf_cur_upload:
	JSR vwf_nohide_on
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA.b #vwf_cur_gfx>>16
	STA $004304
	REP #$20
	LDA.w #vwf_cur_gfx
	STA $004302
	LDA #$0080
	STA $004305
	LDA #$1400
	STA $002116
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	JSR vwf_vram_off
	JSR vwf_nohide_off
	RTS

vwf_cur_upload_map:
	JSR vwf_nohide_on
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA.b #vwf_cur_gfx2>>16
	STA $004304
	REP #$20
	LDA.w #vwf_cur_gfx2
	STA $004302
	LDA #$0020
	STA $004305
	LDA #$6FF0
	STA $002116
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	JSR vwf_vram_off
	JSR vwf_nohide_off
	RTS

vwf_cur_gfx2:
	db $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $20, $FF, $30, $FF
	db $38, $FF, $3C, $F3, $38, $E7, $10, $EF, $00, $FF, $00, $FF, $00, $FF, $00, $FF

vwf_nohide_on:
	PHP
	SEP #$20
	LDA {vwf_hidden}
	STA {vwf_hidden}+1
	LDA #$01
	STA {vwf_hidden}
	PLP
	RTS

vwf_nohide_off:
	PHP
	SEP #$20
	LDA {vwf_hidden}+1
	STA {vwf_hidden}
	PLP
	RTS

vwf_cur_sh:
	TYA
	LSR
	CLC
	ADC $7E4142
	JSR vwf_blk_adj
	SEC
	SBC $7E4142
	ASL
	TAY
	LDA $41E0,x
	ORA $41DC
	STA $41EB,y
	PHX
	TYX
	JSR vwf_cur_up
	PLX
	RTL

vwf_cur_up:
	PHA
	AND #$03FD
	CMP #$01FD
	BEQ vwf_cur_up_hit
	CMP #$0141
	BNE vwf_cur_up_not
vwf_cur_up_hit:
	LDA $01,s
	DEC
	STA $7E41AB,x
	PLA
	RTS

vwf_cur_up_not:
	LDA $7E41AB,x
	AND #$03FD
	CMP #$01FC
	BEQ vwf_cur_up_clr
	CMP #$0140
	BNE vwf_cur_up_end
vwf_cur_up_clr:
	LDA $7E41AB,x
	AND #$FC00
	ORA #$0020
	STA $7E41AB,x
vwf_cur_up_end:
	PLA
	RTS

vwf_blk_a:
	TYA
	JSR vwf_blk_adj
	TAY
	STA $002116
	STA {vwf_blkad}
	RTL

vwf_blk_adj:
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_blk_adj_end
	LDA $7E4142
	CMP #$7400
	BNE vwf_blk_adj_end
	LDA $01,s
	AND #$001F
	CMP #$000F
	BNE vwf_blk_adj_end
	LDA $01,s
	SEC
	SBC #$74A0
	CMP #$0140
	BCS vwf_blk_adj_end
	PLA
	INC
	RTS

vwf_blk_adj_end:
	PLA
	RTS

vwf_cur_vr:
	JSR vwf_blk_adj
	STA $002116
	STA {vwf_blkad}
	LDA $41E0,x
	TAY
	JMP vwf_blk_w

vwf_blk_w:
	TYA
	ORA $41DC
	STA $002118
	PHX
	PHA
	LDA {vwf_blkad}
	SEC
	SBC $7E4142
	ASL
	TAX
	PLA
	JSR vwf_cur_up
	LDA {vwf_blkad}
	SEC
	SBC #$0020
	STA $002116
	LDA $7E41AB,x
	STA $002118
	PLX
	RTL

vwf_cur_gfx:
	db $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $20, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $30, $FF, $38, $FF, $3C, $F3, $38, $E7, $10, $EF, $00, $FF, $00, $FF, $00, $FF
	db $FF, $FF, $FF, $FF, $F3, $F3, $E7, $E7, $EF, $EF, $FF, $FF, $FF, $FF, $FF, $FF
	db $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $FF, $20, $FF, $30, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $38, $FF, $3C, $F3, $38, $E7, $10, $EF, $00, $FF, $00, $FF, $00, $FF, $00, $FF
	db $FF, $FF, $F3, $F3, $E7, $E7, $EF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

vwf_cursor_ow:
	LDA $7E4148
	AND #$00FF
	SEC
	SBC $03,s
	AND #$00FF
	STA {vwf_mt}
	PHX
	TXA
	SEC
	SBC {vwf_cmax}
	TAX
	LDA {vwf_opt},x
	PLX
	STA {vwf_ml}
	LDA {vwf_cmax}
	LSR
	CMP {vwf_ml}
	BCS vwf_cursor_ow_set
	LDA {vwf_opt}+2,x
	XBA
	AND #$00FF
	STA {vwf_mw}
	LDA $03,s
	XBA
	AND #$00FF
	CMP {vwf_mw}
	BNE vwf_cursor_ow_set
	LDA {vwf_opt}+2,x
	AND #$00FF
	SEC
	SBC $03,s
	AND #$00FF
	DEC
	STA {vwf_mt}
vwf_cursor_ow_set:
	LDA #$0200
	ORA {vwf_mt}
	TAY
	RTS

vwf_item:
	LDA $1007,y
	AND #$00FF
	STA {vwf_ml}
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_item_jp
	LDA $7E4142
	CMP #$7400
	BNE vwf_item_jp
	LDA {vwf_ctx}
	BNE vwf_item_jp
	JSR vwf_lg_05
	NOP
	AND #$FFFF
	STA {vwf_mt}
	LDA {vwf_ml}
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	CMP {vwf_mt}
	BCC vwf_item_vn
vwf_item_jp:
	LDX #$0000
	LDA {vwf_ml}
	JSL $C0EBE1
	LDA $04,s
	CLC
	ADC #$0040
	JSL $C0EC09
	RTL

vwf_item_vn:
	TAX
	PHY
	PHB
	JSR vwf_lg_06
	NOP
	STA {vwf_tptr}
	JSR vwf_lg_07
	NOP
	AND #$00FF
	STA {vwf_tbank}
	JSR vwf_lg_08
	CLC
	ADC {vwf_tptr}
	STA {vwf_tptr}
	JSR vwf_lg_09
	ADC #$0000
	STA {vwf_tbank}
	LDA $07,s
	CLC
	ADC #$0040
	PHA
	LDX #$5700
	JSL $C0EC09
	PLA
	LSR
	PHA
	AND #$001F
	STA {vwf_col0}
	PLA
	LSR #5
	STA {vwf_row}
	LDA #$000C
	STA {vwf_ncols}
	JSR vwf_nohide_on
	LDA {vwf_row}
	CMP #$000E
	BCS vwf_item_lo
	LDA #$0160
	BRA vwf_item_t

vwf_item_lo:
	LDA #$0178
vwf_item_t:
	STA {vwf_tile}
	LDA #$3C00
	STA {vwf_pal}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA #$0000
	STA {vwf_xoff}
	STA {vwf_font}
	STA {vwf_drawn}
	STA {vwf_dflag}
	STA {vwf_end}
	STA {vwf_nomark}
	STA {vwf_coff}
	INC
	STA {vwf_dirty}
	JSR vwf_line
	JSR vwf_item_clr
	JSR vwf_put
	JSR vwf_nohide_off
	PLB
	PLY
	RTL

vwf_item_clr:
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	CLC
	ADC #$2800
	JSR vwf_item_clr_row
	CLC
	ADC #$0020
	JSR vwf_item_clr_row
	JSR vwf_vram_off
	RTS

vwf_item_clr_row:
	STA $002116
	PHA
	LDA {vwf_ncols}
	TAX
	LDA #$0000
vwf_item_clr_col:
	STA $002118
	DEX
	BNE vwf_item_clr_col
	PLA
	RTS

vwf_char_fe:
	CMP #$00F0
	BNE vwf_char_fe_c0
	JMP vwf_dictf

vwf_char_fe_c0:
	CMP #$00FA
	BNE vwf_char_fe_c1
	JMP vwf_kw_mid

vwf_char_fe_c1:
	CMP #$00FB
	BNE vwf_char_fe_f
	JMP vwf_framesel

vwf_char_fe_f:
	CMP #$00FC
	BNE vwf_char_fe_d
	JMP vwf_fontsel

vwf_char_fe_d:
	CMP #$00FD
	BNE vwf_char_fe_n
	JMP vwf_classstr

vwf_char_fe_n:
	CMP #$00FF
	BEQ vwf_namestr
	CMP #$00FE
	BNE vwf_char_fe_c
	JMP vwf_itemstr

vwf_char_fe_c:
	JMP vwf_char_f9

vwf_namestr:
	LDA {vwf_dflag}
	BEQ vwf_namestr_go
	RTS

vwf_namestr_go:
	LDA {vwf_nameid}
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	PHA
	LDA {vwf_nameid}
	CMP #$0040
	PLA
	BCC vwf_namestr_lo
	CLC
	ADC #$0020
vwf_namestr_lo:
	JSR vwf_lg_0A
	NOP
	BCS vwf_namestr_end
	TAX
	JSR vwf_lg_0B
	NOP
	BEQ vwf_namestr_end
	TAX
	LDA {vwf_tptr}
	STA {vwf_dret}
	LDA {vwf_tbank}
	STA {vwf_dbank}
	LDA #$0001
	STA {vwf_dflag}
	JSR vwf_lg_0B
	NOP
	AND #$00FF
	CMP #$0010
	BCS vwf_namestr_ptr
	CMP #$0006
	BCC vwf_namestr_ptr
	SEC
	SBC #$0006
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	LDA.l vwf_dict_ptr,x
	STA {vwf_tptr}
	LDA.l vwf_dict_ptr+2,x
	AND #$00FF
	STA {vwf_tbank}
	RTS

vwf_namestr_ptr:
	TXA
	CLC
	JSR vwf_lg_0C
	STA {vwf_tptr}
	JSR vwf_lg_0D
	ADC #$0000
	STA {vwf_tbank}
vwf_namestr_end:
	RTS

vwf_name_str:
	db $FF, $00

vwf_vn_menu:
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_vn_menu_no
	LDA $7E4142
	CMP #$7400
	BNE vwf_vn_menu_no
	LDA {vwf_ctx}
	BNE vwf_vn_menu_no
	SEC
	RTS

vwf_vn_menu_no:
	CLC
	RTS

vwf_name_pal:
	LDA $7E2029
	AND #$00FC
	XBA
	ORA #$2000
	RTS

vwf_name_vwf:
	PHY
	PHB
	PHX
	PHA
	LDX #$5700
	JSL $C0EC09
	LDA {vwf_font}
	BNE vwf_name_vwf_go
	LDA $01,s
	CLC
	ADC #$0040
	LDX #$5700
	JSL $C0EC09
vwf_name_vwf_go:
	PLA
	LSR
	PHA
	AND #$001F
	STA {vwf_col0}
	PLA
	LSR #5
	STA {vwf_row}
	PLA
	STA {vwf_tile}
	JSR vwf_nohide_on
	LDA #$2C00
	STA {vwf_pal}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA #$0000
	STA {vwf_xoff}
	STA {vwf_drawn}
	STA {vwf_dflag}
	STA {vwf_end}
	STA {vwf_nomark}
	STA {vwf_coff}
	INC
	STA {vwf_dirty}
	JSR vwf_line
	JSR vwf_name_clr
	LDA {vwf_font}
	BNE vwf_name_vwf_p2
	JSR vwf_put
	BRA vwf_name_vwf_end

vwf_name_vwf_p2:
	JSR vwf_name_put2
vwf_name_vwf_end:
	JSR vwf_nohide_off
	PLB
	PLY
	RTS

vwf_name_put2:
	JSR vwf_line_used
	STA {vwf_used}
	BNE vwf_name_put2_go
	RTS

vwf_name_put2_go:
	JSR vwf_pack2
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$7000
	STA $004302
	LDA {vwf_used}
	ASL #4
	STA $004305
	LDA {vwf_tile}
	ASL #3
	CLC
	ADC #$6000
	STA $002116
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	CLC
	ADC #$2800
	STA $002116
	LDA {vwf_used}
	TAX
	LDA {vwf_tile}
	ORA {vwf_pal}
vwf_name_put2_col:
	STA $002118
	INC
	DEX
	BNE vwf_name_put2_col
	JSR vwf_vram_off
	LDA #$0001
	JSR vwf_put_mark
	RTS

vwf_name_clr:
	LDA {vwf_font}
	BNE vwf_name_clr_one
	JMP vwf_item_clr

vwf_name_clr_one:
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	CLC
	ADC #$2800
	JSR vwf_item_clr_row
	JSR vwf_vram_off
	RTS

vwf_name_tp:
	LDA.w #vwf_name_str
	STA {vwf_tptr}
	LDA.w #vwf_name_str>>16
	STA {vwf_tbank}
	RTS

vwf_tname:
	STA {vwf_nameid}
	JSR vwf_vn_menu
	BCC vwf_tname_jp
	JSR vwf_name_tp
	LDA #$0008
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDX #$0190
	LDA $04,s
	SEC
	SBC #$0040
	CMP #$0300
	BCC vwf_tname_go
	LDX #$01A0
vwf_tname_go:
	JSR vwf_name_vwf
	RTL

vwf_tname_jp:
	LDA {vwf_nameid}
	JSL $C0EBD7
	LDA $04,s
	SEC
	SBC #$0040
	JSL $C0EC09
	RTL

vwf_tclass:
	JSR vwf_vn_menu
	BCS vwf_tclass_vn
	JMP vwf_tclass_jp

vwf_tclass_vn:
	LDA $04,s
	SEC
	SBC #$0030
	PHY
	PHB
	TAY
	PEA $7E7E
	PLB
	PLB
	LDX #$0000
vwf_tclass_hdr:
	LDA.l vwf_tclass_lbl,x
	STA $41EB,y
	INY #2
	INX #2
	CPX #$0024
	BCC vwf_tclass_hdr
	PLB
	PLY
	LDA $1006,y
	AND #$00FF
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	JSR vwf_lg_0E
	NOP
	BCS vwf_tclass_end
	TAX
	JSR vwf_lg_0F
	NOP
	CLC
	JSR vwf_lg_10
	STA {vwf_tptr}
	JSR vwf_lg_11
	ADC #$0000
	STA {vwf_tbank}
	LDA #$000A
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDX #$0124
	LDA $04,s
	CLC
	ADC #$005C
	CMP #$0300
	BCC vwf_tclass_go
	LDX #$0138
vwf_tclass_go:
	JSR vwf_name_vwf
vwf_tclass_end:
	RTL

vwf_tclass_lbl:
	dw $0505, $0506, $0500, $0507, $04A0, $0508, $0500, $0509, $04A0
	dw $050A, $0500, $050B, $04A0, $050C, $0500, $050D, $050E, $050F

vwf_tclass_jp:
	LDA $04,s
	JSL $C0EC09
	RTL

vwf_tsel:
	LDX #$0000
	LDA $04
	CMP #$0010
	BEQ vwf_tsel_lbl
	LDA $0608,y
	CMP #$FFFF
	BEQ vwf_tsel_emp
	SEC
	RTL

vwf_tsel_emp:
	LDX #$0009
vwf_tsel_lbl:
	JSR vwf_vn_menu
	BCC vwf_tsel_end
	PHY
	PHX
	LDA $08,s
	JSR vwf_tsel_vn
	PLX
	PLY
	LDX #$0009
vwf_tsel_end:
	CLC
	RTL

vwf_tsel_vn:
	PHA
	CLC
	ADC #$0010
	TAX
	LDA $7E2029
	XBA
	AND #$FF00
	ORA #$0020
	LDY #$0012
vwf_tsel_lb:
	STA $7E41AB,x
	INX #2
	DEY
	BNE vwf_tsel_lb
	LDA.w #vwf_tsel_nul
	STA {vwf_tptr}
	LDA $04
	CMP #$0010
	BNE vwf_tsel_nm
	JSR vwf_lg_12
	STA {vwf_tptr}
vwf_tsel_nm:
	JSR vwf_lg_13
	STA {vwf_tbank}
	LDA #$0008
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDX #$0190
	LDA $01,s
	SEC
	SBC #$0040
	CMP #$0300
	BCC vwf_tsel_nm2
	LDX #$01A0
vwf_tsel_nm2:
	JSR vwf_name_vwf
	LDA.w #vwf_tsel_nul
	STA {vwf_tptr}
	LDA #$000A
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDX #$0124
	LDA $01,s
	CLC
	ADC #$005C
	CMP #$0300
	BCC vwf_tsel_cl
	LDX #$0138
vwf_tsel_cl:
	JSR vwf_name_vwf
	LDA.w #vwf_tsel_nul
	STA {vwf_tptr}
	LDA #$000C
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDX #$0160
	LDA $01,s
	CLC
	ADC #$0040
	CMP #$0380
	BCC vwf_tsel_it
	LDX #$0178
vwf_tsel_it:
	JSR vwf_name_vwf
	PLA
	RTS

vwf_tsel_str:
	db $23, $32, $93, $38, $31, $4F, $3C, $60, $2D
vwf_tsel_nul:
	db $00

vwf_fontsel:
	JSR vwf_getc
	PHA
	JSR vwf_inc
	PLA
	CMP #$0004
	BCS vwf_fontsel_end
	TAX
	LDA.l vwf_fontmap,x
	AND #$00FF
	CMP #$00FF
	BEQ vwf_fontsel_end
	STA {vwf_font}
vwf_fontsel_end:
	RTS

vwf_framesel:
	JSR vwf_getc
	PHA
	JSR vwf_inc
	PLA
	JSR vwf_kw_setc
	RTS

vwf_fontmap:
	db $01, $00, $FF, $03

vwf_kw_wait:
	LDA {vwf_kwon}
	BEQ vwf_kw_wait_go
	LDA $7E2CFC
	BIT #$0080
	BEQ vwf_kw_wait_end
vwf_kw_wait_go:
	PHK
	PEA vwf_kw_wait_end-1
	PEA $EC62
	JML $C0FACD

vwf_kw_wait_end:
	REP #$30
	LDA $7E2CFC
	RTL

vwf_kw_scroll:
	REP #$30
	LDA {vwf_kwon}
	BEQ vwf_kw_s_jp
	LDA {vwf_kwt}
	BEQ vwf_kw_s_op
	LDA $7E204F
	AND #$00FF
	CMP #$0001
	BNE vwf_kw_s_jp
	JMP vwf_kw_h_go

vwf_kw_s_op:
	LDA $7E2D1F
	AND #$00FF
	BEQ vwf_kw_s_jp
	LDA $7E204F
	AND #$00FF
	CMP #$0001
	BNE vwf_kw_s_go
	JMP vwf_kw_h_go

vwf_kw_s_jp:
	PHX
	PHY
	LDA $7E2D11
	TAY
	JML $C0F53B

vwf_kw_s_go:
	PHX
	PHY
	PHB
	PEA $7E7E
	PLB
	PLB
	LDA $2D0D
	JSR vwf_kw_s_next
	STA $77FC
	JSR vwf_kw_s_next
	STA $77FA
	JSR vwf_kw_s_next
	STA $77F8
	JSR vwf_kw_nmi
	JSL $C0ED42
	JSL $C10E3A
	REP #$30
	JSR vwf_kw_s_read
	JSL $C0ED33
	LDA #$0008
	STA $77FE
vwf_kw_s_loop:
	JSR vwf_kw_s_shift
	JSR vwf_kw_nmi
	JSR vwf_kw_nmi
	JSL $C0ED42
	LDY #$1800
	JSR vwf_kw_s_all
	JSL $C0ED33
	DEC $77FE
	BNE vwf_kw_s_loop
	LDY $2D11
	TYA
	CLC
	ADC #$0140
	TAX
	PHX
	PHY
	JSR vwf_kw_f555
	PLY
	PLX
	JSR vwf_kw_f555
	JSR vwf_kw_nmi
	JSL $C0ED42
	JSL $C10E3A
	REP #$30
	LDY #$1800
	LDA $77FA
	LDX #$2D20
	JSR vwf_kw_s_dma
	LDA $77FC
	LDX #$2EA0
	JSR vwf_kw_s_dma
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	JSL $C0ED33
	PLB
	PLY
	PLX
	JML $C0F554

vwf_kw_h_go:
	PHX
	PHY
	PHB
	PEA $7E7E
	PLB
	PLB
	LDX #$00BE
	LDA {vwf_kwm}
	AND #$00FF
	BEQ vwf_kw_h_en
	LDX #$00FE
vwf_kw_h_en:
	STX $7770
	LDA $2D11
	AND #$FFC0
	LSR #3
	INC
	STA $7772
	LDX #$0000
vwf_kw_h_save:
	LDA $48EB,x
	STA $7000,x
	INX #2
	CPX #$00C0
	BCC vwf_kw_h_save
	LDY #$0000
vwf_kw_h_copy:
	LDA $2D11
	AND #$FFC0
	CLC
	ADC #$0140
	TAX
	LDA #$0020
	STA $77A4
vwf_kw_h_copy2:
	LDA $41EB,x
	STA $48EB,y
	INX #2
	INY #2
	DEC $77A4
	BNE vwf_kw_h_copy2
	CPY #$00C0
	BCC vwf_kw_h_copy
	LDA $2D11
	AND #$003F
	TAX
	LDY #$0018
	JSR vwf_kw_blank
vwf_kw_h_blank:
	STA $48EB,x
	STA $492B,x
	STA $496B,x
	INX #2
	DEY
	BNE vwf_kw_h_blank
	JSR vwf_kw_nmi
	JSL $C10E3A
	REP #$30
	LDA #$1202
	STA $004370
	LDA #$7760
	STA $004372
	SEP #$20
	LDA #$7E
	STA $004374
	REP #$20
	LDA #$0001
	STA $7774
vwf_kw_h_loop:
	JSR vwf_kw_nmi
	JSR vwf_kw_h_table
	SEP #$20
	LDA $7770
	STA $00420C
	REP #$20
	LDA $7774
	INC
	STA $7774
	CMP #$0011
	BCC vwf_kw_h_loop
	LDY $2D11
	TYA
	CLC
	ADC #$0140
	TAX
	PHX
	PHY
	JSR vwf_kw_f555
	PLY
	PLX
	JSR vwf_kw_f555
	LDA $2D11
	CLC
	ADC #$0100
	TAX
	LDY #$0018
	JSR vwf_kw_blank
vwf_kw_h_bot:
	STA $41EB,x
	STA $422B,x
	INX #2
	DEY
	BNE vwf_kw_h_bot
	JSR vwf_kw_nmi
	JSL $C10E3A
	REP #$30
	SEP #$20
	LDA $7770
	AND #$7F
	STA $00420C
	LDA #$FF
	STA $004370
	REP #$20
	LDX #$0000
vwf_kw_h_rest:
	LDA $7000,x
	STA $48EB,x
	INX #2
	CPX #$00C0
	BCC vwf_kw_h_rest
	PLB
	PLY
	PLX
	JML $C0F554

vwf_kw_h_table:
	LDX #$0000
	LDY #$03FF
	LDA $7772
vwf_kw_h_t1:
	CMP #$0080
	BCC vwf_kw_h_t2
	PHA
	LDA #$007F
	JSR vwf_kw_h_ent
	PLA
	SEC
	SBC #$007F
	BRA vwf_kw_h_t1

vwf_kw_h_t2:
	LDY #$03FF
	JSR vwf_kw_h_ent
	LDA #$0030
	SEC
	SBC $7774
	BEQ vwf_kw_h_t3
	PHA
	LDA #$03FF
	CLC
	ADC $7774
	AND #$03FF
	TAY
	PLA
	JSR vwf_kw_h_ent
vwf_kw_h_t3:
	LDA $7772
	CLC
	ADC #$0030
	SEC
	SBC $7774
	STA $77A4
	LDA #$00E4
	SEC
	SBC $77A4
	AND #$03FF
	TAY
	LDA $7774
	JSR vwf_kw_h_ent
	LDY #$03FF
	LDA #$0001
	JSR vwf_kw_h_ent
	SEP #$20
	STZ $7760,x
	REP #$20
	RTS

vwf_kw_h_ent:
	SEP #$20
	STA $7760,x
	REP #$20
	TYA
	STA $7761,x
	INX #3
	RTS

vwf_kw_blank:
	LDA {vwf_kwt}
	BEQ vwf_kw_blank_op
	LDA #$2000
	RTS

vwf_kw_blank_op:
	LDA #$2020
	RTS

vwf_kw_curblk:
	JSR vwf_kw_blank
	STA $002118
	RTL

vwf_kw_cur_b:
	LDA $C0FD0B,x
	BRA vwf_kw_cur_fix

vwf_kw_cur_a:
	LDA $C0FD09,x
vwf_kw_cur_fix:
	PHA
	LDA {vwf_kwt}
	BEQ vwf_kw_cur_end
	LDA $01,s
	CMP #$2020
	BEQ vwf_kw_cur_bl
	AND #$7FFF
	CMP #$200C
	BNE vwf_kw_cur_end
	LDA $01,s
	AND #$FF00
	ORA #$0073
	STA $01,s
	BRA vwf_kw_cur_end

vwf_kw_cur_bl:
	LDA #$2000
	STA $01,s
vwf_kw_cur_end:
	PLA
	RTL

vwf_kw_hdma:
	LDA #$3E
	ORA {vwf_kwm}
	STA $00420C
	PHP
	REP #$30
	PHX
	PHY
	LDA $7E77E6
	CMP #$0003
	BEQ vwf_kw_hd_on
	CMP #$0004
	BNE vwf_kw_hd_end
	LDA {vwf_kwm}
	AND #$00FF
	BNE vwf_kw_hd_end
	LDX #$72A0
	JSR vwf_kw_pdma
	JSR vwf_kw_odma
	LDA #$0000
	STA $7E77E6
	BRA vwf_kw_hd_end

vwf_kw_hd_on:
	JSR vwf_kw_pchk
	BCC vwf_kw_hd_fail
	LDX #$7220
	JSR vwf_kw_pdma
	JSR vwf_kw_odma
	LDA #$0001
	STA $7E77E6
	BRA vwf_kw_hd_end

vwf_kw_hd_fail:
	JSR vwf_kaiwa_prescanv
	LDA #$0002
	STA $7E77E6
vwf_kw_hd_end:
	PLY
	PLX
	PLP
	RTL

vwf_kw_pchk:
	SEP #$20
	LDA #$D1
	JSR vwf_kw_pc_rd
	CMP.l $C672A2
	BNE vwf_kw_pc_bad
	SEP #$20
	LDA #$E1
	JSR vwf_kw_pc_rd
	CMP.l $C672C2
	BNE vwf_kw_pc_bad
	SEP #$20
	LDA #$F1
	JSR vwf_kw_pc_rd
	CMP.l $C672E2
	BNE vwf_kw_pc_bad
	SEC
	RTS

vwf_kw_pc_bad:
	REP #$20
	CLC
	RTS

vwf_kw_pc_rd:
	STA $002121
	LDA $00213B
	STA $7E77E4
	LDA $00213B
	AND #$7F
	STA $7E77E5
	REP #$20
	LDA $7E77E4
	RTS

vwf_kaiwa_prescanmap:
	LDX #$0000
vwf_kw_pm_chk:
	LDA $7E36EF,x
	BIT #$0008
	BEQ vwf_kw_pm_cn
	LDA $7E36ED,x
	AND #$00FF
	CMP #$00E0
	BCC vwf_kw_pm_bad
vwf_kw_pm_cn:
	INX #4
	CPX #$0200
	BCC vwf_kw_pm_chk
	LDX #$0000
	SEP #$20
vwf_kw_pm_set:
	LDA $7E36EF,x
	ORA #$08
	STA $7E36EF,x
	INX #4
	CPX #$0200
	BCC vwf_kw_pm_set
	REP #$20
	SEC
	RTS

vwf_kw_pm_bad:
	CLC
	RTS

vwf_kaiwa_prescanv:
	LDX #$0000
	SEP #$20
vwf_kw_pv_loop:
	LDA $7E36EF,x
	AND #$F7
	STA $7E36EF,x
	INX #4
	CPX #$0200
	BCC vwf_kw_pv_loop
	REP #$20
	RTS

vwf_kw_pdma:
	SEP #$20
	LDA #$D0
	STA $002121
	REP #$20
	LDA #$2200
	STA $004300
	TXA
	STA $004302
	SEP #$20
	LDA #$C6
	STA $004304
	REP #$20
	LDA #$0060
	STA $004305
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	RTS

vwf_kw_odma:
	LDA #$0000
	STA $002102
	LDA #$0400
	STA $004300
	LDA #$36EC
	STA $004302
	SEP #$20
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$0220
	STA $004305
	SEP #$20
	LDA #$01
	STA $00420B
	LDA #$80
	STA $002103
	LDA $7E36EB
	STA $002102
	REP #$20
	RTS

vwf_kw_fill:
	LDA $2D11
	TAX
	LDA #$0006
	STA $77A4
vwf_kw_fill_row:
	PHX
	LDY #$0018
	LDA #$2000
vwf_kw_fill_col:
	STA $41EB,x
	INX #2
	DEY
	BNE vwf_kw_fill_col
	PLA
	CLC
	ADC #$0040
	TAX
	DEC $77A4
	BNE vwf_kw_fill_row
	RTS

vwf_kw_frame:
	REP #$30
	LDA {vwf_kwid}
	CMP #$0081
	BEQ vwf_kw_fr_plain
	CMP #$0082
	BEQ vwf_kw_fr_plain
	CMP #$013C
	BEQ vwf_kw_fr_plain
	CMP #$0139
	BEQ vwf_kw_fr_plain
	CMP #$013A
	BEQ vwf_kw_fr_plain
	CMP #$01A5
	BEQ vwf_kw_fr_plain
	CMP #$0110
	BEQ vwf_kw_fr_plain
	JSR vwf_kw_remap
	LDA {vwf_kwon}
	BEQ vwf_kw_fr_plain
	LDA {vwf_kwm}
	BNE vwf_kw_fr_go
	LDA $7E204F
	AND #$00FF
	CMP #$0001
	BEQ vwf_kw_fr_go
vwf_kw_fr_plain:
	JSR vwf_kw_nmi
	JSL $C10E3A
	JML $C0EF73

vwf_kw_fr_go:
	PHB
	PEA $7E7E
	PLB #2
	LDA #$0001
	STA {vwf_kwt}
	JSR vwf_kw_fill
	LDX #$0000
	LDA $2D11
	AND #$FFC0
	LSR #3
	SEC
	SBC #$0007
vwf_kw_fr_t1:
	CMP #$0080
	BCC vwf_kw_fr_t2
	PHA
	JSR vwf_kw_fr_out
	LDA #$007F
	JSR vwf_kw_fr_ent
	PLA
	SEC
	SBC #$007F
	BRA vwf_kw_fr_t1

vwf_kw_fr_t2:
	PHA
	JSR vwf_kw_fr_out
	PLA
	JSR vwf_kw_fr_ent
	STX $775E
	JSR vwf_kw_fr_in
	LDY #$F310
	LDA #$0040
	JSR vwf_kw_fr_ent
	JSR vwf_kw_fr_out
	LDA #$0001
	JSR vwf_kw_fr_ent
	SEP #$20
	STZ $7740,x
	REP #$20
	LDA #$3004
	STA $004360
	LDA #$7740
	STA $004362
	SEP #$20
	LDA #$7E
	STA $004364
	REP #$20
	LDA $2D11
	AND #$003F
	ASL #2
	SEC
	SBC #$0008
	SEP #$20
	STA $002126
	CLC
	ADC #$CF
	STA $002127
	LDA #$20
	STA $002125
	REP #$30
	LDA $7E77E6
	CMP #$0003
	BCS vwf_kw_fr_nop
	CMP #$0001
	BEQ vwf_kw_fr_nop
	LDA #$0002
	STA $7E77E6
	JSR vwf_kaiwa_prescanmap
	BCC vwf_kw_fr_nop
	LDA #$0003
	STA $7E77E6
vwf_kw_fr_nop:
	SEP #$20
	LDA #$40
	STA {vwf_kwm}
	REP #$30
	JSR vwf_kw_nmi
	JSL $C10E3A
	REP #$30
	PLB
	JML $C0EF73

vwf_kw_fr_ent:
	SEP #$20
	STA $7740,x
	REP #$20
	TYA
	STA $7741,x
	LDA $77A4
	STA $7743,x
	INX #5
	RTS

vwf_kw_fr_out:
	LDA $775B
	AND #$001F
	ORA #$00E0
	STA $77A4
	LDA $7759
	AND #$EFFF
	TAY
	RTS

vwf_kw_fr_in:
	LDA {vwf_kwc}
	TAX
	LDA.l vwf_kw_ctab,x
	AND #$00FF
	STA $77A4
	LDX $775E
	RTS

vwf_kw_end:
	REP #$30
	PHK
	PEA vwf_kw_end_ret-1
	PEA $EC62
	JML $C0EF74

vwf_kw_end_ret:
	REP #$30
	LDA {vwf_kwt}
	BEQ vwf_kw_end_rtl
	PHB
	PEA $7E7E
	PLB
	PLB
	JSR vwf_kw_fill
	JSR vwf_kw_nmi
	JSL $C10E3A
	SEP #$20
	REP #$30
	LDA $7E77E6
	CMP #$0001
	BEQ vwf_kw_end_rv
	CMP #$0003
	BNE vwf_kw_end_np
vwf_kw_end_rv:
	JSR vwf_kaiwa_prescanv
	LDA #$0004
	STA $7E77E6
vwf_kw_end_np:
	SEP #$20
	LDA #$00
	STA {vwf_kwm}
	LDA #$3E
	STA $00420C
	JSR vwf_mrest
	LDA #$FF
	STA $002126
	LDA #$00
	STA $002127
	LDA #$FF
	STA $004360
	REP #$30
	LDA #$0000
	STA {vwf_kwt}
	PLB
vwf_kw_end_rtl:
	RTL

vwf_frame_up:
	STA $00420B
	PHP
	SEP #$20
	LDA.l $7E0000+{gengo}
	BEQ vwf_frame_up_end
	REP #$30
	LDX.w #frame
	LDY #$0080
	LDA #$1801
	JSR vwf_frame_dma
	SEP #$20
	LDA #$80
	STA $002115
vwf_frame_up_end:
	PLP
	RTL

vwf_frame_dma:
	STA $004300
	TYA
	SEP #$20
	STA $002115
	LDA.b #frame>>16
	STA $004304
	REP #$20
	TXA
	STA $004302
	LDA #$6380
	STA $002116
	LDA #$0040
	STA $004305
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	RTS

vwf_kaiwa_prescan:
	LDA {vwf_kwp}
	PHA
	LDA {vwf_kwb}
	PHA
	LDA #$0000
	STA {vwf_kwc}
-
	JSR vwf_kw_rd
	CMP #$00FB
	BEQ vwf_kaiwa_prescan_fb
	CMP #$00FC
	BEQ vwf_kaiwa_prescan_skip
	CMP #$0003
	BNE vwf_kaiwa_prescan_end
vwf_kaiwa_prescan_skip:
	JSR vwf_kw_adv
	JSR vwf_kw_adv
	BRA -
vwf_kaiwa_prescan_fb:
	JSR vwf_kw_adv
	JSR vwf_kw_rd
	CMP #$0003
	BCS vwf_kaiwa_prescan_fb2
	STA {vwf_kwc}
vwf_kaiwa_prescan_fb2:
	JSR vwf_kw_adv
	BRA -

vwf_kaiwa_prescan_end:
	PLA
	STA {vwf_kwb}
	PLA
	STA {vwf_kwp}
	RTS

vwf_kw_setc:
	CMP #$0003
	BCS vwf_kw_setc_end
	STA {vwf_kwc}
	LDA {vwf_kwm}
	AND #$00FF
	BEQ vwf_kw_setc_end
	PHX
	PHP
	REP #$30
	LDA {vwf_kwc}
	TAX
	LDA.l vwf_kw_ctab,x
	PHA
	LDA $7E775E
	TAX
	PLA
	SEP #$20
	STA $7E7743,x
	PLP
	PLX
vwf_kw_setc_end:
	RTS

vwf_kw_ctab:
	db $6C, $CC, $AC

vwf_kw_remap:
	SEP #$20
	LDA.l $7E0000+{gengo}
	REP #$20
	BEQ vwf_kw_remap_end
	PHB
	PEA $7E7E
	PLB
	PLB
	LDA $2D11
	SEC
	SBC #$0042
	TAX
	LDA #$0008
	STA $77A4
vwf_kw_remap_row:
	PHX
	LDY #$001A
vwf_kw_remap_col:
	LDA $41EB,x
	AND #$03FF
	BEQ vwf_kw_remap_next
	CMP #$0005
	BCS vwf_kw_remap_next
	LDA $41EB,x
	CLC
	ADC #$006F
	STA $41EB,x
vwf_kw_remap_next:
	INX #2
	DEY
	BNE vwf_kw_remap_col
	PLA
	CLC
	ADC #$0040
	TAX
	DEC $77A4
	BNE vwf_kw_remap_row
	PLB
vwf_kw_remap_end:
	RTS

vwf_kw_pgclr:
	REP #$30
	LDA {vwf_kwon}
	BEQ vwf_kw_pg_done
	LDA $7E204F
	AND #$00FF
	CMP #$0001
	BNE vwf_kw_pg_done
	LDA {vwf_kwt}
	BNE vwf_kw_pg_go
	LDA $7E2D1F
	AND #$00FF
	BEQ vwf_kw_pg_done
vwf_kw_pg_go:
	PHX
	PHY
	LDA #$0003
vwf_kw_pg_loop:
	PHA
	PHK
	PEA vwf_kw_pg_ret-1
	PEA $EC62
	JML vwf_kw_scroll

vwf_kw_pg_ret:
	REP #$30
	PLA
	DEC
	BNE vwf_kw_pg_loop
	PLY
	PLX
vwf_kw_pg_done:
	LDA #$0020
	TRB $2CFC
	JML $C0F500

vwf_m2125:
	STA $002125
	STA $7E7758
	RTL

vwf_m2130:
	STA $002130
	STA $7E7759
	RTL

vwf_m2131:
	STA $002131
	STA $7E775A
	RTL

vwf_m2132:
	STA $002132
	PHA
	BIT #$20
	BEQ vwf_m2132_g
	AND #$1F
	STA $7E775B
	LDA $01,s
vwf_m2132_g:
	BIT #$40
	BEQ vwf_m2132_b
	AND #$1F
	STA $7E775C
	LDA $01,s
vwf_m2132_b:
	BIT #$80
	BEQ vwf_m2132_end
	AND #$1F
	STA $7E775D
vwf_m2132_end:
	PLA
	RTL

vwf_mfield:
	LDA #$02
	JSL vwf_m2130
	LDA #$72
	JSL vwf_m2131
	LDA #$E0
	JSL vwf_m2132
	RTL

vwf_mmenu:
	LDA #$00
	JSL vwf_m2130
	JSL vwf_m2131
	RTL

vwf_mrest:
	LDA $7E7758
	STA $002125
	LDA $7E7759
	STA $002130
	LDA $7E775A
	STA $002131
	LDA $7E775B
	ORA #$20
	STA $002132
	LDA $7E775C
	ORA #$40
	STA $002132
	LDA $7E775D
	ORA #$80
	STA $002132
	RTS

vwf_kw_sline:
	REP #$30
	LDA {vwf_kwon}
	BNE vwf_kw_sl_go
	TSC
	STA $7E2D01
	JML $C0F3DE

vwf_kw_sl_go:
	PHB
	PEA $7E7E
	PLB
	PLB
	LDA #$00FF
	TRB $2D1D
	LDA $2D1B
	AND #$0007
	XBA
	ASL #2
	CLC
	ADC #$4000
	STA $2D0D
	JSR vwf_kw_fetch
	LDA #$001B
	JSR vwf_kw_render
	LDA {vwf_pen}
	CLC
	ADC #$000F
	LSR #4
	CMP #$000E
	BCC vwf_kw_sl_n
	LDA #$000E
vwf_kw_sl_n:
	STA $77E8
	LDA #$0000
	STA $77EA
vwf_kw_sl_loop:
	LDA $77EA
	CMP $77E8
	BCS vwf_kw_sl_done
	JSR vwf_kw_cell
	JSR vwf_kw_oam
	JSR vwf_kw_nmi
	PHK
	PEA vwf_kw_sl_r1-1
	PEA $EC62
	JML $C0F765

vwf_kw_sl_r1:
	REP #$30
	PHK
	PEA vwf_kw_sl_r2-1
	PEA $EC62
	JML $C0FD9B

vwf_kw_sl_r2:
	REP #$30
	PHK
	PEA vwf_kw_sl_r3-1
	PEA $EC62
	JML $C0FB3A

vwf_kw_sl_r3:
	REP #$30
	LDA $2D0D
	CLC
	ADC #$0020
	BIT #$00FF
	BNE vwf_kw_sl_vr
	CLC
	ADC #$0100
vwf_kw_sl_vr:
	STA $2D0D
	INC $77EA
	BRA vwf_kw_sl_loop

vwf_kw_sl_done:
	SEP #$20
	LDA $77E8
	STA $2D1D
	REP #$20
	PLB
	JML $C0F433

vwf_kw_oam:
	LDA $2D1B
	AND #$00FF
	XBA
	LSR #2
	STA $77A4
	LDA $77EA
	ASL #2
	CLC
	ADC $77A4
	TAX
	SEP #$20
	LDA $77EA
	ASL #4
	CLC
	ADC $2CF5
	STA $36EC,x
	LDA $2D1C
	ASL #4
	CLC
	ADC $2CF6
	STA $36ED,x
	REP #$20
	LDA $2D1B
	AND #$0007
	ASL #4
	CLC
	ADC $77EA
	PHA
	AND #$00F8
	ASL #2
	STA $77A4
	PLA
	AND #$0007
	ASL
	ORA $77A4
	ORA #$3400
	ORA $2CF7
	STA $36EE,x
	RTS

vwf_kw_cell:
	LDA $77EA
	XBA
	LSR #2
	TAX
	LDY #$0000
	JSR vwf_kw_tile
	LDA $77EA
	XBA
	LSR #2
	CLC
	ADC #$0020
	TAX
	LDY #$0020
	JSR vwf_kw_tile
	LDA $77EA
	XBA
	LSR #2
	CLC
	ADC #$0010
	TAX
	LDY #$0040
	JSR vwf_kw_tile
	LDA $77EA
	XBA
	LSR #2
	CLC
	ADC #$0030
	TAX
	LDY #$0060
vwf_kw_tile:
	SEP #$20
	LDA #$08
	STA $77A4
vwf_kw_tile_row:
	LDA $7000,x
	STA $2D60,y
	EOR #$FF
	AND $7001,x
	STA $2D70,y
	LDA #$00
	STA $2D61,y
	STA $2D71,y
	INX #2
	INY #2
	DEC $77A4
	BNE vwf_kw_tile_row
	REP #$20
	RTS

vwf_kw_s_next:
	CMP #$6800
	BNE vwf_kw_s_next_sub
	LDA #$6E00
vwf_kw_s_next_sub:
	SEC
	SBC #$0180
	RTS

vwf_kw_s_all:
	LDA $77F8
	LDX #$2D20
	JSR vwf_kw_s_dma
	LDA $77FA
	LDX #$2EA0
	JSR vwf_kw_s_dma
	LDA $77FC
	LDX #$3020
	JSR vwf_kw_s_dma
	RTS

vwf_kw_s_read:
	SEP #$20
	LDA #$00
	STA $002115
	REP #$20
	LDA $2D0D
	STA $002116
	SEP #$20
	LDA #$A5
	STA $002118
	LDA #$5A
	STA $002118
	LDA #$C3
	STA $002118
	REP #$20
	LDY #$3980
	LDA #$0004
	STA $77A4
	LDA $2D0D
	LDX #$7000
	JSR vwf_kw_s_dma0
	LDX #$0000
	SEP #$20
	LDA $7001
	CMP #$5A
	BEQ vwf_kw_s_off
	INX
	LDA $7002
	CMP #$5A
	BEQ vwf_kw_s_off
	INX
vwf_kw_s_off:
	REP #$20
	STX $77A4
	LDA $2D1E
	PHA
	LDA #$0180
	CLC
	ADC $77A4
	STA $77A4
	LDA #$3020
	SEC
	SBC $77A4
	CLC
	ADC #$0180
	TAX
	LDA $77FC
	JSR vwf_kw_s_dma0
	LDA #$2EA0
	SEC
	SBC $77A4
	CLC
	ADC #$0180
	TAX
	LDA $77FA
	JSR vwf_kw_s_dma0
	LDA #$2D20
	SEC
	SBC $77A4
	CLC
	ADC #$0180
	TAX
	LDA $77F8
	JSR vwf_kw_s_dma0
	PLA
	STA $2D1E
	RTS

vwf_kw_s_dma:
	PHA
	LDA #$0180
	STA $77A4
	PLA
vwf_kw_s_dma0:
	PHA
	SEP #$20
	LDA #$80
	STA $002115
	REP #$20
	PLA
	STA $002116
	SEP #$20
	LDA $002139
	LDA #$00
	STA $002115
	REP #$20
	TXA
	STA $004302
	TYA
	STA $004300
	LDA $77A4
	STA $004305
	SEP #$20
	LDA #$7E
	STA $004304
	LDA #$01
	STA $00420B
	REP #$20
	RTS

vwf_kw_nmi:
	PHK
	PEA vwf_kw_nmi_ret-1
	PEA $EC62
	JML $C0FDD1

vwf_kw_nmi_ret:
	REP #$30
	RTS

vwf_kw_f555:
	PHK
	PEA vwf_kw_f555_ret-1
	PEA $EC62
	JML $C0F555

vwf_kw_f555_ret:
	REP #$30
	RTS

vwf_kw_s_shift:
	LDX #$0000
vwf_kw_s_col:
	LDA $2D22,x
	STA $2D20,x
	LDA $2D24,x
	STA $2D22,x
	LDA $2D26,x
	STA $2D24,x
	LDA $2D30,x
	STA $2D26,x
	LDA $2D32,x
	STA $2D30,x
	LDA $2D34,x
	STA $2D32,x
	LDA $2D36,x
	STA $2D34,x
	LDA $2EA0,x
	STA $2D36,x
	LDA $2EA2,x
	STA $2EA0,x
	LDA $2EA4,x
	STA $2EA2,x
	LDA $2EA6,x
	STA $2EA4,x
	LDA $2EB0,x
	STA $2EA6,x
	LDA $2EB2,x
	STA $2EB0,x
	LDA $2EB4,x
	STA $2EB2,x
	LDA $2EB6,x
	STA $2EB4,x
	LDA $3020,x
	STA $2EB6,x
	LDA $3022,x
	STA $3020,x
	LDA $3024,x
	STA $3022,x
	LDA $3026,x
	STA $3024,x
	LDA $3030,x
	STA $3026,x
	LDA $3032,x
	STA $3030,x
	LDA $3034,x
	STA $3032,x
	LDA $3036,x
	STA $3034,x
	STZ $3036,x
	TXA
	BIT #$0008
	BEQ vwf_kw_s_even
	CLC
	ADC #$0010
vwf_kw_s_even:
	CLC
	ADC #$0008
	TAX
	CPX #$0180
	BCS vwf_kw_s_done
	JMP vwf_kw_s_col

vwf_kw_s_done:
	RTS

vwf_kw_init:
	LDA.l $C12A00,x
	STA $7E2D03
	PHX
	TXA
	LSR
	JSR vwf_kw_setid
	NOP
	LDA #$0000
	STA {vwf_kwon}
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_kw_init_end
	TXA
	LSR
	CMP #$01EA
	BCS vwf_kw_init_end
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_lg_14
	NOP
	CLC
	JSR vwf_lg_15
	STA {vwf_kwp}
	JSR vwf_lg_16
	NOP
	AND #$003F
	JSR vwf_lg_17
	STA {vwf_kwb}
	CPX #$05BB
	BEQ vwf_kw_init_last
	JSR vwf_lg_18
	NOP
	CLC
	JSR vwf_lg_15
	STA {vwf_tmp}
	JSR vwf_lg_19
	NOP
	AND #$003F
	JSR vwf_lg_17
	BRA vwf_kw_init_cmp

vwf_kw_init_last:
	JSR vwf_lg_1A
	STA {vwf_tmp}
	JSR vwf_lg_1B
vwf_kw_init_cmp:
	CMP {vwf_kwb}
	BNE vwf_kw_init_on
	LDA {vwf_tmp}
	CMP {vwf_kwp}
	BEQ vwf_kw_init_end
vwf_kw_init_on:
	LDA #$0001
	STA {vwf_kwon}
	STA {vwf_kwf}
	JSR vwf_kaiwa_prescan
vwf_kw_init_end:
	PLX
	RTL

vwf_kw_line:
	REP #$30
	LDA {vwf_kwon}
	BNE vwf_kw_go
	TSC
	STA $7E2D01
	JML $C0F2C2

vwf_kw_go:
	PHB
	PEA $7E7E
	PLB
	PLB
	INC $2D1D
	INC $2D1C
	JSR vwf_kw_fetch
	JSR vwf_kw_draw
	JSR vwf_kw_cells
	PLB
	JML $C0F309

vwf_kw_rd:
	PHB
	PHX
	SEP #$20
	LDA {vwf_kwb}
	PHA
	PLB
	REP #$20
	LDA {vwf_kwp}
	TAX
	LDA $0000,x
	PLX
	PLB
	AND #$00FF
	RTS

vwf_kw_adv:
	LDA {vwf_kwp}
	INC
	STA {vwf_kwp}
	BNE vwf_kw_adv_end
	LDA {vwf_kwb}
	INC
	STA {vwf_kwb}
vwf_kw_adv_end:
	RTS

vwf_kw_put:
	CPY #$007C
	BCS vwf_kw_put_end
	STA $7380,y
	INY
vwf_kw_put_end:
	RTS

vwf_kw_fetch:
	LDY #$0000
vwf_kw_f_loop:
	JSR vwf_kw_rd
	BEQ vwf_kw_f_end
	CMP #$0001
	BEQ vwf_kw_f_page
	CMP #$0004
	BEQ vwf_kw_f_nl
	CMP #$0003
	BEQ vwf_kw_f_spd
	CMP #$0002
	BEQ vwf_kw_f_two
	CMP #$0005
	BEQ vwf_kw_f_two
	CMP #$00FC
	BEQ vwf_kw_f_two
	CMP #$00FB
	BEQ vwf_kw_f_two
	CMP #$00F0
	BEQ vwf_kw_f_two
	JSR vwf_kw_put
	JSR vwf_kw_adv
	BRA vwf_kw_f_loop

vwf_kw_f_two:
	JSR vwf_kw_put
	JSR vwf_kw_adv
	JSR vwf_kw_rd
	JSR vwf_kw_put
	JSR vwf_kw_adv
	BRA vwf_kw_f_loop

vwf_kw_f_spd:
	JSR vwf_kw_adv
	JSR vwf_kw_rd
	JSR vwf_kw_adv
	AND #$000F
	CMP #$000E
	BCS vwf_kw_f_loop
	PHA
	SEP #$20
	LDA $2D1E
	AND #$C0
	ORA $01,s
	STA $2D1E
	REP #$20
	PLA
	BRA vwf_kw_f_loop

vwf_kw_f_nl:
	JSR vwf_kw_adv
	JSR vwf_kw_rd
	BEQ vwf_kw_f_end
	CMP #$0001
	BNE vwf_kw_f_term
vwf_kw_f_page:
	JSR vwf_kw_adv
	LDA #$0020
	TSB $2CFC
	BRA vwf_kw_f_term

vwf_kw_f_end:
	LDA #$0080
	TSB $2CFC
vwf_kw_f_term:
	LDA #$0000
	STA $7380,y
	RTS

vwf_kw_draw:
	LDA #$0018
	JSR vwf_kw_render
	LDA {vwf_kwt}
	BNE vwf_kw_d_conv
	LDA $2D1F
	AND #$00FF
	BEQ vwf_kw_d_conv
	JSR vwf_opaque
	BRA vwf_kw_d_conv

vwf_kw_d_conv:
	LDX #$0000
	LDY #$0000
vwf_kw_d_col:
	PHY
	LDA #$0008
	STA {vwf_tmp}
vwf_kw_d_word:
	LDA $7000,x
	STA $2D20,y
	LDA $7010,x
	STA $2D40,y
	INX #2
	INY #2
	DEC $77A4
	BNE vwf_kw_d_word
	TXA
	CLC
	ADC #$0010
	TAX
	PLA
	BIT #$0010
	BEQ vwf_kw_d_even
	CLC
	ADC #$0020
vwf_kw_d_even:
	CLC
	ADC #$0010
	TAY
	CPX #$0300
	BCC vwf_kw_d_col
	RTS

vwf_kw_cells:
	LDA $2D0F
	AND #$003F
	LSR
	STA $77A4
	LDA #$001E
	SEC
	SBC $77A4
	LSR
	CMP #$000C
	BCC vwf_kw_c_max
	LDA #$000C
vwf_kw_c_max:
	PHA
	TAX
	BEQ vwf_kw_c_skip
	LDY $2D0F
	LDA $2CF7
vwf_kw_c_map:
	STA $41EB,y
	INC
	STA $41ED,y
	INC
	STA $422B,y
	INC
	STA $422D,y
	INC
	INY #4
	DEX
	BNE vwf_kw_c_map
vwf_kw_c_skip:
	LDA {vwf_pen}
	CLC
	ADC #$000F
	LSR #4
	CMP $01,s
	BCC vwf_kw_c_n
	LDA $01,s
vwf_kw_c_n:
	TAX
	BEQ vwf_kw_c_done
vwf_kw_c_show:
	PHX
	PHK
	PEA vwf_kw_c_ret-1
	PEA $EC62
	JML $C0F1EB

vwf_kw_c_ret:
	REP #$30
	LDA $2D0F
	CLC
	ADC #$0004
	STA $2D0F
	INC $2D15
	INC $2D15
	PLX
	DEX
	BNE vwf_kw_c_show
vwf_kw_c_done:
	PLA
	LDA $2CF7
	CLC
	ADC #$0030
	STA $2CF7
	RTS

vwf_kw_render:
	STA {vwf_ncols}
	LDA {vwf_kwf}
	STA $7E77DE
	LDA #$0000
	STA $7E77CE
	JSR vwf_kw_rpass
	LDA $7E77CE
	BEQ vwf_kw_r_end
	LDA {vwf_pen}
	SEC
	SBC $7E77CC
	STA {vwf_tmp}
	LDA {vwf_ncols}
	ASL #3
	SEC
	SBC {vwf_tmp}
	BCC vwf_kw_r_end
	LSR
	STA $7E77DC
	LDA #$0002
	STA $7E77CE
	LDA $7E77DE
	STA {vwf_kwf}
	JSR vwf_kw_rpass
vwf_kw_r_end:
	LDA #$0000
	STA $7E77CE
	RTS

vwf_kw_mid:
	LDA $7E77CE
	CMP #$0002
	BEQ vwf_kw_mid_set
	CMP #$0000
	BNE vwf_kw_mid_end
	LDA {vwf_pen}
	STA $7E77CC
	LDA #$0001
	STA $7E77CE
	RTS

vwf_kw_mid_set:
	LDA $7E77DC
	CMP {vwf_pen}
	BCC vwf_kw_mid_end
	STA {vwf_pen}
	LDA #$0003
	STA $7E77CE
vwf_kw_mid_end:
	RTS

vwf_kw_rpass:
	LDA {vwf_ncols}
	STA {vwf_used}
	LDA #$7380
	STA {vwf_tptr}
	LDA #$007E
	STA {vwf_tbank}
	LDA {vwf_kwf}
	STA {vwf_font}
	LDA #$0001
	STA {vwf_dirty}
	LDA #$2000
	STA {vwf_pal}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA #$0000
	STA {vwf_xoff}
	STA {vwf_dflag}
	STA {vwf_end}
	STA {vwf_coff}
	STA {vwf_drawn}
	JSR vwf_line
	LDA {vwf_font}
	STA {vwf_kwf}
	LDA #$0000
	STA {vwf_font}
	RTS

vwf_mmnum:
	PHA
	JSR vwf_vn_menu
	BCC vwf_mmnum_jp
	PLA
	STA {vwf_mmn}
	RTL

vwf_mmnum_jp:
	PLA
	JSL $C0EC75
	RTL

vwf_mmname:
	STA {vwf_nameid}
	JSR vwf_vn_menu
	BCC vwf_mmname_jp
	LDA $04,s
	SEC
	SBC #$01E2
	CMP #$0200
	BCS vwf_mmname_jp
	LSR #7
	STA {vwf_tmp}
	ASL #3
	CLC
	ADC {vwf_tmp}
	CLC
	ADC {vwf_tmp}
	CLC
	ADC {vwf_tmp}
	ASL
	CLC
	ADC #$0124
	PHA
	JSR vwf_mmstr
	LDA #$000B
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	PLX
	LDA $04,s
	SEC
	SBC #$0046
	JSR vwf_name_vwf
	RTL

vwf_mmname_jp:
	LDA {vwf_nameid}
	JSL $C0EBD7
	LDA $04,s
	JSL $C0EC09
	RTL

vwf_mmstr:
	LDA {vwf_mmn}
	AND #$00FF
	LDX #$0050
vwf_mmstr_div:
	CMP #$000A
	BCC vwf_mmstr_dd
	SBC #$000A
	INX
	BRA vwf_mmstr_div

vwf_mmstr_dd:
	CLC
	ADC #$0050
	XBA
	STA {vwf_tmp}
	TXA
	ORA {vwf_tmp}
	STA {vwf_nstr}
	LDA #$0302
	STA {vwf_nstr}+2
	LDA #$00FF
	STA {vwf_nstr}+4
	LDA.w #{vwf_nstr}
	STA {vwf_tptr}
	LDA #$007E
	STA {vwf_tbank}
	RTS

vwf_mbname:
	STA {vwf_nameid}
	JSR vwf_vn_menu
	BCC vwf_mbname_jp
	JSR vwf_name_tp
	LDA $04,s
	LSR #6
	SEC
	SBC #$0003
	LSR
	AND #$0007
	ASL #4
	CLC
	ADC #$0124
	TAX
	LDA #$0008
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDA $04,s
	SEC
	SBC #$0040
	JSR vwf_name_vwf
	RTL

vwf_mbname_jp:
	LDA {vwf_nameid}
	JSL $C0EBD7
	LDA $04,s
	JSL $C0EC09
	RTL

vwf_pg_name:
	LDA {vwf_pg_on}
	BNE vwf_pg_name_vn
	LDA $5F7B,y
	JSL $C0EBD7
	LDA $04,s
	CLC
	ADC #$0184
	JSL $C0EC09
	RTL

vwf_pg_name_vn:
	LDA $5F7B,y
	STA {vwf_nameid}
	PHY
	PHB
	LDA $07,s
	CLC
	ADC #$0140
	LSR
	PHA
	AND #$001F
	STA {vwf_col0}
	PLA
	LSR #5
	STA {vwf_row}
	LDA #$0008
	STA {vwf_ncols}
	LDA.w #vwf_name_str
	STA {vwf_tptr}
	LDA.w #vwf_name_str>>16
	STA {vwf_tbank}
	LDA #$0000
	STA {vwf_tmp}
	JSR vwf_name_pal
	JSR vwf_pg_text
	PLB
	PLY
	RTL

vwf_st_n21:
	LDA #$03C2
	BRA vwf_st_name

vwf_st_n22:
	LDA #$03EE
vwf_st_name:
	PHA
	PHX
	JSR vwf_map_active
	PLX
	BCS vwf_st_name_vn
	LDA $5F7B,y
	JSL $C0EBD7
	PLA
	JSL $C0EC09
	RTL

vwf_st_name_vn:
	LDA $5F7B,y
	STA {vwf_nameid}
	PLA
	PHY
	PHB
	LDX #$0402
	LDY #$0302
	CMP #$03C2
	BEQ vwf_st_name_lbl
	LDX #$042E
	LDY #$0326
vwf_st_name_lbl:
	PHY
	JSR vwf_st_lbl
	LDA #$0100
	STA {vwf_pgt}
	LDA.w #vwf_name_str
	STA {vwf_tptr}
	LDA.w #vwf_name_str>>16
	STA {vwf_tbank}
	JSR vwf_name_pal
	STA {vwf_mw}
	PLA
	JSR vwf_st_text
	PLB
	PLY
	RTL

vwf_st_text:
	LSR
	PHA
	AND #$001F
	STA {vwf_col0}
	PLA
	LSR #5
	STA {vwf_row}
	LDA #$000C
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_tmp}
	LDA {vwf_mw}
	JSR vwf_pg_text
	RTS

vwf_st_lbl:
	PEA $7E7E
	PLB
	PLB
	TXY
	LDX #$0000
vwf_st_lbl_row:
	LDA.l vwf_st_lbls,x
	ORA #$2400
	STA $41ED,y
	LDA.l vwf_st_lbls+2,x
	BEQ vwf_st_lbl_c4
	ORA #$2400
	STA $41F5,y
vwf_st_lbl_c4:
	LDA $41EF,y
	AND #$03FF
	CMP #$0020
	BNE vwf_st_lbl_c12
	LDA #$2409
	STA $41EF,y
vwf_st_lbl_c12:
	LDA.l vwf_st_lbls+2,x
	BEQ vwf_st_lbl_nx
	LDA $41F7,y
	AND #$03FF
	CMP #$0020
	BNE vwf_st_lbl_nx
	LDA #$2409
	STA $41F7,y
vwf_st_lbl_nx:
	TYA
	CLC
	ADC #$0040
	TAY
	INX #4
	CPX #$0014
	BCC vwf_st_lbl_row
	RTS

vwf_st_lbls:
	dw $0015, $0018, $0019, $001A, $001B, $001C, $001D, $001E, $001F, $0000

vwf_st_i21:
	LDA #$0542
	BRA vwf_st_item

vwf_st_i22:
	LDA #$0566
vwf_st_item:
	PHA
	PHX
	JSR vwf_map_active
	PLX
	BCS vwf_st_item_vn
	LDA $5F83,y
	AND #$00FF
	JSL $C0EBE1
	PLA
	CMP #$0566
	BNE vwf_st_item_jp
	LDA #$056E
vwf_st_item_jp:
	JSL $C0EC09
	RTL

vwf_st_item_vn:
	LDA $5F83,y
	AND #$00FF
	BNE vwf_st_item_go
	PLA
	RTL

vwf_st_item_go:
	PHY
	PHB
	JSR vwf_item_tp
	BCS vwf_st_item_end
	LDA #$2C00
	STA {vwf_mw}
	LDA $04,s
	JSR vwf_st_text
vwf_st_item_end:
	PLB
	PLY
	PLA
	RTL

vwf_st_s21:
	LDA #$03C2
	BRA vwf_st_stat

vwf_st_s22:
	LDA #$03E6
vwf_st_stat:
	PHA
	PHX
	JSR vwf_map_active
	PLX
	PLA
	BCS vwf_st_stat_vn
	CMP #$03C2
	BEQ vwf_st_stat_j21
	LDA #$05AE
	JSL $C0EC09
	RTL

vwf_st_stat_j21:
	LDA #$0582
	JSL $C0EC09
	RTL

vwf_st_stat_vn:
	SEC
	SBC #$0040
	PHA
	LDA {vwf_stid}
	AND #$00FF
	BEQ vwf_st_stat_none
	DEC
	JSR vwf_stat_tp
	BCC vwf_st_stat_go
	PLA
	JSL $C0EC09
	RTL

vwf_st_stat_go:
	PHY
	PHB
	LDA #$2C00
	STA {vwf_mw}
	LDA $04,s
	JSR vwf_st_text
	PLB
	PLY
vwf_st_stat_none:
	PLA
	RTL

vwf_st_sid:
	STA {vwf_stid}
	JML $C0EBDC

vwf_stat_tp:
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	JSR vwf_lg_1C
	NOP
	BCS vwf_stat_tp_end
	TAX
	JSR vwf_lg_1D
	NOP
	BEQ vwf_stat_tp_no
	CLC
	JSR vwf_lg_1E
	STA {vwf_tptr}
	JSR vwf_lg_1F
	ADC #$0000
	STA {vwf_tbank}
	CLC
	RTS

vwf_stat_tp_no:
	SEC
vwf_stat_tp_end:
	RTS

vwf_classstr:
	LDA {vwf_dflag}
	BEQ vwf_classstr_go
	RTS

vwf_classstr_go:
	LDA {vwf_classid}
	AND #$00FF
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	JSR vwf_lg_0E
	NOP
	BCS vwf_classstr_end
	TAX
	JSR vwf_lg_0F
	NOP
	BEQ vwf_classstr_end
	TAX
	LDA {vwf_tptr}
	STA {vwf_dret}
	LDA {vwf_tbank}
	STA {vwf_dbank}
	LDA #$0001
	STA {vwf_dflag}
	TXA
	CLC
	JSR vwf_lg_10
	STA {vwf_tptr}
	JSR vwf_lg_11
	ADC #$0000
	STA {vwf_tbank}
vwf_classstr_end:
	RTS

vwf_cc_win:
	PHP
	REP #$20
	LDA.l $C019D4,x
	AND #$00FF
	STA {vwf_classid}
	PLP
	LDA #$26
	JSL $C10746
	RTL

vwf_cc_cls:
	PHX
	JSR vwf_map_active
	PLX
	BCS vwf_cc_cls_vn
	LDA.l $C019D4,x
	AND #$00FF
	JSL $C0EBD2
	LDA #$0186
	JSL $C0EC09
	RTL

vwf_cc_cls_vn:
	PHX
	PHY
	PHB
	PEA $7E7E
	PLB
	PLB
	LDX #$0000
vwf_cc_hdr:
	LDA.l vwf_cc_hdrt,x
	BEQ vwf_cc_hdr_end
	PHX
	TAY
	LDA.l vwf_cc_hdrt+2,x
	ORA #$2400
	STA $41EB,y
	PLX
	INX #4
	BRA vwf_cc_hdr

vwf_cc_hdr_end:
	PLB
	PLY
	PLX
	RTL

vwf_cc_hdrt:
	dw $00D6, $0015, $00DA, $0016, $00DC, $0017, $00DE, $0010, $00E0, $0018
	dw $00E4, $0019, $00E6, $0010, $00E8, $001A, $00EC, $001B, $00EE, $0010
	dw $00F0, $001C, $00F4, $001D, $00F6, $0010, $00F8, $001E, $00FC, $001F
	dw $011E, $002F, $0126, $002F, $012E, $002F, $0136, $002F, $0000

vwf_cc_name:
	PHX
	JSR vwf_map_active
	PLX
	BCS vwf_cc_name_vn
	LDA $5F7B,y
	JSL $C0EBD7
	LDA #$0104
	JSL $C0EC09
	RTL

vwf_cc_name_vn:
	LDA $5F7B,y
	STA {vwf_nameid}
	PHX
	PHY
	PHB
	LDA #$0100
	STA {vwf_pgt}
	LDA.w #vwf_name_str
	STA {vwf_tptr}
	LDA.w #vwf_name_str>>16
	STA {vwf_tbank}
	JSR vwf_name_pal
	STA {vwf_mw}
	LDA #$0104
	JSR vwf_st_text
	PLB
	PLY
	PLX
	RTL

vwf_name_w2e:
	LDA #$2E
	BRA vwf_name_win

vwf_name_w43:
	LDA #$43
vwf_name_win:
	PHP
	REP #$20
	PHA
	LDA $5F7B,y
	STA {vwf_nameid}
	PLA
	PLP
	JSL $C10746
	RTL

vwf_name_d2e:
	LDA #$030A
	BRA vwf_name_draw

vwf_name_d43:
	LDA #$030C
vwf_name_draw:
	PHA
	PHX
	JSR vwf_map_active
	PLX
	BCC vwf_name_draw_jp
	PLA
	RTL

vwf_name_draw_jp:
	LDA $5F7B,y
	JSL $C0EBD7
	PLA
	JSL $C0EC09
	RTL

vwf_itemstr:
	LDA {vwf_dflag}
	BNE vwf_itemstr_end
	LDA {vwf_itemid}
	AND #$00FF
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	JSR vwf_lg_20
	NOP
	BCS vwf_itemstr_end
	TAX
	LDA {vwf_tptr}
	STA {vwf_dret}
	LDA {vwf_tbank}
	STA {vwf_dbank}
	JSR vwf_lg_06
	NOP
	CLC
	JSR vwf_lg_21
	STA {vwf_tptr}
	JSR vwf_lg_09
	ADC #$0000
	STA {vwf_tbank}
	LDA #$0001
	STA {vwf_dflag}
vwf_itemstr_end:
	RTS

vwf_found:
	LDA $05,s
	STA {vwf_itemid}
	SEP #$20
	LDA #$28
	RTL

vwf_found_name:
	PHA
	PHX
	REP #$30
	JSR vwf_map_active
	PLX
	BCC vwf_found_jp
	PLA
	RTL

vwf_discard_name:
	PHA
	PHX
	REP #$30
	JSR vwf_map_active
	PLX
	BCC vwf_discard_jp
	PLA
	RTL

vwf_discard_jp:
	PLA
	LDA $00
	JSL $C0EBE1
	LDA #$0310
	JSL $C0EC09
	RTL

vwf_found_jp:
	PLA
	JSL $C0EBE1
	LDA #$02D0
	JSL $C0EC09
	RTL

vwf_autow:
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_a,x
	AND #$00FF
	BEQ vwf_autow_end
	LDA $7E4148
	XBA
	AND #$00FF
	LSR
	BEQ vwf_autow_end
	STA {vwf_lines}
	LDA #$001E
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_coff}
	JSR vwf_count_map
	LDA {vwf_cmax}
	LSR
	INC
	CMP #$001C
	BCC vwf_autow_ok
	LDA #$001C
vwf_autow_ok:
	SEP #$20
	STA $7E4148
	REP #$20
	AND #$00FF
	STA {vwf_tmp}
	LDA {vwf_id}
	TAX
	LDA.l vwf_window_a,x
	AND #$00FF
	CMP #$0002
	BEQ vwf_autow_end
	LDA #$001E
	SEC
	SBC {vwf_tmp}
	LSR
	SEP #$20
	STA $7E4146
	REP #$20
vwf_autow_end:
	RTS

vwf_pg_cur:
	LDA $05,s
	SEC
	SBC $7E4154
	STA {vwf_mt}
	LDA $7E4154
	TAX
	LDA.l $C10F41,x
	AND #$00FF
	CLC
	ADC {vwf_mt}
	XBA
	AND #$FF00
	STA {vwf_mt}
	LDA $03,s
	AND #$00FF
	ORA {vwf_mt}
	STA $03,s
	RTS

vwf_pg_init:
	REP #$30
	AND #$00FF
	STA $00
	STA {vwf_itemid}
	PHA
	LDA #$0000
	STA {vwf_pg}
	STA {vwf_pg_on}
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_pg_init_end
	LDA $7E4142
	CMP #$7800
	BNE vwf_pg_init_end
	JSR vwf_lg_22
	NOP
	AND #$00FF
	BEQ vwf_pg_init_end
	LDA #$0001
	STA {vwf_pg_on}
	JSR vwf_pg_clr
	STA {vwf_next}
	LDA #$0000
	STA {vwf_slot_n}
	STA {vwf_pgnb}
vwf_pg_init_end:
	PLA
	RTL

vwf_pg_title:
	LDA {vwf_pg_on}
	BNE vwf_pg_title_vn
	LDA $00
	JSL $C0EBE1
	LDA #$00CA
	JSL $C0EC09
	RTL

vwf_pg_title_vn:
	LDA #$0100
	STA {vwf_pgt}
	LDA {vwf_pgnb}
	BNE vwf_pg_title_nb
	LDA {vwf_next}
	STA {vwf_pgnb}
vwf_pg_title_nb:
	STA {vwf_next}
	PHX
	LDX #$0000
vwf_pg_title_loop:
	LDA.l vwf_pg_hdr,x
	BEQ vwf_pg_title_end
	PHX
	PHA
	AND #$00FF
	ASL
	TAX
	PLA
	XBA
	AND #$00FF
	ORA #$2400
	STA $7E41EB+$0140,x
	PLX
	INX #2
	BRA vwf_pg_title_loop

vwf_pg_title_end:
	PLX
	RTL

vwf_pg_hdr:
	db $0C, $15, $0E, $16, $0F, $17, $11, $19, $12, $10, $13, $1A, $15, $1B, $16, $10, $17, $1C
	dw $0000

vwf_pg_x:
	PHP
	REP #$20
	LDA {vwf_pg_on}
	BNE vwf_pg_x_vn
	PLP
	LDA $02
	XBA
	LDA #$00
	REP #$20
	LSR #2
	TAX
	RTL

vwf_pg_x_vn:
	PLP
	REP #$20
	LDA $02
	AND #$00FF
	STA {vwf_mt}
	JSR vwf_pg_base
	LDA {vwf_mt}
	SEC
	SBC {vwf_ml}
	BCC vwf_pg_x_skip
	CMP #$0004
	BCS vwf_pg_x_skip
	XBA
	CLC
	ADC #$0004
	TAX
	RTL

vwf_pg_base:
	LDA {vwf_pg}
	ASL #2
	STA {vwf_ml}
	RTS

vwf_pg_x_skip:
	SEP #$20
	PLA
	PLA
	PLA
	LDA #$C0
	PHA
	LDA #$62
	PHA
	LDA #$EC
	PHA
	RTL

vwf_pg_item:
	LDA {vwf_pg_on}
	BNE vwf_pg_item_vn
	LDA $5F83,y
	AND #$00FF
	JSL $C0EBE1
	LDA $04,s
	CLC
	ADC #$01AE
	JSL $C0EC09
	RTL

vwf_pg_item_vn:
	LDA $5F83,y
	AND #$00FF
	BNE vwf_pg_item_go
	RTL

vwf_pg_item_go:
	PHY
	PHB
	JSR vwf_item_tp
	BCS vwf_pg_item_end
	LDA $07,s
	CLC
	ADC #$01C0
	LSR
	PHA
	AND #$001F
	STA {vwf_col0}
	PLA
	LSR #5
	STA {vwf_row}
	LDA #$000E
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_tmp}
	LDA #$2C00
	JSR vwf_pg_text
vwf_pg_item_end:
	PLB
	PLY
	RTL

vwf_item_tp:
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	JSR vwf_lg_20
	NOP
	BCS vwf_item_tp_end
	TAX
	JSR vwf_lg_06
	NOP
	CLC
	JSR vwf_lg_21
	STA {vwf_tptr}
	JSR vwf_lg_09
	ADC #$0000
	STA {vwf_tbank}
	CLC
vwf_item_tp_end:
	RTS

vwf_pg_text:
	STA {vwf_pal}
	LDA {vwf_tmp}
	STA {vwf_font}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA #$0000
	STA {vwf_xoff}
	STA {vwf_coff}
	STA {vwf_drawn}
	STA {vwf_dflag}
	STA {vwf_end}
	STA {vwf_lnum}
	INC
	STA {vwf_dirty}
	LDA {vwf_font}
	BNE vwf_pg_text_main
	LDA #$0001
	STA {vwf_lines}
	JSR vwf_count_map
	CLC
	ADC {vwf_pgt}
	CMP #$0141
	BCS vwf_pg_text_main
	LDA {vwf_pgt}
	STA {vwf_tile}
	JSR vwf_line
	JSR vwf_put
	LDA {vwf_tile}
	STA {vwf_pgt}
	BRA vwf_pg_text_done

vwf_pg_text_main:
	LDA {vwf_next}
	CLC
	ADC #$001E
	CMP #$01F8
	BCC vwf_pg_text_ok
	LDA #$0140
	STA {vwf_next}
vwf_pg_text_ok:
	LDA {vwf_next}
	STA {vwf_tile}
	JSR vwf_line
	JSR vwf_put
	LDA {vwf_tile}
	STA {vwf_next}
vwf_pg_text_done:
	LDA #$0000
	STA {vwf_font}
	RTS

vwf_pg_sel:
	PHP
	REP #$30
	LDA {vwf_pg_on}
	BNE vwf_pg_sel_vn
	PLP
	LDA $02
	JSL $C1086A
	JSL $C0FEC1
	JSL $C108BB
	RTL

vwf_pg_sel_vn:
	PLP
	REP #$30
	JSR vwf_pg_base
	LDA $02
	AND #$00FF
	SEC
	SBC {vwf_ml}
	CMP #$0005
	BCC vwf_pg_sel_n
	LDA #$0004
vwf_pg_sel_n:
	SEP #$20
	JSL $C1086A
	REP #$20
	LDA $02
	AND #$00FF
	CMP #$0005
	BCC vwf_pg_sel_one
	LDA #$0380
	STA $7E4150
vwf_pg_sel_one:
	SEP #$20
	JSL $C0FEC1
	JSL $C108BB
	REP #$30
	PHP
	PHA
	LDA #$0080
	STA $7E4150
	PLA
	PLP
	BCC vwf_pg_sel_hit
	SEP #$20
	RTL

vwf_pg_sel_hit:
	PHA
	LDA $004218
	AND #$0300
	BNE vwf_pg_sel_flip
	PLA
	AND #$00FF
	STA {vwf_mt}
	JSR vwf_pg_base
	LDA {vwf_mt}
	CLC
	ADC {vwf_ml}
	SEP #$20
	CLC
	RTL

vwf_pg_sel_flip:
	STA {vwf_mt}
	PLA
	JSR vwf_pg_count
	LDA {vwf_mt}
	AND #$0100
	BEQ vwf_pg_sel_left
	LDA {vwf_pg}
	INC
	CMP {vwf_tmp}
	BCC vwf_pg_sel_set
	LDA #$0000
	BRA vwf_pg_sel_set

vwf_pg_sel_left:
	LDA {vwf_pg}
	BNE vwf_pg_sel_dec
	LDA {vwf_tmp}
vwf_pg_sel_dec:
	DEC
vwf_pg_sel_set:
	STA {vwf_pg}
	SEP #$20
	PLA
	PLA
	PLA
	LDA #$C0
	PHA
	LDA #$61
	PHA
	LDA #$95
	PHA
	RTL

vwf_pg_count:
	LDA $02
	AND #$00FF
	CLC
	ADC #$0003
	STA {vwf_tmp}
	LDA #$0000
vwf_pg_count_loop:
	PHA
	LDA {vwf_tmp}
	SEC
	SBC #$0004
	STA {vwf_tmp}
	PLA
	BCC vwf_pg_count_end
	INC
	BRA vwf_pg_count_loop

vwf_pg_count_end:
	STA {vwf_tmp}
	RTS

vwf_pg_end:
	PHP
	REP #$30
	PHA
	PHX
	PHY
	LDA {vwf_pg_on}
	BEQ vwf_pg_end_go
	LDA $02
	AND #$00FF
	CMP #$0005
	BCC vwf_pg_end_go
	PHB
	JSR vwf_pg_num
	PLB
vwf_pg_end_go:
	PLY
	PLX
	PLA
	PLP
	SEP #$20
	PLA
	PLA
	PLA
	PLP
	PEA $62FD
	JML $C092F5

vwf_pg_num:
	JSR vwf_pg_count
	LDA {vwf_pg}
	CLC
	ADC #$AE51
	STA $7E04F6
	LDA {vwf_tmp}
	CLC
	ADC #$0050
	STA $7E04F8
vwf_pg_num_draw:
	LDA #$04F6
	STA {vwf_tptr}
	LDA #$007E
	STA {vwf_tbank}
	LDA #$001A
	STA {vwf_col0}
	LDA #$0016
	STA {vwf_row}
	LDA #$0003
	STA {vwf_ncols}
	LDA #$0002
	STA {vwf_tmp}
	LDA #$2C00
	JSR vwf_pg_text
	RTS

vwf_opaque:
	LDA {vwf_used}
	ASL #4
	TAY
	LDX #$0000
vwf_opaque_loop:
	LDA {vwf_buf},x
	AND #$00FF
	EOR #$00FF
	XBA
	ORA {vwf_buf},x
	STA {vwf_buf},x
	INX #2
	DEY
	BNE vwf_opaque_loop
	RTS

vwf_put_map:
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	ASL
	STA {vwf_cell}
	LDA {vwf_tile}
	JSR vwf_put_srow
	LDA {vwf_font}
	CMP #$0002
	BEQ vwf_put_map_one
	LDA {vwf_cell}
	CLC
	ADC #$0040
	STA {vwf_cell}
	LDA {vwf_tile}
	INC
	JSR vwf_put_srow
	LDA {vwf_used}
	ASL
	CLC
	ADC {vwf_tile}
	STA {vwf_tile}
	LDA {vwf_row}
	CLC
	ADC #$0002
	STA {vwf_row}
	RTS

vwf_put_map_one:
	LDA {vwf_used}
	CLC
	ADC {vwf_tile}
	STA {vwf_tile}
	LDA {vwf_row}
	INC
	STA {vwf_row}
	RTS

vwf_put_srow:
	STA {vwf_src}
	LDX #$0000
vwf_put_srow_col:
	TXA
	LSR
	CMP {vwf_used}
	BCS vwf_put_srow_blank
	LDA {vwf_pcol},x
	ORA {vwf_src}
	BRA vwf_put_srow_st

vwf_put_srow_blank:
	LDA {vwf_pcol},x
	AND #$FC00
	ORA #$0020
vwf_put_srow_st:
	PHX
	PHA
	TXA
	CLC
	ADC {vwf_cell}
	TAX
	PLA
	STA $7E41EB,x
	PLX
	LDA {vwf_font}
	CMP #$0002
	LDA {vwf_src}
	INC
	BCS vwf_put_srow_one
	INC
vwf_put_srow_one:
	STA {vwf_src}
	INX #2
	TXA
	LSR
	CMP {vwf_ncols}
	BCC vwf_put_srow_col
	RTS

vwf_put_row:
	STA {vwf_src}
	LDX #$0000
vwf_put_col:
	TXA
	LSR
	CMP {vwf_used}
	BCS vwf_put_col_end
	LDA {vwf_src}
	ORA {vwf_pcol},x
	STA $002118
	LDA {vwf_src}
	INC #2
	STA {vwf_src}
	INX #2
	BRA vwf_put_col

vwf_put_col_end:
	RTS

vwf_put_mark:
	STA {vwf_mt}
	LDA {vwf_used}
	BEQ vwf_put_mark_end
	LDA {vwf_row}
	ASL #5
	CLC
	ADC {vwf_col0}
	STA {vwf_cell}
vwf_put_mark_row:
	LDA {vwf_used}
	STA {vwf_ml}
vwf_put_mark_col:
	LDA {vwf_cell}
	JSR vwf_mark
	INC
	STA {vwf_cell}
	LDA {vwf_ml}
	DEC
	STA {vwf_ml}
	BNE vwf_put_mark_col
	LDA {vwf_cell}
	SEC
	SBC {vwf_used}
	CLC
	ADC #$0020
	STA {vwf_cell}
	LDA {vwf_mt}
	DEC
	STA {vwf_mt}
	BNE vwf_put_mark_row
vwf_put_mark_end:
	RTS

vwf_mark:
	PHX
	PHA
	LDA {vwf_nomark}
	BNE vwf_mark_clr
	LDA $01,s
	JSR vwf_bit
	SEP #$20
	LDA {vwf_map},x
	ORA {vwf_tmp}
	STA {vwf_map},x
	REP #$20
	BRA vwf_mark_end

vwf_mark_clr:
	LDA $01,s
	JSR vwf_bit
	SEP #$20
	LDA {vwf_tmp}
	EOR #$FF
	AND {vwf_map},x
	STA {vwf_map},x
	REP #$20
vwf_mark_end:
	PLA
	PLX
	RTS

vwf_bit:
	AND #$03FF
	PHA
	AND #$0007
	TAX
	LDA.l vwf_bits,x
	AND #$00FF
	STA {vwf_tmp}
	PLA
	LSR #3
	TAX
	RTS

vwf_vram_on:
	PHP
	SEP #$20
	LDA #$00
	STA {vwf_blanked}
	LDA {vwf_blank}
	BNE vwf_vram_on_end
	LDA $004212
	BPL vwf_vram_wait1
	LDA $00213F
	LDA $002137
	LDA $00213D
	XBA
	LDA $00213D
	AND #$01
	BNE vwf_vram_wait1
	XBA
	CMP #$F5
	BCC vwf_vram_go
vwf_vram_wait1:
	LDA $004212
	BMI vwf_vram_wait1
vwf_vram_wait2:
	LDA $004212
	BPL vwf_vram_wait2
vwf_vram_go:
	LDA #$8F
	STA $002100
	STA {vwf_blanked}
	LDA {vwf_hidden}
	BNE vwf_vram_on_end
	LDA {vwf_ctx}
	BNE vwf_vram_on_end
	REP #$20
	LDA $7E4142
	CMP #$7C00
	SEP #$20
	BEQ vwf_vram_on_end
	LDA #$00
	STA $002126
	LDA #$FF
	STA $002127
	LDA #$02
	STA $002124
	LDA #$04
	STA $00212E
	STA {vwf_hidden}
vwf_vram_on_end:
	PLP
	RTS

vwf_upload:
	PHP
	SEP #$20
	LDA {vwf_hidden}
	BEQ vwf_upload_go
	LDA #$00
	STA $00212E
	STA $002124
	STA {vwf_hidden}
vwf_upload_go:
	JSR vwf_scroll
	LDA #$80
	JML $C10E3F

vwf_scroll:
	LDA.l $7E0000+{gengo}
	CMP #$01
	BCC vwf_scroll_off
	LDA {vwf_team}
	BRA vwf_scroll_cmp

vwf_scroll_off:
	LDA #$00
vwf_scroll_cmp:
	CMP {vwf_scrl}
	BEQ vwf_scroll_end
	STA {vwf_scrl}
	CMP #$00
	BEQ vwf_scroll_reset
	LDA #$0F
	STA $00210E
	LDA #$00
	STA $00210E
	LDA #$0F
	STA $002110
	LDA #$00
	STA $002110
	LDA #$0F
	STA $002112
	LDA #$00
	STA $002112
	RTS

vwf_scroll_reset:
	LDA #$FF
	STA $00210E
	LDA #$01
	STA $00210E
	LDA #$FF
	STA $002110
	LDA #$01
	STA $002110
	LDA #$FF
	STA $002112
	LDA #$01
	STA $002112
vwf_scroll_end:
	RTS

vwf_vram_off:
	PHP
	SEP #$20
	LDA {vwf_blanked}
	BEQ vwf_vram_off_end
	LDA $7E2053
	STA $002100
vwf_vram_off_end:
	PLP
	RTS

vwf_tm:
	PHP
	SEP #$20
	PHA
	LDA.l $7E0000+{gengo}
	CMP #$01
	BCC vwf_tm_jp
	REP #$30
	PHX
	PHY
	LDA #$0000
	STA {vwf_zn}
	LDA #$0040
	STA {vwf_cell}
vwf_tm_loop:
	LDA {vwf_cell}
	JSR vwf_bit
	LDA {vwf_map},x
	AND {vwf_tmp}
	AND #$00FF
	BNE vwf_tm_next
	LDA {vwf_zn}
	TAX
	LDA {vwf_cell}
	CLC
	ADC #$2800
	STA {vwf_buf},x
	TXA
	INC #2
	STA {vwf_zn}
vwf_tm_next:
	LDA {vwf_cell}
	INC
	STA {vwf_cell}
	CMP #$0080
	BCC vwf_tm_loop
	JSR vwf_zflush
	PLY
	PLX
	SEP #$20
	PLA
	ORA #$04
	BRA vwf_tm_set

vwf_tm_jp:
	PLA
vwf_tm_set:
	STA $00212C
	PLP
	RTL

vwf_lv_pos:
	LDA.l $C0E53D,x
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_lv_pos_end
	CPX.w #$0008
	BCS vwf_lv_pos_end
	CPX.w #$0004
	BCS vwf_lv_pos_lo
	PLA
	CLC
	ADC #$0040
	RTL

vwf_lv_pos_lo:
	PLA
	CLC
	ADC #$0080
	RTL

vwf_lv_pos_end:
	PLA
	RTL

vwf_def_ld:
	LDA.l $C10E76,x
	STA.l $7E4146
	LDA.l $C10E78,x
	STA.l $7E4148
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	BCC vwf_def_ld_end
	LDA.l $7E4144
	CMP #$0C
	BEQ vwf_def_ld_h
	CMP #$0D
	BNE vwf_def_ld_0f
	LDA #$10
	STA.l $7E4147
vwf_def_ld_h:
	LDA #$0C
	STA.l $7E4149
	BRA vwf_def_ld_end

vwf_def_ld_0f:
	CMP #$0F
	BNE vwf_def_ld_end
	LDA #$10
	STA.l $7E4147
vwf_def_ld_end:
	REP #$20
	RTL

vwf_team_up:
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_team_up_jp
	LDY #$7441
	LDX #$426D
	PLA
	RTL

vwf_team_up_jp:
	LDY #$7421
	LDX #$422D
	PLA
	RTL

vwf_info_base:
	AND #$0001
	BEQ vwf_info_base_top
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_info_base_jp
	LDA #$0380
	BRA vwf_info_base_top

vwf_info_base_jp:
	LDA #$0340
vwf_info_base_top:
	CLC
	ADC #$0102
	RTL

vwf_box_base:
	LDX #$017A
	BIT #$0001
	BEQ vwf_box_base_end
	LDX #$04BA
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_box_base_pla
	LDX #$04FA
vwf_box_base_pla:
	PLA
vwf_box_base_end:
	RTL

vwf_trash:
	LDX #$0678
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_trash_end
	LDX #$06B8
vwf_trash_end:
	LDA #$0012
	RTL

vwf_trash2:
	LDX #$06B8
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_trash2_end
	LDX #$06F8
vwf_trash2_end:
	LDA #$0014
	RTL

vwf_spr_y:
	LDA.l $7E0000+{gengo}
	CMP #$01
	BCC vwf_spr_y_jp
	CPX.w #$0002
	BCS vwf_spr_y_jp
	LDA.l $C0E445,x
	SEC
	SBC #$08
	RTL

vwf_spr_y_jp:
	LDA.l $C0E445,x
	RTL

vwf_list_x:
	JSR vwf_list_base
	TAX
	LDA #$0020
	RTL

vwf_list_a:
	JSR vwf_list_base
	CLC
	RTL

vwf_mb_keep:
	STA $7E204E
	PHP
	REP #$30
	LDA {vwf_mbk}
	BNE vwf_mb_keep_on
	SEP #$20
	LDA #$00
	STA $7E415B
	REP #$20
	LDA #$0000
	STA {vwf_mbp}
	BRA vwf_mb_keep_end

vwf_mb_keep_on:
	LDA #$0000
	STA {vwf_mbk}
vwf_mb_keep_end:
	PLP
	LDA #$05
	RTL

vwf_mb_pgchk:
	JSR vwf_mb_vn
	BCC vwf_mb_pgchk_no
	LDA $7E415B
	AND #$00FF
	LSR #3
	CMP {vwf_mbp}
	BEQ vwf_mb_pgchk_no
	STA {vwf_mbp}
	LDA #$0001
	STA {vwf_mbk}
	SEC
	RTS

vwf_mb_pgchk_no:
	CLC
	RTS

vwf_mb_loop:
	PHP
	REP #$30
	JSR vwf_mb_pgchk
	BCC vwf_mb_loop_cad7
	SEP #$20
	REP #$10
	PHK
	PEA vwf_mb_loop_r1-1
	PEA $EC62
	JML $C0CA4C

vwf_mb_loop_r1:
vwf_mb_loop_cad7:
	SEP #$20
	REP #$10
	PHK
	PEA vwf_mb_loop_r2-1
	PEA $EC62
	JML $C0CAD7

vwf_mb_loop_r2:
	PLP
	LDA $7E202A
	RTL

vwf_mb_hrow:
	JSR vwf_mb_vn
	BCC vwf_mb_hrow_jp
	AND #$0007
	ASL
	CLC
	ADC #$0003
	ASL #6
	RTL

vwf_mb_hrow_jp:
	INC #2
	ASL #6
	RTL

vwf_mb_row:
	JSR vwf_mb_vn
	BCS vwf_mb_row_vn
	LDA $0608,y
	CMP #$FFFF
	BEQ vwf_mb_row_end
	RTL

vwf_mb_row_end:
	SEP #$20
	PLA
	REP #$20
	PLA
	JML $C0DAD3

vwf_mb_row_vn:
	LDA #$0010
	SEC
	SBC $06,s
	PHA
	LSR #3
	CMP {vwf_mbp}
	BEQ vwf_mb_row_on
	PLA
	SEP #$20
	PLA
	REP #$20
	PLA
	PLA
	PLX
	PLY
	INY #2
	DEX
	BEQ vwf_mb_row_done
	JML $C0DA16

vwf_mb_row_done:
	JML $C0DAD1

vwf_mb_row_on:
	PLA
	AND #$0007
	XBA
	LSR
	CLC
	ADC #$00C6
	STA $04,s
	LDA $0608,y
	CMP #$FFFF
	BEQ vwf_mb_row_empty
	RTL

vwf_mb_row_empty:
	PHX
	LDA $06,s
	LSR #6
	DEC
	STA {vwf_row}
	LDA #$0003
	STA {vwf_col0}
	LDA #$0008
	STA {vwf_ncols}
	JSR vwf_item_clr
	PLX
	BRA vwf_mb_row_end

vwf_list_clr:
	JSR vwf_list_base
	TAX
	LDA #$0020
	STA $7E43AB,x
	RTL

vwf_list_base:
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_list_base_jp
	LDA $7E4142
	CMP #$7400
	BNE vwf_list_base_jp
	LDA #$01DC
	RTS

vwf_list_base_jp:
	LDA #$01E0
	RTS

vwf_chimei:
	PHA
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	BCS vwf_chimei_vn
vwf_chimei_jp:
	REP #$20
	PLA
	CLC
	ADC #$0145
	JML $C0EB77

vwf_chimei_vn:
	REP #$20
	LDA $01,s
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_lg_23
	NOP
	XBA
	AND #$00FF
	BEQ vwf_chimei_jp
	STA {vwf_tbank}
	JSR vwf_lg_24
	NOP
	STA {vwf_tptr}
	PLA
	LDA #$000D
	STA {vwf_col0}
	LDA #$0002
	STA {vwf_row}
	LDA #$0012
	STA {vwf_ncols}
	LDA #$0100
	STA {vwf_tile}
	LDA #$2C00
	STA {vwf_pal}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA #$0001
	STA {vwf_nomark}
	STA {vwf_font}
	LDA #$0000
	STA {vwf_xoff}
	STA {vwf_end}
	STA {vwf_lnum}
	STA {vwf_dflag}
	STA {vwf_drawn}
	JSR vwf_ctx_set
	LDA #$0001
	STA {vwf_dirty}
	JSR vwf_measure
	JSR vwf_line
	JSR vwf_put
	LDA #$0000
	STA {vwf_nomark}
	STA {vwf_font}
	JML $C0EB8E

vwf_m7_name:
	PHP
	REP #$30
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$01
	REP #$20
	BCC vwf_m7_name_jp
	LDA $7E2CF1
	SEC
	SBC #$0145
	CMP #$0046
	BCS vwf_m7_name_jp
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_lg_23
	NOP
	XBA
	AND #$00FF
	BNE vwf_m7_name_vn
vwf_m7_name_jp:
	PLP
	JML $C0F15F

vwf_m7_name_vn:
	STA {vwf_tbank}
	JSR vwf_lg_24
	NOP
	STA {vwf_tptr}
	LDA #$0002
	STA {vwf_col0}
	LDA #$0019
	STA {vwf_row}
	LDA #$001C
	STA {vwf_ncols}
	LDA #$0100
	STA {vwf_tile}
	LDA #$2000
	STA {vwf_pal}
	LDA #$FFFF
	STA {vwf_sidx}
	LDA #$0001
	STA {vwf_nomark}
	STA {vwf_font}
	LDA #$0000
	STA {vwf_xoff}
	STA {vwf_end}
	STA {vwf_lnum}
	STA {vwf_dflag}
	STA {vwf_drawn}
	JSR vwf_ctx_set
	LDA #$0001
	STA {vwf_dirty}
	JSR vwf_measure
	JSR vwf_line
	JSR vwf_line_used
	STA {vwf_used}
	JSR vwf_nohide_on
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$01
	STA $004300
	LDA #$18
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$7000
	STA $004302
	LDA {vwf_used}
	ASL #5
	BEQ vwf_m7_name_map
	STA $004305
	LDA #$6800
	STA $002116
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
vwf_m7_name_map:
	LDA #$7400+$19*32+1
	JSR vwf_m7_row
	LDA #$7400+$1A*32+1
	JSR vwf_m7_row
	JSR vwf_vram_off
	JSR vwf_nohide_off
	LDA #$0000
	STA {vwf_nomark}
	STA {vwf_font}
	PLP
	RTL

vwf_m7_row:
	STA $002116
	SEC
	SBC #$7400+$19*32+1
	BEQ vwf_m7_row_top
	LDA #$0001
vwf_m7_row_top:
	ORA #$2100
	STA {vwf_src}
	LDX #$0000
vwf_m7_row_col:
	TXA
	SEC
	SBC #$0001
	BCC vwf_m7_row_blank
	CMP {vwf_used}
	BCS vwf_m7_row_blank
	LDA {vwf_src}
	STA $002118
	INC #2
	STA {vwf_src}
	BRA vwf_m7_row_next

vwf_m7_row_blank:
	LDA #$0000
	STA $002118
vwf_m7_row_next:
	INX
	CPX #$001D
	BCC vwf_m7_row_col
	RTS

vwf_measure:
	LDA {vwf_tptr}
	PHA
	LDA {vwf_tbank}
	PHA
	LDA #$0000
	STA {vwf_mw}
	STA {vwf_ml}
	STA {vwf_mt}
	STA {vwf_mseen}
	STA {vwf_dflag}
vwf_measure_loop:
	JSR vwf_getc
	BNE vwf_measure_c
	JSR vwf_dict_pop
	BCC vwf_measure_loop
	JMP vwf_measure_done

vwf_measure_c:
	PHA
	JSR vwf_inc
	PLA
	CMP #$0004
	BNE vwf_measure_arg
	JMP vwf_measure_done

vwf_measure_arg:
	CMP #$0002
	BEQ +
	CMP #$0003
	BEQ +
	CMP #$0005
	BEQ +
	CMP #$0010
	BCS vwf_measure_chr
	CMP #$0006
	BCC vwf_measure_loop
	JSR vwf_dict
	BRA vwf_measure_loop
+
	JSR vwf_inc
	BRA vwf_measure_loop

vwf_measure_chr:
	CMP #$00F0
	BNE vwf_measure_chr0
	JSR vwf_dictf
	JMP vwf_measure_loop

vwf_measure_chr0:
	CMP #$00AE
	BCC vwf_measure_chr1
	JMP vwf_measure_loop

vwf_measure_chr1:
	STA {vwf_tmp}
	JSR vwf_cwidth0
	STA {vwf_adv}
	CLC
	ADC {vwf_mw}
	STA {vwf_mw}
	LDA {vwf_tmp}
	CMP #$004F
	BNE vwf_measure_text
	LDA {vwf_mseen}
	BNE vwf_measure_trail
	LDA {vwf_adv}
	CLC
	ADC {vwf_ml}
	STA {vwf_ml}
	JMP vwf_measure_loop

vwf_measure_trail:
	LDA {vwf_adv}
	CLC
	ADC {vwf_mt}
	STA {vwf_mt}
	JMP vwf_measure_loop

vwf_measure_text:
	LDA #$0001
	STA {vwf_mseen}
	LDA #$0000
	STA {vwf_mt}
	JMP vwf_measure_loop

vwf_measure_done:
	PLA
	STA {vwf_tbank}
	PLA
	STA {vwf_tptr}
	LDA #$0000
	STA {vwf_dflag}
	LDA {vwf_mw}
	SEC
	SBC {vwf_ml}
	SEC
	SBC {vwf_mt}
	STA {vwf_tmp}
	LDA {vwf_ncols}
	ASL #3
	SEC
	SBC {vwf_tmp}
	BCC vwf_measure_zero
	LSR
	SEC
	SBC {vwf_ml}
	BCC vwf_measure_zero
	STA {vwf_xoff}
	RTS

vwf_measure_zero:
	LDA #$0000
	STA {vwf_xoff}
	RTS

vwf_cwidth0:
	CMP #$0060
	BCS vwf_cwidth0_b
	SEC
	SBC #$0010
	TAX
	LDA.l font0a_width,x
	AND #$00FF
	RTS

vwf_cwidth0_b:
	SEC
	SBC #$0060
	TAX
	LDA.l font0b_width,x
	AND #$00FF
	RTS

vwf_shift:
	dw $0000, $1400, $2800, $3C00, $5000, $6400, $7800, $8C00

vwf_bits:
	db $01, $02, $04, $08, $10, $20, $40, $80

vwf_dict_ptr:
	dl dict00, dict01, dict02, dict03, dict04
	dl dict05, dict06, dict07, dict08, dict09
	
mode7_txt_delay:
	LDA {gengo}
	BNE +
	LDX #$00B4
-
	STX $2CF9
	JML $C0BA75
+
	LDX #$0091
	BRA -
	
senki_pos:
	LDA {gengo}
	BNE +
	JSL $C0EE96
return_senki_pos:
	JML $C09EB1
+
	CMP #$02
	BEQ senki_pos_EN
	JSR senki_pos_vn
	BRL return_senki_pos
senki_pos_EN:
	JSR senki_pos_en
	BRL return_senki_pos

senki_pos_vn:	
	PHY
	PHP
	PHB
	REP #$10
	SEP #$20
	LDA #$80
	PHA
	PLB
	LDA $4200
	ORA #$81
	STA $4200
-
	LDA $4212
	BIT #$80
	BEQ -
	LDA #$80
	STA $2115
	LDX #$1801
	STX $4300
	LDX #$0400
	STX $4305
	LDX #(senki)
	STX $4302
	LDX #$4000
	STX $2116
	LDA.b #(senki>>16)
	STA $4304
	LDA #$01
	STA $420B	
	PLB
	LDX #$0000
-	
	LDA senki_table,x
	STA $36EC,x
	INX
	CPX #$0031
	BNE -
	
	JSR dma_table
	LDY #$0020
.repeat:
	LDX #$FFFF
-
	DEX
	BNE -
	DEY
	BNE .repeat
	PLP
	PLY
	RTS
	
dma_table:
	PHP
	SEP #$20
	LDA #$00
	STA $004300
	LDA #$04
	STA $004301
	LDA #$7E
	STA $004304
	REP #$20
	LDA #$36EC
	STA $004302
	LDA #$0220
	STA $004305
	LDA #$0000
	STA $002102
	SEP #$20
	LDA #$01
	STA $00420B
	PLP
	RTS

	
senki_table:
	db $50, $C0, $00, $24
	db $58, $C0, $01, $24
	db $60, $C0, $02, $24
	db $68, $C0, $03, $24
	db $70, $C0, $04, $24
	db $78, $C0, $05, $24
	db $80, $C0, $06, $24
	db $88, $C0, $07, $24
	db $90, $C0, $08, $24
	db $98, $C0, $09, $24
	db $A0, $C0, $0A, $24
	db $A8, $C0, $0B, $24
	db $B0, $C0, $0C, $24

senki_pos_en:
	PHY
	PHP
	PHB
	REP #$10
	SEP #$20
	LDA #$80
	PHA
	PLB
	LDA $4200
	ORA #$81
	STA $4200
-
	LDA $4212
	BIT #$80
	BEQ -
	LDA #$80
	STA $2115
	LDX #$1801
	STX $4300
	LDX #$0400
	STX $4305
	LDX #(senki_EN)
	STX $4302
	LDX #$4000
	STX $2116
	LDA.b #(senki_EN>>16)
	STA $4304
	LDA #$01
	STA $420B
	PLB
	LDX #$0000
-
	LDA.l senki_table_EN,x
	STA $7E36EC,x
	INX
	CPX #$0020
	BNE -
	JSR dma_table
	LDY #$0020
senki_en_w1:
	LDX #$FFFF
senki_en_w2:
	DEX
	BNE senki_en_w2
	DEY
	BNE senki_en_w1
	PLP
	PLY
	RTS

senki_table_EN:
	db $44, $C0, $00, $24
	db $54, $C0, $02, $24
	db $64, $C0, $04, $24
	db $74, $C0, $06, $24
	db $84, $C0, $08, $24
	db $94, $C0, $0A, $24
	db $A4, $C0, $0C, $24
	db $B4, $C0, $0E, $24
	
opening_text_pos:
	PHP
	REP #$30
	LDA {gengo}
	AND #$00FF
	BNE +
	LDA #$0093
	STA $2CFB
	JML $C09E5A
+
	LDA #$0093
	STA $2CFB
	LDA #$0800
	STA $2CF7 //text obj flip
	LDA #$A810	//: text y pos
	STA $2CF5  //text y pos
	LDA #$00DC
	STA $2CF9  //wait
	JML $C09E6C

vwf_char_f9:
	CMP #$00F9
	BEQ vwf_placestr
	JMP vwf_char

vwf_placestr:
	LDA {vwf_dflag}
	BNE vwf_pl_end
	LDA $7E2CF3
	SEC
	SBC #$0145
	BCC vwf_pl_end
	CMP #$0046
	BCS vwf_pl_end
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	TAX
	JSR vwf_lg_23
	NOP
	XBA
	AND #$00FF
	BEQ vwf_pl_end
	PHA
	JSR vwf_lg_24
	NOP
	PHA
	LDA {vwf_tptr}
	STA {vwf_dret}
	LDA {vwf_tbank}
	STA {vwf_dbank}
	PLA
	STA {vwf_tptr}
	PLA
	STA {vwf_tbank}
	LDA #$0001
	STA {vwf_dflag}
vwf_pl_skip:
	JSR vwf_getc
	CMP #$004F
	BNE vwf_pl_end
	JSR vwf_inc
	BRA vwf_pl_skip
vwf_pl_end:
	RTS

vwf_pl_save:
	LDA {vwf_dflag}
	CMP #$0001
	BNE vwf_pl_save_no
	LDA {vwf_tbank}
	JSR vwf_lg_25
	BNE vwf_pl_save_no
	LDA {vwf_tptr}
	JSR vwf_lg_26
	BCC vwf_pl_save_no
	JSR vwf_lg_27
	BCS vwf_pl_save_no
	STA {vwf_pret}
	LDA {vwf_tbank}
	STA {vwf_pbank}
	LDA #$0002
	STA {vwf_dflag}
	SEC
	RTS

vwf_pl_save_no:
	CLC
	RTS

vwf_dnest:
	LDA {vwf_dflag}
	BEQ vwf_dnest_go
	JSR vwf_pl_save
	BCC vwf_dnest_skip
	LDA.l vwf_dict_ptr,x
	STA {vwf_tptr}
	LDA.l vwf_dict_ptr+2,x
	AND #$00FF
	STA {vwf_tbank}
vwf_dnest_skip:
	SEC
	RTS

vwf_dnest_go:
	CLC
	RTS

vwf_dfnest:
	LDA {vwf_dflag}
	BEQ vwf_dnest_go
	LDA.l dictF0,x
	BEQ vwf_dnest_skip
	JSR vwf_pl_save
	BCC vwf_dnest_skip
	LDA.l dictF0,x
	CLC
	ADC.w #dictF0
	STA {vwf_tptr}
	LDA.w #dictF0>>16
	ADC #$0000
	STA {vwf_tbank}
	SEC
	RTS

vwf_dpop2:
	LDA {vwf_dflag}
	BEQ vwf_dpop2_end
	CMP #$0002
	BNE +
	LDA #$0001
	STA {vwf_dflag}
	LDA {vwf_pret}
	STA {vwf_tptr}
	LDA {vwf_pbank}
	STA {vwf_tbank}
	PLA
	CLC
	RTS
+
	CLC
	RTS

vwf_dpop2_end:
	SEC
	RTS

vwf_chimei_ptr:
	dl chimei00, chimei01, chimei02, chimei03, chimei04, chimei05, chimei06, chimei07, chimei08, chimei09
	dl chimei0A, chimei0B, chimei0C, chimei0D, chimei0E, chimei0F, chimei10, chimei11, chimei12, chimei13
	dl chimei14, chimei15, chimei16, chimei17, chimei18, chimei19, chimei1A, chimei1B, chimei1C, chimei1D
	dl chimei1E, chimei1F, chimei20, chimei21, chimei22, chimei23, chimei24, chimei25, chimei26, chimei27
	dl chimei28, chimei29, chimei2A, chimei2B, chimei2C, chimei2D, chimei2E, chimei2F, chimei30, chimei31
	dl chimei32, chimei33, chimei34, chimei35, chimei36, chimei37, chimei38, chimei39, chimei3A, chimei3B
	dl chimei3C, chimei3D, chimei3E, chimei3F, chimei40, chimei41, chimei42, chimei43, chimei44, chimei45

vwf_window_ptr:
	dl menu_text00, menu_text01, menu_text02, menu_text03
	dl menu_text04, menu_text05, vwf_xe_str, menu_text07
	dl menu_text08, menu_text09, menu_text0A, menu_text0B
	dl menu_text0C, menu_text0D, menu_text0E, menu_text0F
	dl menu_text10, menu_text11, menu_text12, menu_text13
	dl menu_text14, menu_text15, menu_text16, menu_text17
	dl menu_text18, menu_text19, menu_text1A, menu_text1B
	dl menu_text1C, menu_text1D, menu_text1E, menu_text1F
	dl menu_text20, menu_text21, menu_text22, menu_text23
	dl menu_text24, menu_text25, menu_text26, menu_text27
	dl menu_text28, menu_text29, menu_text2A, menu_text2B
	dl menu_text2C, menu_text2D, menu_text2E, menu_text2F
	dl menu_text30, menu_text31, menu_text32, menu_text33
	dl menu_text34, menu_text35, menu_text36, menu_text37
	dl menu_text38, menu_text39, menu_text3A, menu_text3B
	dl menu_text3C, menu_text3D, menu_text3E, menu_text3F
	dl menu_text40, menu_text41, menu_text42, menu_text43
	dl menu_text44, menu_text45, menu_text46, menu_text47
	dl menu_text48, menu_text49, menu_text4A, menu_text4B
	dl menu_text4C, menu_text4D, menu_text4E, menu_text4F
	dl menu_text50, menu_text51, menu_text52, menu_text53
	dl menu_text54, menu_text55, menu_text56, menu_text57
	dl menu_text58, menu_text59, menu_text5A, menu_text5B
	dl menu_text5C, menu_text5D, menu_text5E, menu_text5F
	dl menu_text60, menu_text61, menu_text62, menu_text63
	dl menu_text64

vwf_window_x:
	db $10, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $00, $00
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08

vwf_window_w:
	db $00, $00, $0E, $09, $07, $00, $00, $08, $12, $12, $00, $00, $00, $00, $00, $00
	db $0D, $00, $15, $00, $00, $07, $00, $00, $12, $00, $00, $00, $00, $00, $00, $00
	db $00, $0C, $0C, $00, $00, $10, $00, $00, $1A, $00, $00, $00, $16, $00, $00, $0A
	db $00, $00, $00, $00, $12, $00, $00, $08, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $0E, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_h:
	db $00, $00, $00, $06, $06, $00, $17, $00, $04, $04, $00, $00, $0C, $0C, $00, $00
	db $00, $00, $00, $02, $02, $04, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0B, $0B, $00, $00, $00, $09, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $16, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_cy:
	db $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00, $01, $01, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_f:
	db $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_y:
	db $00, $00, $00, $0B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $00, $10
	db $00, $00, $00, $00, $0D, $0B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0B, $0B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_c:
	db $FF, $00, $0D, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $0C, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $12, $FF, $FF, $0E, $FF, $FF, $02, $FF, $FF, $FF, $04, $FF, $FF, $0A
	db $FF, $FF, $FF, $FF, $0C, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $10, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF

vwf_window_cx:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_o:
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00

vwf_window_a:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $00, $00, $00, $00
	db $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00
	

vwf_isen:
	PHA
	PHP
	SEP #$20
	LDA.l $7E0000+{gengo}
	CMP #$02
	BCS vwf_isen_y
	PLP
	PLA
	CLC
	RTS

vwf_isen_y:
	PLP
	PLA
	SEC
	RTS

vwf_lg_00:
	PHP
	JSR vwf_isen
	BCS vwf_lg_00_e
	PLP
	LDA.l vwf_window_ptr+1,x
	RTS

vwf_lg_00_e:
	PLP
	LDA.l vwf_window_ptr_E+1,x
	RTS

vwf_lg_01:
	PHP
	JSR vwf_isen
	BCS vwf_lg_01_e
	PLP
	LDA.l vwf_window_ptr,x
	RTS

vwf_lg_01_e:
	PLP
	LDA.l vwf_window_ptr_E,x
	RTS

vwf_lg_02:
	PHP
	JSR vwf_isen
	BCS vwf_lg_02_e
	PLP
	LDA.l vwf_window_ptr+2,x
	RTS

vwf_lg_02_e:
	PLP
	LDA.l vwf_window_ptr_E+2,x
	RTS

vwf_lg_03:
	PHP
	JSR vwf_isen
	BCS vwf_lg_03_e
	PLP
	LDA.w #menu_text0A
	RTS

vwf_lg_03_e:
	PLP
	LDA.w #menu_text0A_E
	RTS

vwf_lg_04:
	PHP
	JSR vwf_isen
	BCS vwf_lg_04_e
	PLP
	LDA.w #menu_text0A>>16
	RTS

vwf_lg_04_e:
	PLP
	LDA.w #menu_text0A_E>>16
	RTS

vwf_lg_05:
	PHP
	JSR vwf_isen
	BCS vwf_lg_05_e
	PLP
	LDA.l Item
	RTS

vwf_lg_05_e:
	PLP
	LDA.l Item_E
	RTS

vwf_lg_06:
	PHP
	JSR vwf_isen
	BCS vwf_lg_06_e
	PLP
	LDA.l Item,x
	RTS

vwf_lg_06_e:
	PLP
	LDA.l Item_E,x
	RTS

vwf_lg_07:
	PHP
	JSR vwf_isen
	BCS vwf_lg_07_e
	PLP
	LDA.l Item+2,x
	RTS

vwf_lg_07_e:
	PLP
	LDA.l Item_E+2,x
	RTS

vwf_lg_08:
	PHP
	JSR vwf_isen
	BCS vwf_lg_08_e
	PLP
	LDA.w #Item
	RTS

vwf_lg_08_e:
	PLP
	LDA.w #Item_E
	RTS

vwf_lg_09:
	PHP
	JSR vwf_isen
	BCS vwf_lg_09_e
	PLP
	LDA.w #Item>>16
	RTS

vwf_lg_09_e:
	PLP
	LDA.w #Item_E>>16
	RTS

vwf_lg_0A:
	PHP
	JSR vwf_isen
	BCS vwf_lg_0A_e
	PLP
	CMP.l Name
	RTS

vwf_lg_0A_e:
	PLP
	CMP.l Name_E
	RTS

vwf_lg_0B:
	PHP
	JSR vwf_isen
	BCS vwf_lg_0B_e
	PLP
	LDA.l Name,x
	RTS

vwf_lg_0B_e:
	PLP
	LDA.l Name_E,x
	RTS

vwf_lg_0C:
	PHP
	JSR vwf_isen
	BCS vwf_lg_0C_e
	PLP
	ADC.w #Name
	RTS

vwf_lg_0C_e:
	PLP
	ADC.w #Name_E
	RTS

vwf_lg_0D:
	PHP
	JSR vwf_isen
	BCS vwf_lg_0D_e
	PLP
	LDA.w #Name>>16
	RTS

vwf_lg_0D_e:
	PLP
	LDA.w #Name_E>>16
	RTS

vwf_lg_0E:
	PHP
	JSR vwf_isen
	BCS vwf_lg_0E_e
	PLP
	CMP.l Class
	RTS

vwf_lg_0E_e:
	PLP
	CMP.l Class_E
	RTS

vwf_lg_0F:
	PHP
	JSR vwf_isen
	BCS vwf_lg_0F_e
	PLP
	LDA.l Class,x
	RTS

vwf_lg_0F_e:
	PLP
	LDA.l Class_E,x
	RTS

vwf_lg_10:
	PHP
	JSR vwf_isen
	BCS vwf_lg_10_e
	PLP
	ADC.w #Class
	RTS

vwf_lg_10_e:
	PLP
	ADC.w #Class_E
	RTS

vwf_lg_11:
	PHP
	JSR vwf_isen
	BCS vwf_lg_11_e
	PLP
	LDA.w #Class>>16
	RTS

vwf_lg_11_e:
	PLP
	LDA.w #Class_E>>16
	RTS

vwf_lg_12:
	PHP
	JSR vwf_isen
	BCS vwf_lg_12_e
	PLP
	LDA.w #vwf_tsel_str
	RTS

vwf_lg_12_e:
	PLP
	LDA.w #vwf_tsel_str_E
	RTS

vwf_lg_13:
	PHP
	JSR vwf_isen
	BCS vwf_lg_13_e
	PLP
	LDA.w #vwf_tsel_str>>16
	RTS

vwf_lg_13_e:
	PLP
	LDA.w #vwf_tsel_str_E>>16
	RTS

vwf_lg_14:
	PHP
	JSR vwf_isen
	BCS vwf_lg_14_e
	PLP
	LDA.l kaiwa,x
	RTS

vwf_lg_14_e:
	PLP
	LDA.l kaiwa_E,x
	RTS

vwf_lg_15:
	PHP
	JSR vwf_isen
	BCS vwf_lg_15_e
	PLP
	ADC.w #kaiwa
	RTS

vwf_lg_15_e:
	PLP
	ADC.w #kaiwa_E
	RTS

vwf_lg_16:
	PHP
	JSR vwf_isen
	BCS vwf_lg_16_e
	PLP
	LDA.l kaiwa+2,x
	RTS

vwf_lg_16_e:
	PLP
	LDA.l kaiwa_E+2,x
	RTS

vwf_lg_17:
	PHP
	JSR vwf_isen
	BCS vwf_lg_17_e
	PLP
	ADC.w #kaiwa>>16
	RTS

vwf_lg_17_e:
	PLP
	ADC.w #kaiwa_E>>16
	RTS

vwf_lg_18:
	PHP
	JSR vwf_isen
	BCS vwf_lg_18_e
	PLP
	LDA.l kaiwa+3,x
	RTS

vwf_lg_18_e:
	PLP
	LDA.l kaiwa_E+3,x
	RTS

vwf_lg_19:
	PHP
	JSR vwf_isen
	BCS vwf_lg_19_e
	PLP
	LDA.l kaiwa+5,x
	RTS

vwf_lg_19_e:
	PLP
	LDA.l kaiwa_E+5,x
	RTS

vwf_lg_1A:
	PHP
	JSR vwf_isen
	BCS vwf_lg_1A_e
	PLP
	LDA.w #kaiwa_end
	RTS

vwf_lg_1A_e:
	PLP
	LDA.w #kaiwa_E_end
	RTS

vwf_lg_1B:
	PHP
	JSR vwf_isen
	BCS vwf_lg_1B_e
	PLP
	LDA.w #kaiwa_end>>16
	RTS

vwf_lg_1B_e:
	PLP
	LDA.w #kaiwa_E_end>>16
	RTS

vwf_lg_1C:
	PHP
	JSR vwf_isen
	BCS vwf_lg_1C_e
	PLP
	CMP.l status
	RTS

vwf_lg_1C_e:
	PLP
	CMP.l status_E
	RTS

vwf_lg_1D:
	PHP
	JSR vwf_isen
	BCS vwf_lg_1D_e
	PLP
	LDA.l status,x
	RTS

vwf_lg_1D_e:
	PLP
	LDA.l status_E,x
	RTS

vwf_lg_1E:
	PHP
	JSR vwf_isen
	BCS vwf_lg_1E_e
	PLP
	ADC.w #status
	RTS

vwf_lg_1E_e:
	PLP
	ADC.w #status_E
	RTS

vwf_lg_1F:
	PHP
	JSR vwf_isen
	BCS vwf_lg_1F_e
	PLP
	LDA.w #status>>16
	RTS

vwf_lg_1F_e:
	PLP
	LDA.w #status_E>>16
	RTS

vwf_lg_20:
	PHP
	JSR vwf_isen
	BCS vwf_lg_20_e
	PLP
	CMP.l Item
	RTS

vwf_lg_20_e:
	PLP
	CMP.l Item_E
	RTS

vwf_lg_21:
	PHP
	JSR vwf_isen
	BCS vwf_lg_21_e
	PLP
	ADC.w #Item
	RTS

vwf_lg_21_e:
	PLP
	ADC.w #Item_E
	RTS

vwf_lg_22:
	PHP
	JSR vwf_isen
	BCS vwf_lg_22_e
	PLP
	LDA.l vwf_window_ptr+$7D
	RTS

vwf_lg_22_e:
	PLP
	LDA.l vwf_window_ptr_E+$7D
	RTS

vwf_lg_23:
	PHP
	JSR vwf_isen
	BCS vwf_lg_23_e
	PLP
	LDA.l vwf_chimei_ptr+1,x
	RTS

vwf_lg_23_e:
	PLP
	LDA.l vwf_chimei_ptr_E+1,x
	RTS

vwf_lg_24:
	PHP
	JSR vwf_isen
	BCS vwf_lg_24_e
	PLP
	LDA.l vwf_chimei_ptr,x
	RTS

vwf_lg_24_e:
	PLP
	LDA.l vwf_chimei_ptr_E,x
	RTS

vwf_lg_25:
	PHP
	JSR vwf_isen
	BCS vwf_lg_25_e
	PLP
	CMP.w #chimei00>>16
	RTS

vwf_lg_25_e:
	PLP
	CMP.w #chimei00_E>>16
	RTS

vwf_lg_26:
	PHP
	JSR vwf_isen
	BCS vwf_lg_26_e
	PLP
	CMP.w #chimei00
	RTS

vwf_lg_26_e:
	PLP
	CMP.w #chimei00_E
	RTS

vwf_lg_27:
	PHP
	JSR vwf_isen
	BCS vwf_lg_27_e
	PLP
	CMP.w #Item
	RTS

vwf_lg_27_e:
	PLP
	CMP.w #Item_E
	RTS

vwf_chimei_ptr_E:
	dl chimei00_E, chimei01_E, chimei02_E, chimei03_E, chimei04_E, chimei05_E, chimei06_E, chimei07_E, chimei08_E, chimei09_E
	dl chimei0A_E, chimei0B_E, chimei0C_E, chimei0D_E, chimei0E_E, chimei0F_E, chimei10_E, chimei11_E, chimei12_E, chimei13_E
	dl chimei14_E, chimei15_E, chimei16_E, chimei17_E, chimei18_E, chimei19_E, chimei1A_E, chimei1B_E, chimei1C_E, chimei1D_E
	dl chimei1E_E, chimei1F_E, chimei20_E, chimei21_E, chimei22_E, chimei23_E, chimei24_E, chimei25_E, chimei26_E, chimei27_E
	dl chimei28_E, chimei29_E, chimei2A_E, chimei2B_E, chimei2C_E, chimei2D_E, chimei2E_E, chimei2F_E, chimei30_E, chimei31_E
	dl chimei32_E, chimei33_E, chimei34_E, chimei35_E, chimei36_E, chimei37_E, chimei38_E, chimei39_E, chimei3A_E, chimei3B_E
	dl chimei3C_E, chimei3D_E, chimei3E_E, chimei3F_E, chimei40_E, chimei41_E, chimei42_E, chimei43_E, chimei44_E, chimei45_E

vwf_window_ptr_E:
	dl menu_text00_E, menu_text01_E, menu_text02_E, menu_text03_E
	dl menu_text04_E, menu_text05_E, vwf_xe_str, menu_text07_E
	dl menu_text08_E, menu_text09_E, menu_text0A_E, menu_text0B_E
	dl menu_text0C_E, menu_text0D_E, menu_text0E_E, menu_text0F_E
	dl menu_text10_E, menu_text11_E, menu_text12_E, menu_text13_E
	dl menu_text14_E, menu_text15_E, menu_text16_E, menu_text17_E
	dl menu_text18_E, menu_text19_E, menu_text1A_E, menu_text1B_E
	dl menu_text1C_E, menu_text1D_E, menu_text1E_E, menu_text1F_E
	dl menu_text20_E, menu_text21_E, menu_text22_E, menu_text23_E
	dl menu_text24_E, menu_text25_E, menu_text26_E, menu_text27_E
	dl menu_text28_E, menu_text29_E, menu_text2A_E, menu_text2B_E
	dl menu_text2C_E, menu_text2D_E, menu_text2E_E, menu_text2F_E
	dl menu_text30_E, menu_text31_E, menu_text32_E, menu_text33_E
	dl menu_text34_E, menu_text35_E, menu_text36_E, menu_text37_E
	dl menu_text38_E, menu_text39_E, menu_text3A_E, menu_text3B_E
	dl menu_text3C_E, menu_text3D_E, menu_text3E_E, menu_text3F_E
	dl menu_text40_E, menu_text41_E, menu_text42_E, menu_text43_E
	dl menu_text44_E, menu_text45_E, menu_text46_E, menu_text47_E
	dl menu_text48_E, menu_text49_E, menu_text4A_E, menu_text4B_E
	dl menu_text4C_E, menu_text4D_E, menu_text4E_E, menu_text4F_E
	dl menu_text50_E, menu_text51_E, menu_text52_E, menu_text53_E
	dl menu_text54_E, menu_text55_E, menu_text56_E, menu_text57_E
	dl menu_text58_E, menu_text59_E, menu_text5A_E, menu_text5B_E
	dl menu_text5C_E, menu_text5D_E, menu_text5E_E, menu_text5F_E
	dl menu_text60_E, menu_text61_E, menu_text62_E, menu_text63_E
	dl menu_text64_E

vwf_tsel_str_E:
	db $23, $3C, $2B, $3D, $32
	db $00

vwf_rest_pop:
	PHP
	REP #$30
	LDA $7E4142
	CMP #$7C00
	BNE vwf_rest_pop_go
	JSR vwf_p7_clear
vwf_rest_pop_go:
	PHB
	JML $C0D413
	
hakai_nodec:
	REP #$20
	LDA $3122
	CMP #{press_XY}
	BEQ +
	SEP #$20
	LDA #$00
	STA $5F83,y
-
	JML $C064B9
+
	SEP #$20
	BRA -
	
hakai_anzen:
	PHP
	REP #$20
	LDA $3122
	AND #{press_XU}
	CMP #{press_XU}
	BNE +
	SEP #$20
	LDA $5F93,y
	BEQ +
	CMP $5F82,y
	BCS +
	LDA $5F82,y
	STA $5F93,y
+
	PLP
	LDA #$00
	LDX $3122
	JML $C03172

vwf_pg_2a_tail:
	JSL $C10746
	PHP
	REP #$30
	PHA
	PHX
	PHY
	LDA {vwf_pg_on}
	BEQ +
	PHB
	JSR vwf_pg_num_draw
	PLB
+
	PLY
	PLX
	PLA
	PLP
	RTL

vwf_end_pal:
	LDA.l $7E0000+{gengo}
	AND #$00FF
	BEQ vwf_end_pal_n
	LDA $06,s
	AND #$00FF
	CMP #$00C0
	BNE vwf_end_pal_n
	LDA $04,s
	CMP #$A400
	BCC vwf_end_pal_n
	CMP #$A800
	BCS vwf_end_pal_n
	LDA $2CF7
	AND #$E000
	ORA #$0C00
	RTL

vwf_end_pal_n:
	LDA $2CF7
	AND #$FC00
	RTL

vwf_pg_clr:
	PHX
	PHY
	LDX #$0000
vwf_pg_clr_loop:
	TXA
	CMP {vwf_slot_n}
	BCS vwf_pg_clr_up
	PHX
	JSR vwf_mc_erase
	PLX
	INX #4
	BRA vwf_pg_clr_loop

vwf_pg_clr_up:
	LDA {vwf_slot_n}
	BEQ vwf_pg_clr_end
	JSR vwf_vram_on
	JSL $C10E3A
	REP #$30
	JSR vwf_vram_off
vwf_pg_clr_end:
	PLY
	PLX
	LDA #$0140
	RTS

vwf_kw_setid:
	STA {vwf_kwid}
	PHA
	CMP #$01AB
	BEQ vwf_kw_setid_go
	CMP #$01AD
	BNE vwf_kw_setid_end
vwf_kw_setid_go:
	LDA $7E2CF3
	BIT #$4000
	BNE vwf_kw_setid_cls
	AND #$3FFF
	STA {vwf_nameid}
	BRA vwf_kw_setid_end

vwf_kw_setid_cls:
	AND #$3FFF
	STA {vwf_classid}
vwf_kw_setid_end:
	PLA
	RTS

vwf_end_dead:
	LDA.l $7E0000+{gengo}
	AND #$00FF
	BEQ vwf_end_dead_no
	LDA $7E29D9
	AND #$01FF
	TAX
	LDA $7E2AE8,x
	AND #$00FF
	CMP #$0001
	BNE vwf_end_dead_no
	SEC
	RTS

vwf_end_dead_no:
	CLC
	RTS

vwf_end_s5:
	JSR vwf_end_dead
	BCC vwf_end_s5_jp
	PHK
	PEA vwf_end_s5_r-1
	PEA $EC62
	LDA $7E29D9
	AND #$01FF
	JML $C0A5E4

vwf_end_s5_r:
	REP #$30
	LDA $7E29D9
	DEC
	STA $7E29D9
	LDA $7E29E3
	DEC
	STA $7E29E3
	JML $C0A5DD

vwf_end_s5_jp:
	LDA $7E29D9
	AND #$01FF
	JML $C0A5A3

vwf_end_s6:
	JSR vwf_end_dead
	BCC vwf_end_s6_jp
	PHK
	PEA vwf_end_s6_r-1
	PEA $EC62
	LDA $7E29D9
	AND #$01FF
	JML $C0A5A3

vwf_end_s6_r:
	REP #$30
	LDA $7E29D9
	INC
	STA $7E29D9
	LDA $7E29E3
	INC
	STA $7E29E3
	JML $C0A5DD

vwf_end_s6_jp:
	LDA $7E29D9
	AND #$01FF
	JML $C0A5E4
	
item_table:
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
	
make_item:
	PHP
	REP #$30
	LDA.l $7E0000+{gengo}
	AND #$00FF
	BEQ make_item_end
	LDA $3122
	AND #{press_startup}
	CMP #{press_startup}
	BNE make_item_l
	LDA {pad_old}
	AND #{press_startup}
	CMP #{press_startup}
	BEQ make_item_end
	LDA #$0001
	BRA make_item_go

make_item_l:
	LDA $3122
	AND #{press_startdown}
	CMP #{press_startdown}
	BNE make_item_end
	LDA {pad_old}
	AND #{press_startdown}
	CMP #{press_startdown}
	BEQ make_item_end
	LDA #$FFFF
make_item_go:
	PHA
	PHX
	SEP #$20
	LDA $5F83,y
	LDX #$0000
make_item_find:
	CMP.l item_table,x
	BEQ make_item_found
	INX
	CPX #$0020
	BCC make_item_find
	LDX #$0000
make_item_found:
	REP #$20
	TXA
	CLC
	ADC $03,s
	AND #$001F
	TAX
	SEP #$20
	LDA.l item_table,x
	STA $5F83,y
	REP #$20
	PLX
	PLA
make_item_end:
	PLP
	JMP make_class

make_pad:
	LDA $7E3122
	STA {pad_old}
	LDA $004218
	STA $7E3122
	RTL

display_near:
	PHP
	PHB
	SEP #$20
	REP #$10
	LDA #$00
	PHA
	PLB
	LDX #$0000
	JSR ishi_show
	JSR ishi_fadein
	JSR ishi_spc_up
	JSR ishi_fadeout
	LDX #$0009
	JSR ishi_show
	LDA #$5A
	STA $2141
	LDA #$A5
	STA $2140
	JSR ishi_fadein
	LDA #$C0
	JSL $C0ED81
	REP #$20
-
	LDA $2140
	CMP #$BBAA
	BNE -
	SEP #$20
	JSL $C0ED62
	JSR ishi_fade
	JSR gs_select
	JSR vn_scr
	JSL $C0ED42
	STZ $4200
	STZ $212C
	STZ $2105
	STZ $2107
	STZ $2109
	STZ $210B
	STZ $210D
	STZ $210D
	STZ $210E
	STZ $210E
	STZ $2101
	STZ $2111
	STZ $2111
	PLB
	PLP
	RTL

ishi_show:
	JSL $C0ED42
	STZ $420C
	LDA #$01
	STA $2105
	STZ $2106
	LDA #$7C
	STA $2109
	STZ $210C
	STZ $2111
	STZ $2111
	LDA #$FF
	STA $2112
	LDA #$03
	STA $2112
	LDA #$04
	STA $212C
	STZ $212D
	STZ $2124
	STZ $212E
	STZ $212F
	STZ $2130
	STZ $2131
	STZ $2133
	LDA #$80
	STA $2115
	LDA #$01
	STA $4300
	LDA #$18
	STA $4301
	LDA.l ishi_tbl+8,x
	STA $4304
	LDY #$0000
	STY $2116
	REP #$20
	LDA.l ishi_tbl,x
	STA $4302
	LDA.l ishi_tbl+2,x
	SEC
	SBC.l ishi_tbl,x
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	LDY #$7C00
	STY $2116
	REP #$20
	LDA.l ishi_tbl+2,x
	STA $4302
	LDA.l ishi_tbl+4,x
	SEC
	SBC.l ishi_tbl+2,x
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	STZ $2121
	STZ $4300
	LDA #$22
	STA $4301
	REP #$20
	LDA.l ishi_tbl+4,x
	STA $4302
	LDA.l ishi_tbl+6,x
	SEC
	SBC.l ishi_tbl+4,x
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	RTS

ishi_fadein:
	LDA #$81
	STA $4200
	JSL $C0ED4F
	JSR ishi_fade
	RTS

ishi_fadeout:
	LDA #$C0
	JSL $C0ED81
	JSL $C0ED62
	JSR ishi_fade
	RTS

ishi_spc_up:
	REP #$20
-
	LDA $2140
	CMP #$BBAA
	BNE -
	SEP #$20
	LDY #$0200
	STY $2142
	LDA #$01
	STA $2141
	LDA #$CC
	STA $2140
-
	CMP $2140
	BNE -
	LDX #$0000
ishi_su1:
	LDA.l ishi_spc,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #ishi_spc_end-ishi_spc
	BNE ishi_su1
	LDY #$0400
	STY $2142
	LDY #$0001
	JSR ishi_kick
	LDX #$0000
ishi_su2:
	LDA.l ishibune,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #ishibune_end-ishibune
	BNE ishi_su2
	LDY #$0200
	STY $2142
	LDY #$0000
	JSR ishi_kick
	RTS

ishi_kick:
	TYA
	STA $2141
	TXA
	INC
	BNE +
	INC
+
	STA $2140
-
	CMP $2140
	BNE -
	RTS

ishi_fade:
	LDA #$00
	JSL $C0ED81
	JSL $C0ED6F
	BCS ishi_fade
	RTS

ishi_tbl:
	dw ishi1_chr, ishi1_map, ishi1_pal, ishi1_end
	db ishi1_chr>>16
	dw ishi2_chr, ishi2_map, ishi2_pal, ishi2_end
	db ishi2_chr>>16

gs_select:
	JSL $C0ED42
	JSR gs_spc_up
	LDA #$80
	STA $2115
	LDA #$09
	STA $4300
	LDA #$18
	STA $4301
	LDA.b #gs_zero>>16
	STA $4304
	LDX.w #gs_zero
	STX $4302
	LDX #$0000
	STX $2116
	STX $4305
	LDA #$01
	STA $420B
	STZ $2115
	LDA #$08
	STA $4300
	LDX.w #gs_ff
	STX $4302
	LDX #$7C00
	STX $2116
	LDX #$0400
	STX $4305
	LDA #$01
	STA $420B
	LDA #$80
	STA $2115
	LDA #$01
	STA $4300
	LDA.b #gengo_chr>>16
	STA $4304
	LDX #$0000
	STX $2116
	LDX.w #gengo_chr
	STX $4302
	LDX.w #gengo_map-gengo_chr
	STX $4305
	LDA #$01
	STA $420B
	LDX #$7D60
	STX $2116
	LDX.w #gengo_map
	STX $4302
	LDX.w #336
	STX $4305
	LDA #$01
	STA $420B
	LDX #$0000
	JSR gs_obj_up
	LDX #$0040
	JSR gs_obj_up
	LDX #$0020
	JSR gs_obj_up
	LDX #$0060
	JSR gs_obj_up
	STZ $4300
	LDA #$22
	STA $4301
	LDA #$00
	STA $2121
	JSR gs_pal_up
	LDA #$80
	STA $2121
	LDA.b #cursor_pal>>16
	STA $4304
	LDX.w #cursor_pal
	STX $4302
	LDX.w #gengo_pal-cursor_pal
	STX $4305
	LDA #$01
	STA $420B
	STZ $2102
	STZ $2103
	LDX #$0000
-
	STZ $2104
	LDA #$F0
	STA $2104
	STZ $2104
	STZ $2104
	INX
	CPX #$0080
	BNE -
	LDA #$02
	STA $2104
	LDX #$0001
-
	STZ $2104
	INX
	CPX #$0020
	BNE -
	LDA #$03
	STA $2101
	LDA #$01
	STA $2105
	STZ $2106
	LDA #$7C
	STA $2109
	STZ $210C
	LDA #$A0
	STA $2111
	LDA #$03
	STA $2111
	LDA #$FF
	STA $2112
	LDA #$03
	STA $2112
	LDA #$14
	STA $212C
	STZ $212D
	STZ $2123
	STZ $2124
	STZ $2125
	STZ $212E
	STZ $212F
	STZ $2130
	STZ $2131
	STZ $2133
	REP #$20
	STZ {gs_idx}
	STZ {gs_cnt}
	STZ {gs_clk}
	LDA #$FFFF
	STA {gs_pad}
	SEP #$20
	JSR gs_oam
	JSR ishi_fadein
gs_loop:
	LDA #$00
	JSL $C0ED81
	JSR gs_oam
-
	LDA $4212
	LSR
	BCS -
	REP #$20
	LDA $4218
	PHA
	EOR {gs_pad}
	AND $01,s
	TAY
	PLA
	STA {gs_pad}
	TYA
	BIT #$0080
	BNE gs_ok
	BIT #$0800
	BNE gs_up
	BIT #$0400
	BNE gs_down
	SEP #$20
	BRA gs_loop

gs_up:
	SEP #$20
	LDA {gs_idx}
	DEC
	BPL +
	LDA #$02
+
	STA {gs_idx}
	JSR gs_click
	BRA gs_loop

gs_down:
	SEP #$20
	LDA {gs_idx}
	INC
	CMP #$03
	BCC +
	LDA #$00
+
	STA {gs_idx}
	JSR gs_click
	BRA gs_loop

gs_ok:
	SEP #$20
	LDX {gs_idx}
	LDA.l gs_lang,x
	AND #$07
	STA {gengo}
	LDA #$5A
	STA $2141
	LDA #$A5
	STA $2140
	JSL $C0ED62
	JSR ishi_fade
	REP #$20
-
	LDA $2140
	CMP #$BBAA
	BNE -
	SEP #$20
	LDA {gengo}
	CMP #$01
	BEQ +
	JSR vn_drv_init
+
	RTS

vn_drv_init:
	PHB
	LDA #$7E
	PHA
	PLB
	JSL $C0FDE9
	PLB
	RTS

gs_spc_up:
	REP #$20
-
	LDA $2140
	CMP #$BBAA
	BNE -
	SEP #$20
	LDY #$0200
	STY $2142
	LDA #$01
	STA $2141
	LDA #$CC
	STA $2140
-
	CMP $2140
	BNE -
	LDX #$0000
gs_su1:
	LDA.l ken_spc,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #ken_spc_end-ken_spc
	BNE gs_su1
	LDY #$0400
	STY $2142
	LDY #$0001
	JSR ishi_kick
	LDX #$0000
gs_su2:
	LDA.l sel_brr,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #sel_brr_end-sel_brr
	BNE gs_su2
	LDY #$1700
	STY $2142
	LDY #$0001
	JSR ishi_kick
	LDX #$0000
gs_su3:
	LDA.l click_brr,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #click_brr_end-click_brr
	BNE gs_su3
	LDY #$0200
	STY $2142
	LDY #$0000
	JSR ishi_kick
	STZ $2140
	RTS

gs_click:
	LDA #$C1
	STA $2141
	INC {gs_clk}
	LDA {gs_clk}
	STA $2140
	RTS

gs_oam:
	STZ $2102
	STZ $2103
	LDX {gs_cnt}
	LDA.l gs_sway,x
	CLC
	ADC #$48
	STA $2104
	LDX {gs_idx}
	LDA.l gs_ypos,x
	STA $2104
	STZ $2104
	LDA #$30
	STA $2104
	LDA {gs_cnt}
	INC
	CMP #$18
	BCC +
	LDA #$00
+
	STA {gs_cnt}
	RTS

gs_obj_up:
	REP #$20
	TXA
	ASL #2
	CLC
	ADC #$6000
	CPX #$0020
	BNE +
	LDA #$6100
+
	CPX #$0040
	BNE +
	LDA #$6010
+
	CPX #$0060
	BNE +
	LDA #$6110
+
	STA $2116
	TXA
	CLC
	ADC.w #cursor_chr
	STA $4302
	LDA #$0020
	STA $4305
	SEP #$20
	LDA.b #cursor_chr>>16
	STA $4304
	LDA #$01
	STA $4300
	LDA #$18
	STA $4301
	LDA #$01
	STA $420B
	RTS

gs_pal_up:
	LDA.b #gengo_pal>>16
	STA $4304
	LDX.w #gengo_pal
	STX $4302
	LDX.w #gengo_chr-gengo_pal
	STX $4305
	LDA #$01
	STA $420B
	RTS

gs_zero:
	db $00
gs_ff:
	db $FF
gs_lang:
	db $01, $00, $02
gs_ypos:
	db $59, $69, $79
gs_sway:
	db $00, $00, $00, $01, $01, $01, $02, $02, $02, $01, $01, $01
	db $00, $00, $00, $FF, $FF, $FF, $FE, $FE, $FE, $FF, $FF, $FF

vn_scr:
	LDA {gengo}
	CMP #$01
	BEQ +
	RTS
+
	JSL $C0ED42
	JSR vn_spc_up
	LDA #$80
	STA $2115
	LDA #$09
	STA $4300
	LDA #$18
	STA $4301
	LDA.b #gs_zero>>16
	STA $4304
	LDX.w #gs_zero
	STX $4302
	LDX #$0000
	STX $2116
	STX $4305
	LDA #$01
	STA $420B
	LDA #$01
	STA $4300
	LDA.b #waku_chr>>16
	STA $4304
	LDX.w #waku_chr
	STX $4302
	LDX.w #waku_chr_end-waku_chr
	STX $4305
	LDX #$0000
	STX $2116
	LDA #$01
	STA $420B
	LDA.b #sigurd_chr>>16
	STA $4304
	LDX.w #sigurd_chr
	STX $4302
	LDX.w #sigurd_chr_end-sigurd_chr
	STX $4305
	LDX #$6000
	STX $2116
	LDA #$01
	STA $420B
	STZ $4300
	LDA #$22
	STA $4301
	STZ $2121
	LDA.b #waku_pal>>16
	STA $4304
	LDX.w #waku_pal
	STX $4302
	LDX #$0020
	STX $4305
	LDA #$01
	STA $420B
	LDA #$80
	STA $2121
	LDA.b #sigurd_pal>>16
	STA $4304
	LDX.w #sigurd_pal
	STX $4302
	LDX #$0020
	STX $4305
	LDA #$01
	STA $420B
	STZ $2121
	LDA.b #{vn_bg}
	STA $2122
	LDA.b #{vn_bg}>>8
	STA $2122
	STZ $2102
	STZ $2103
	LDX #$0000
-
	LDA.l sigurd_oam,x
	STA $2104
	INX
	CPX #$0030
	BNE -
	LDX #$000C
-
	STZ $2104
	LDA #$F0
	STA $2104
	STZ $2104
	STZ $2104
	INX
	CPX #$0080
	BNE -
	LDA #$AA
	STA $2104
	STA $2104
	STA $2104
	LDX #$0003
-
	STZ $2104
	INX
	CPX #$0020
	BNE -
	REP #$30
	LDA #$79E1
	STA $2116
	LDA #$0002
	LDX #$0003
	LDY #$4002
	JSR vn_row
	LDA #$7A01
vn_scr_mid:
	PHA
	STA $2116
	LDA #$0004
	LDX #$0001
	LDY #$4004
	JSR vn_row
	PLA
	CLC
	ADC #$0020
	CMP #$7B41
	BNE vn_scr_mid
	STA $2116
	LDA #$8002
	LDX #$8003
	LDY #$C002
	JSR vn_row
	SEP #$20
	LDA #$09
	STA $2105
	STZ $2106
	LDA #$78
	STA $2107
	LDA #$7C
	STA $2109
	STZ $210B
	LDA #$02
	STA $210C
	STZ $210D
	STZ $210D
	LDA #$FF
	STA $210E
	LDA #$03
	STA $210E
	STZ $2111
	STZ $2111
	LDA #$FF
	STA $2112
	LDA #$03
	STA $2112
	LDA #$03
	STA $2101
	LDA #$15
	STA $212C
	STZ $212D
	STZ $2123
	STZ $2124
	STZ $2125
	STZ $212E
	STZ $212F
	STZ $2130
	STZ $2131
	STZ $2133
	PHD
	REP #$20
	LDA #$1F00
	TCD
	SEP #$20
	STZ $4300
	LDA #$22
	STA $4301
	LDA #$10
	STA $2121
	LDA.b #serifu_pal>>16
	STA $4304
	LDX.w #serifu_pal
	STX $4302
	LDX #$0008
	STX $4305
	LDA #$01
	STA $420B
	REP #$30
	JSR vn_txt_init
	SEP #$20
	JSR ishi_fadein
	REP #$30
	JSR vn_txt_run
	SEP #$20
	JSL $C0ED62
	JSR ishi_fade
	LDA #$EE
	STA $2141
	REP #$20
-
	LDA $2140
	CMP #$BBAA
	BNE -
	SEP #$20
	JSR vn_drv_init
	REP #$30
	LDA #$0000
	LDX #$0000
-
	STA $7F8000,x
	INX
	INX
	CPX #$0680
	BNE -
	LDX #$00D6
-
	STA $7E1F00,x
	INX
	INX
	CPX #$0100
	BNE -
	SEP #$20
	PLD
	RTS

vn_txt_init:
	LDA.w #serifu
	STA {vn_t}
	SEP #$20
	LDA.b #serifu>>16
	STA {vn_t2}
	REP #$20
	STZ {vn_d}
	STZ {vn_pen}
	STZ {vn_row}
	STZ {vn_top}
	STZ {vn_mode}
	STZ {vn_k}
	STZ {vn_bl}
	LDA #$0002
	STA {vn_bc}
	LDA #$0008
	STA {vn_m}
	LDA #$FFFF
	STA {vn_dc}
	STA {vn_pad}
	JSR vn_buf_clr
	JSR vn_map_build
	LDA #$0005
	STA {vn_fl}
	JSR vn_vb
	RTS

vn_txt_run:
	SEP #$20
	LDA #$00
	JSL $C0ED81
	REP #$30
	JSR vn_vb
	JSR vn_pad_rd
	BIT #$1000
	BNE vn_txt_done
	LDY {vn_mode}
	BEQ vn_txt_type
	BIT #$0080
	BEQ vn_txt_run
	CPY #$0002
	BEQ vn_txt_done
	STZ {vn_mode}
	STZ {vn_top}
	STZ {vn_row}
	STZ {vn_pen}
	JSR vn_buf_clr
	JSR vn_map_build
	LDA #$0005
	TSB {vn_fl}
	BRA vn_txt_run

vn_txt_type:
	JSR vn_mo_tick
	JSR vn_step
	BRA vn_txt_run

vn_txt_done:
	RTS

vn_pad_rd:
	SEP #$20
-
	LDA $4212
	LSR
	BCS -
	REP #$20
	LDA $4218
	PHA
	EOR {vn_pad}
	AND $01,s
	TAY
	PLA
	STA {vn_pad}
	TYA
	RTS

vn_getc:
	SEP #$20
	LDA [{vn_t}]
	REP #$20
	AND #$00FF
	INC {vn_t}
	BNE +
	INC {vn_t2}
+
	RTS

vn_step:
	JSR vn_getc
	CMP #$0000
	BNE vn_s_1
	LDA {vn_d}
	BEQ vn_s_end
	STZ {vn_d}
	LDA {vn_r}
	STA {vn_t}
	SEP #$20
	LDA {vn_r2}
	STA {vn_t2}
	REP #$20
	BRA vn_step

vn_s_end:
	JSR vn_mo_shut
	LDA #$0002
	STA {vn_mode}
	RTS

vn_s_1:
	CMP #$0001
	BNE vn_s_4
	JSR vn_mo_shut
	LDA #$0001
	STA {vn_mode}
	RTS

vn_s_4:
	CMP #$0004
	BNE vn_s_ctl
	JMP vn_newline

vn_s_ctl:
	CMP #$0010
	BCS vn_s_f0
	CMP #$0006
	BCS vn_s_dict
	JSR vn_getc
	BRA vn_step

vn_s_dict:
	SEC
	SBC #$0006
	STA {vn_w}
	ASL
	CLC
	ADC {vn_w}
	TAX
	LDA.l vwf_dict_ptr,x
	STA {vn_g}
	SEP #$20
	LDA.l vwf_dict_ptr+2,x
	STA {vn_g2}
	REP #$20
	JMP vn_push

vn_s_f0:
	CMP #$00F0
	BNE vn_s_chr
	JSR vn_getc
	STA {vn_w}
	ASL
	CLC
	ADC {vn_w}
	TAX
	LDA.l dictF0,x
	CLC
	ADC.w #dictF0
	STA {vn_g}
	SEP #$20
	LDA.b #dictF0>>16
	ADC #$00
	STA {vn_g2}
	REP #$20
	JMP vn_push

vn_s_chr:
	CMP #$00AE
	BCC vn_glyph
	CMP #$00FB
	BCC +
	CMP #$00FD
	BCS +
	JSR vn_getc
+
	JMP vn_step

vn_push:
	LDA {vn_t}
	STA {vn_r}
	SEP #$20
	LDA {vn_t2}
	STA {vn_r2}
	REP #$20
	LDA {vn_g}
	STA {vn_t}
	SEP #$20
	LDA {vn_g2}
	STA {vn_t2}
	REP #$20
	LDA #$0001
	STA {vn_d}
	JMP vn_step

vn_glyph:
	JSR vn_blip
	CMP #$0060
	BCS vn_g_b
	SEC
	SBC #$0010
	TAX
	LDA.l font1a_width,x
	AND #$00FF
	STA {vn_w}
	TXA
	ASL #6
	CLC
	ADC.w #font1a
	STA {vn_g}
	SEP #$20
	LDA.b #font1a>>16
	STA {vn_g2}
	REP #$20
	BRA vn_g_go

vn_g_b:
	SEC
	SBC #$0060
	TAX
	LDA.l font1b_width,x
	AND #$00FF
	STA {vn_w}
	TXA
	ASL #6
	CLC
	ADC.w #font1b
	STA {vn_g}
	SEP #$20
	LDA.b #font1b>>16
	STA {vn_g2}
	REP #$20
vn_g_go:
	LDA {vn_pen}
	AND #$0007
	ASL
	TAX
	LDA.l vwf_shift,x
	CLC
	ADC {vn_g}
	STA {vn_g}
	LDA {vn_pen}
	LSR #3
	CMP #$0019
	BCS vn_g_skip
	STA {vn_dc}
	ASL #5
	TAX
	LDY #$0000
-
	LDA [{vn_g}],y
	ORA $7F8000,x
	STA $7F8000,x
	INX
	INX
	INY
	INY
	CPY #$0040
	BNE -
vn_g_skip:
	LDA {vn_pen}
	CLC
	ADC {vn_w}
	STA {vn_pen}
	RTS

vn_newline:
	STZ {vn_pen}
	JSR vn_buf_clr
	LDA {vn_row}
	CMP #$0004
	BCS vn_nl_scroll
	INC {vn_row}
	RTS

vn_nl_scroll:
	LDA {vn_top}
	STA {vn_clb}
	INC
	CMP #$0005
	BCC +
	LDA #$0000
+
	STA {vn_top}
	JSR vn_map_build
	LDA #$0003
	TSB {vn_fl}
	RTS

vn_buf_clr:
	LDA #$0000
	LDX #$0000
-
	STA $7F8000,x
	INX
	INX
	CPX #$0360
	BNE -
	RTS

vn_map_build:
	LDA {vn_top}
	STA {vn_w}
	LDX #$0000
vn_mb_r:
	PHX
	LDA {vn_w}
	ASL
	TAX
	LDA.l vn_blk_t,x
	ORA #$3000
	STA {vn_g}
	PLX
	LDY #$0000
vn_mb_c:
	LDA #$0000
	CPY #$0002
	BCC +
	CPY #$001C
	BCS +
	LDA {vn_g}
	INC {vn_g}
	INC {vn_g}
+
	STA $7F8400,x
	CMP #$0000
	BEQ +
	INC
+
	STA $7F8440,x
	INX
	INX
	INY
	CPY #$0020
	BNE vn_mb_c
	TXA
	CLC
	ADC #$0040
	TAX
	LDA {vn_w}
	INC
	CMP #$0005
	BCC +
	LDA #$0000
+
	STA {vn_w}
	CPX #$0280
	BNE vn_mb_r
	RTS

vn_vb:
	SEP #$20
	LDA #$0E
	STA $2102
	STZ $2103
	LDA.l sigurd_oam+28
	STA $2104
	LDA.l sigurd_oam+29
	STA $2104
	LDA {vn_m}
	STA $2104
	LDA.l sigurd_oam+31
	STA $2104
	LDA #$80
	STA $2115
	LDA.b #gs_zero>>16
	STA $4304
	REP #$20
	LDA {vn_fl}
	BIT #$0004
	BEQ +
	LDA #$2008
	STA $2116
	LDA #$1809
	STA $4300
	LDA.w #gs_zero
	STA $4302
	LDA #$10E0
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	REP #$20
+
	LDA {vn_fl}
	BIT #$0002
	BEQ +
	LDA {vn_clb}
	ASL
	TAX
	LDA.l vn_blk_v,x
	STA $2116
	LDA #$1809
	STA $4300
	LDA.w #gs_zero
	STA $4302
	LDA #$0360
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	REP #$20
+
	SEP #$20
	LDA #$7F
	STA $4304
	REP #$20
	LDA {vn_fl}
	BIT #$0001
	BEQ +
	LDA #$7E00
	STA $2116
	LDA #$1801
	STA $4300
	LDA #$8400
	STA $4302
	LDA #$0280
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	REP #$20
+
	STZ {vn_fl}
	LDA {vn_dc}
	BMI vn_vb_end
	PHA
	LDA {vn_row}
	CLC
	ADC {vn_top}
	CMP #$0005
	BCC +
	SBC #$0005
+
	ASL
	TAX
	PLA
	PHA
	ASL #4
	CLC
	ADC.l vn_blk_v,x
	STA $2116
	PLA
	ASL #5
	CLC
	ADC #$8000
	STA $4302
	LDA #$1801
	STA $4300
	LDA #$0040
	STA $4305
	SEP #$20
	LDA #$01
	STA $420B
	REP #$20
	LDA #$FFFF
	STA {vn_dc}
vn_vb_end:
	RTS

vn_blip:
	CMP #$004F
	BEQ vn_bl_end
	PHA
	INC {vn_bc}
	LDA {vn_bc}
	CMP #$0003
	BCC vn_bl_pop
	STZ {vn_bc}
	SEP #$20
	INC {vn_bl}
	LDA {vn_bl}
	STA $2140
	REP #$20
vn_bl_pop:
	PLA
vn_bl_end:
	RTS

vn_spc_up:
	REP #$20
-
	LDA $2140
	CMP #$BBAA
	BNE -
	SEP #$20
	LDY #$0200
	STY $2142
	LDA #$01
	STA $2141
	LDA #$CC
	STA $2140
-
	CMP $2140
	BNE -
	LDX #$0000
vn_su1:
	LDA.l blip_spc,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #blip_spc_end-blip_spc
	BNE vn_su1
	LDY #$0400
	STY $2142
	LDY #$0001
	JSR ishi_kick
	LDX #$0000
vn_su2:
	LDA.l blip_brr,x
	STA $2141
	TXA
	STA $2140
-
	CMP $2140
	BNE -
	INX
	CPX.w #blip_brr_end-blip_brr
	BNE vn_su2
	LDY #$0200
	STY $2142
	LDY #$0000
	JSR ishi_kick
	STZ $2140
	RTS

vn_mo_tick:
	INC {vn_c}
	LDA {vn_c}
	CMP #$0005
	BCC vn_mo_end
	STZ {vn_c}
	LDA {vn_k}
	INC
	AND #$0003
	STA {vn_k}
	ASL
	TAX
	LDA.l vn_mo_tbl,x
	STA {vn_m}
vn_mo_end:
	RTS

vn_mo_tbl:
	dw $0008, $000E, $002E, $000E

vn_mo_shut:
	STZ {vn_k}
	STZ {vn_c}
	PHA
	LDA #$0008
	STA {vn_m}
	PLA
	RTS

vn_blk_t:
	dw $0001, $0037, $006D, $00A3, $00D9

vn_blk_v:
	dw $2008, $21B8, $2368, $2518, $26C8

vn_row:
	STA $2118
	TXA
	LDX #$001C
-
	STA $2118
	DEX
	BNE -
	TYA
	STA $2118
	RTS

sigurd_oam:
	db $C8, $37, $00, $30
	db $D8, $37, $02, $30
	db $E8, $37, $04, $30
	db $C8, $47, $20, $30
	db $D8, $47, $22, $30
	db $E8, $47, $24, $30
	db $C8, $57, $06, $30
	db $D8, $57, $08, $30
	db $E8, $57, $0A, $30
	db $C8, $67, $26, $30
	db $D8, $67, $28, $30
	db $E8, $67, $2A, $30

serifu_pal:
	dw $0000, $3344, $001F, $7FFF
	
vwf_pop_icon:
	PHA
	LDA.l $7E0000+{gengo}
	BNE vwf_pop_icon_vn
	PLA
	LDX #$03C8
	PHK
	PEA vwf_pop_icon_r-1
	PEA $EC62
	JML $C0DCF1

vwf_pop_icon_r:
	RTL

vwf_pop_icon_vn:
	PLA
	RTL

vwf_xs:
	PHP
	REP #$30
	LDX #$0000
vwf_xs_l:
	LDA $48EB,x
	STA {xl_save},x
	INX #2
	CPX #$0100
	BCC vwf_xs_l
	STZ {xl_on}
	PLP
	PHK
	PEA vwf_xs_r-1
	PEA $EC62
	JML $C0D3F0

vwf_xs_r:
	LDA #$00
	RTL

vwf_xl:
	LDY #$01C2
	PHK
	PEA vwf_xl_r-1
	PEA $EC62
	JML $C0DA0B

vwf_xl_r:
	PHP
	REP #$30
	LDA.l $7E0000+{gengo}
	AND #$00FF
	BNE vwf_xl_g1
	JMP vwf_xl_end

vwf_xl_g1:
	LDA {vwf_ctx}
	BEQ vwf_xl_g2
	JMP vwf_xl_end

vwf_xl_g2:
	LDA $2022
	AND #$0001
	TAX
	LDA $2024,x
	AND #$00FF
	STA {xl_t}
	ASL #2
	CLC
	ADC {xl_t}
	ASL #3
	TAX
	STZ {xl_n}
	STZ {xl_pg}
	LDA #$43C1
	STA {xl_r}
	LDA #$0010
	STA {xl_k}
vwf_xl_scan:
	LDA $0608,x
	CMP #$FFFF
	BEQ vwf_xl_skip
	PHX
	PHA
	LDA {xl_n}
	ASL
	TAX
	PLA
	STA {xl_list},x
	LDA {xl_n}
	ASL #2
	CLC
	ADC {xl_n}
	ASL #3
	TAX
	LDY {xl_r}
	LDA #$0014
	STA {xl_m}
vwf_xl_cp:
	LDA $0000,y
	STA {xl_stat},x
	INX #2
	INY #2
	DEC {xl_m}
	BNE vwf_xl_cp
	INC {xl_n}
	PLX
vwf_xl_skip:
	INX #2
	LDA {xl_r}
	CLC
	ADC #$0040
	STA {xl_r}
	DEC {xl_k}
	BNE vwf_xl_scan
	LDA {xl_n}
	BEQ vwf_xl_end
	LDX #$0000
vwf_xl_np:
	INX
	SEC
	SBC #$0007
	BEQ vwf_xl_npd
	BCS vwf_xl_np
vwf_xl_npd:
	STX {xl_np}
	LDA #$0001
	STA {xl_on}
	STA {xl_pend}
	JSR vwf_xl_bg3
	JSR vwf_xp
vwf_xl_end:
	PLP
	RTL

vwf_xl_bg3:
	JSR vwf_nohide_on
	JSR vwf_vram_on
	SEP #$20
	LDA #$80
	STA $002115
	LDA #$09
	STA $004300
	LDA #$18
	STA $004301
	LDA.b #vwf_xz>>16
	STA $004304
	REP #$20
	LDA.w #vwf_xz
	STA $004302
	LDA #$0640
	STA $004305
	LDA #$28A0
	STA $002116
	SEP #$20
	LDA #$01
	STA $00420B
	REP #$20
	JSR vwf_vram_off
	JSR vwf_nohide_off
	RTS

vwf_xz:
	dw $0000

vwf_xp:
	LDX #$0180
vwf_xp_cl:
	TXA
	AND #$003E
	BEQ vwf_xp_cn
	CMP #$003E
	BEQ vwf_xp_cn
	LDA #$2020
	STA $41EB,x
vwf_xp_cn:
	INX #2
	CPX #$0740
	BCC vwf_xp_cl
	LDX #$0000
vwf_xp_hd:
	LDA.l vwf_xp_hdt,x
	BEQ vwf_xp_hde
	TAY
	LDA.l vwf_xp_hdt+2,x
	STA $41EB,y
	INX #4
	BRA vwf_xp_hd

vwf_xp_hde:
	JSR vwf_xp_cnt
	STZ {xl_k}
vwf_xp_mem:
	LDA {xl_k}
	CMP {xl_c}
	BCC vwf_xp_mgo
	JMP vwf_xp_done

vwf_xp_mgo:
	JSR vwf_xp_row
	LDA {xl_m}
	CLC
	ADC {xl_k}
	STA {xl_t}
	ASL #2
	CLC
	ADC {xl_t}
	ASL #3
	TAX
	LDA {xl_r}
	INC #2
	ASL #6
	CLC
	ADC #$0016
	TAY
	LDA #$0014
	STA {xl_t}
vwf_xp_cp:
	LDA {xl_stat},x
	STA $41EB,y
	INX #2
	INY #2
	DEC {xl_t}
	BNE vwf_xp_cp
	INC {xl_k}
	BRA vwf_xp_mem

vwf_xp_cnt:
	LDA {xl_pg}
	ASL #3
	SEC
	SBC {xl_pg}
	STA {xl_m}
	LDA {xl_n}
	SEC
	SBC {xl_m}
	CMP #$0007
	BCC vwf_xp_cnt_s
	LDA #$0007
vwf_xp_cnt_s:
	STA {xl_c}
	RTS

vwf_xp_row:
	LDA {xl_k}
	ASL
	CLC
	ADC {xl_k}
	ADC #$0007
	STA {xl_r}
	RTS

vwf_xn:
	JSR vwf_xp_cnt
	STZ {xl_k}
vwf_xn_mem:
	LDA {xl_k}
	CMP {xl_c}
	BCC vwf_xn_go
	RTS

vwf_xn_go:
	JSR vwf_xp_row
	LDA {xl_m}
	CLC
	ADC {xl_k}
	STA {xl_t}
	ASL
	TAX
	LDA {xl_list},x
	STA {vwf_nameid}
	JSR vwf_name_tp
	LDA #$0009
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDA {xl_k}
	ASL
	TAX
	LDA.l vwf_xp_tl,x
	TAX
	LDA {xl_r}
	ASL #6
	CLC
	ADC #$0002
	JSR vwf_name_vwf
	LDA {xl_t}
	ASL
	TAX
	LDA {xl_list},x
	ASL #3
	TAX
	LDA $1006,x
	AND #$00FF
	STA {vwf_tmp}
	ASL
	CLC
	ADC {vwf_tmp}
	JSR vwf_lg_0E
	NOP
	BCS vwf_xn_next
	TAX
	JSR vwf_lg_0F
	NOP
	CLC
	JSR vwf_lg_10
	STA {vwf_tptr}
	JSR vwf_lg_11
	ADC #$0000
	STA {vwf_tbank}
	LDA #$000A
	STA {vwf_ncols}
	LDA #$0000
	STA {vwf_font}
	LDA {xl_k}
	ASL
	TAX
	LDA.l vwf_xp_tl,x
	CLC
	ADC #$0012
	TAX
	LDA {xl_r}
	ASL #6
	CLC
	ADC #$0018
	JSR vwf_name_vwf
vwf_xn_next:
	INC {xl_k}
	JMP vwf_xn_mem

vwf_xp_done:
	LDA {xl_np}
	CMP #$0002
	BCC vwf_xp_end
	LDA {xl_pg}
	CLC
	ADC #$20E1
	STA $436F
	LDA #$202F
	STA $4371
	LDA {xl_np}
	CLC
	ADC #$20E0
	STA $4373
vwf_xp_end:
	RTS

vwf_xp_tl:
	dw $01A0, $01C6, $01EC, $0212, $0238, $0124, $014A

vwf_xp_hdt:
	dw $0196, $2505, $0198, $2506, $019A, $2500, $019C, $2507
	dw $01A0, $2508, $01A2, $2500, $01A4, $2509
	dw $01A8, $250A, $01AA, $2500, $01AC, $250B
	dw $01B0, $250C, $01B2, $2500, $01B4, $250D
	dw $01B6, $250E, $01B8, $250F, $0000

vwf_xw:
	PHP
	REP #$30
	LDA {xl_on}
	BEQ vwf_xw_jp
	LDA {xl_pend}
	BEQ vwf_xw_np
	STZ {xl_pend}
	JSR vwf_xn
vwf_xw_np:
	LDA {xl_np}
	CMP #$0002
	BCC vwf_xw_jp
vwf_xw_l:
	JSL $C0FEE4
	BIT $4152
	BNE vwf_xw_x
	BIT $4150
	BNE vwf_xw_x
	BIT #$0500
	BNE vwf_xw_nx
	BIT #$0A00
	BNE vwf_xw_pv
	BRA vwf_xw_l

vwf_xw_nx:
	LDA {xl_pg}
	INC
	CMP {xl_np}
	BCC vwf_xw_go
	LDA #$0000
	BRA vwf_xw_go

vwf_xw_pv:
	LDA {xl_pg}
	BNE vwf_xw_pv1
	LDA {xl_np}
vwf_xw_pv1:
	DEC
vwf_xw_go:
	STA {xl_pg}
	JSR vwf_xl_bg3
	JSR vwf_xp
	SEP #$20
	LDA #$00
	JSL $C0ED81
	JSL $C0ED42
	JSL $C10E3A
	JSL $C0ED33
	REP #$30
	JSR vwf_xn
	BRA vwf_xw_l

vwf_xw_x:
	SEP #$30
	LDX #$04
	JSL $C10B90
	PLP
	RTL

vwf_xw_jp:
	PLP
vwf_xw_jl:
	LDA #$00
	JSL $C1092F
	BCC vwf_xw_jl
	RTL

vwf_xc:
	PHP
	REP #$30
	LDX #$0000
vwf_xc_l:
	LDA {xl_save},x
	STA $48EB,x
	INX #2
	CPX #$0100
	BCC vwf_xc_l
	LDA {xl_on}
	BEQ vwf_xc_end
	STZ {xl_on}
	LDX #$0000
	JSR vwf_xc_win
	LDX #$0001
	JSR vwf_xc_win
vwf_xc_end:
	PLP
	LDA $2022
	JSL $C107BA
	RTL

vwf_xc_win:
	PHX
	PHK
	PEA vwf_xc_w1-1
	PEA $EC62
	JML $C0D23A

vwf_xc_w1:
	PHK
	PEA vwf_xc_w2-1
	PEA $EC62
	JML $C0E991

vwf_xc_w2:
	JSL $C0ED42
	PHK
	PEA vwf_xc_w3-1
	PEA $EC62
	JML $C0D434

vwf_xc_w3:
	JSL $C0ED33
	PLX
	RTS

vwf_xe_str:
	db $00

hakai_hdma:
	PHK
	PEA hakai_hdma_r-1
	PEA $EC62
	JML $C092A4

hakai_hdma_r:
	SEP #$20
	LDA #$00
	STA $00420C
	STA $002123
	STA $002124
	STA $002125
	STA $00212E
	STA $00212F
	LDA #$FF
	STA $002126
	LDA #$00
	STA $002127
	REP #$20
	LDA #$0000
	STA $7E313B
	PLP
	PLY
	JML $C08734

make_class:
	PHP
	REP #$30
	LDA.l $7E0000+{gengo}
	AND #$00FF
	BNE make_class_on
	JMP make_class_end

make_class_on:
	LDA $3122
	AND #{press_startright}
	CMP #{press_startright}
	BNE make_class_l
	LDA {pad_old}
	AND #{press_startright}
	CMP #{press_startright}
	BEQ make_class_end2
	LDA #$0001
	BRA make_class_go

make_class_l:
	LDA $3122
	AND #{press_startleft}
	CMP #{press_startleft}
	BNE make_class_end2
	LDA {pad_old}
	AND #{press_startleft}
	CMP #{press_startleft}
	BNE make_class_dn
make_class_end2:
	JMP make_class_end

make_class_dn:
	LDA #$FFFF
make_class_go:
	PHA
	PHX
	SEP #$20
	LDA $5F8B,y
	LDX #$0000
make_class_find:
	CMP.l class_table,x
	BEQ make_class_found
	INX
	CPX #$004B
	BCC make_class_find
	LDX #$0000
make_class_found:
	REP #$20
	TXA
	CLC
	ADC $03,s
	BPL make_class_hi
	LDA #$004A
	BRA make_class_set
make_class_hi:
	CMP #$004B
	BCC make_class_set
	LDA #$0000
make_class_set:
	TAX
	SEP #$20
	LDA.l class_table,x
	STA $5F8B,y
	PHK
	PEA make_class_r1-1
	PEA $EC62
	JML $C06EC8

make_class_r1:
	PHK
	PEA make_class_r2-1
	PEA $EC62
	JML $C06F09

make_class_r2:
	REP #$20
	PLX
	PLA
make_class_end:
	PLP
	JMP hakai_anzen

class_table:
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
	db $20, $21, $22, $23, $24, $25, $26, $27
	db $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
	db $30, $31, $32, $33, $34, $35, $36, $37
	db $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
	db $40, $41, $42, $43, $44, $45, $46, $47
	db $48, $49, $4A
