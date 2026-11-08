//###########FONT###############
org $D00000
font0a:
	incbin "FQ_Data\font0a.bin"
	
font0a_width:
	db $06, $07, $07, $07, $07, $07, $07, $07
	db $04, $07, $07, $07, $08, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $08, $07
	db $07, $07, $07, $07, $07, $06, $06, $06
	db $06, $06, $07, $04, $05, $07, $04, $08
	db $07, $07, $07, $07, $06, $06, $06, $07
	db $07, $08, $06, $07, $07, $07, $05, $04
	db $03, $06, $06, $08, $04, $04, $04, $04
	
	db $06, $04, $05, $05, $06, $05, $05, $05
	db $05, $05, $03, $06, $07, $07, $07, $07
	
font0b_width:
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $04, $04, $04, $04
	db $04, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07
	
	db $07, $07, $06, $06, $06, $06, $07, $07
	db $07, $07, $07, $05, $02, $0A, $0B, $0B
	
font1a_width:
	db $06, $06, $06, $06, $05, $05, $06, $06
	db $04, $04, $06, $06, $06, $06, $06, $06
	db $06, $06, $05, $06, $06, $06, $07, $06
	db $06, $06, $07, $06, $06, $06, $06, $06
	db $05, $06, $06, $04, $04, $05, $04, $08
	db $06, $06, $06, $06, $05, $05, $06, $06
	db $06, $07, $06, $06, $06, $06, $05, $05
	db $06, $08, $08, $08, $05, $05, $05, $04
	
	db $06, $04, $06, $06, $06, $06, $06, $06
	db $06, $06, $04, $08, $06, $06, $06, $06
	
font1b_width:
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $04, $04, $04, $04
	db $04, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $02, $0A, $0A, $0A
	
font2_width:
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $04, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $05, $06, $06
	db $05, $06, $06, $04, $05, $05, $04, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $07, $02, $02
	db $02, $05, $00, $00, $04, $03, $03, $04
	db $06, $04, $06, $06, $06, $06, $06, $06
	db $06, $06, $02, $00, $00, $00, $00, $00
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $04, $04, $04, $05
	db $04, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $07, $07, $07, $07
	db $07, $07, $06, $06, $06, $06, $06, $07
	db $07, $07, $07, $07, $07, $06, $06, $06
	db $06, $07, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $02, $00, $05
	
font3a_width:
	db $06, $06, $06, $06, $05, $05, $06, $06
	db $04, $06, $06, $05, $08, $06, $07, $06
	db $07, $06, $05, $06, $06, $06, $08, $06
	db $06, $05, $07, $06, $06, $05, $06, $06
	db $05, $06, $06, $02, $04, $05, $02, $08
	db $06, $06, $06, $06, $05, $05, $05, $06
	db $06, $08, $06, $06, $05, $07, $06, $06
	db $05, $08, $06, $08, $04, $06, $06, $04
	
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $03, $08, $06, $06, $06, $07
	
font3b_width:
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $03, $03, $04, $05
	db $04, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $06
	db $06, $06, $06, $06, $06, $06, $06, $07
	db $07, $07, $07, $07, $07, $06, $06, $06
	
	db $06, $06, $06, $06, $06, $06, $07, $07
	db $07, $06, $06, $06, $02, $04
	
org $D10000	
font0b:
	incbin "FQ_Data\font0b.bin"

frame:
	incbin "FQ_Data\frame.bin"
senki:
	incbin "FQ_Data\ornic_senki.bin"
senki_EN:
	incbin "FQ_Data\ornic_senki_EN.bin"
	
org $D20000
font1a:
	incbin "FQ_Data\font1a.bin"
	
ishi1_chr:
	incbin "FQ_Data\ishi1.chr"
ishi1_map:
	incbin "FQ_Data\ishi1.map"
ishi1_pal:
	incbin "FQ_Data\ishi1.pal"
ishi1_end:

ishi2_chr:
	incbin "FQ_Data\ishi2.chr"
ishi2_map:
	incbin "FQ_Data\ishi2.map"
ishi2_pal:
	incbin "FQ_Data\ishi2.pal"
ishi2_end:
	
org $D30000
font1b:
	incbin "FQ_Data\font1b.bin"
font2:
	incbin "FQ_Data\font2.bin"
	
org $D40000
font3a:
	incbin "FQ_Data\font3a.bin"

cursor_chr:
	incbin "FQ_Data\cursor.bin"
cursor_pal:
	dw $0000, $1463, $239D, $22BC, $0931
	
gengo_pal:
	dw $0000, $50E5, $7FB7, $7FFF
	dw $0000, $0013, $037F, $7FFF
	dw $0000, $0600, $7FFF, $7FFF
gengo_chr:
	incbin "FQ_Data\gengo.chr"
gengo_map:
	incbin "FQ_Data\gengo.map"
	
org $D50000
font3b:
	incbin "FQ_Data\font3b.bin"
sigurd_chr:
	incbin "FQ_Data\sigurd.chr"
sigurd_chr_end:	

sigurd_pal:
	db $00, $38, $9C, $7B, $1D, $43, $9A, $32, $92, $15, $7F, $47, $42, $14, $0D, $0D
	db $86, $04, $C3, $44, $81, $38, $24, $51, $2B, $00, $65, $65, $AD, $35, $40, $0C
	
waku_chr:
	incbin "FQ_Data\waku.chr"
waku_chr_end:

waku_pal:
	db $00, $00, $DE, $7B, $EB, $2B, $A5, $14, $1F, $78, $FD, $7F, $E0, $7F, $63, $30
	db $1F, $7C, $DE, $63, $DF, $02, $00, $00, $1F, $7C, $6F, $01, $FF, $03, $B5, $4A
	
serifu:
	incbin "FQ_kaiwa\serifu.bin"
	
org $DC0000
	db $C0, $FF, $EE
ishibune:
	incbin "FQ_Data\ishibune.brr"
ishibune_end:
	
org $DD0000
menu_text00_E:
	incbin "FQ_menu\menu00_E.bin"
menu_text01_E:
	incbin "FQ_menu\menu01_E.bin"
menu_text02_E:
	incbin "FQ_menu\menu02_E.bin"
menu_text03_E:
	incbin "FQ_menu\menu03_E.bin"
menu_text04_E:
	incbin "FQ_menu\menu04_E.bin"
menu_text05_E:
	incbin "FQ_menu\menu05_E.bin"
menu_text06_E:
	incbin "FQ_menu\menu06_E.bin"
menu_text07_E:
	incbin "FQ_menu\menu07_E.bin"
menu_text08_E:
	incbin "FQ_menu\menu08_E.bin"
menu_text09_E:
	incbin "FQ_menu\menu09_E.bin"
menu_text0A_E:
	incbin "FQ_menu\menu0A_E.bin"
menu_text0B_E:
	incbin "FQ_menu\menu0B_E.bin"
menu_text0C_E:
	incbin "FQ_menu\menu0C_E.bin"
menu_text0D_E:
	incbin "FQ_menu\menu0D_E.bin"
menu_text0E_E:
	incbin "FQ_menu\menu0E_E.bin"
menu_text0F_E:
	incbin "FQ_menu\menu0F_E.bin"
menu_text10_E:
	incbin "FQ_menu\menu10_E.bin"
menu_text11_E:
	incbin "FQ_menu\menu11_E.bin"
menu_text12_E:
	incbin "FQ_menu\menu12_E.bin"
menu_text13_E:
	incbin "FQ_menu\menu13_E.bin"
menu_text14_E:
	incbin "FQ_menu\menu14_E.bin"
menu_text15_E:
	incbin "FQ_menu\menu15_E.bin"
menu_text16_E:
	incbin "FQ_menu\menu16_E.bin"
menu_text17_E:
	incbin "FQ_menu\menu17_E.bin"
menu_text18_E:
	incbin "FQ_menu\menu18_E.bin"
menu_text19_E:
	incbin "FQ_menu\menu19_E.bin"
menu_text1A_E:
	incbin "FQ_menu\menu1A_E.bin"
menu_text1B_E:
	incbin "FQ_menu\menu1B_E.bin"
menu_text1C_E:
	incbin "FQ_menu\menu1C_E.bin"
menu_text1D_E:
	incbin "FQ_menu\menu1D_E.bin"
menu_text1E_E:
	incbin "FQ_menu\menu1E_E.bin"
menu_text1F_E:
	incbin "FQ_menu\menu1F_E.bin"
menu_text20_E:
	incbin "FQ_menu\menu20_E.bin"
menu_text21_E:
	incbin "FQ_menu\menu21_E.bin"
menu_text22_E:
	incbin "FQ_menu\menu22_E.bin"
menu_text23_E:
	incbin "FQ_menu\menu23_E.bin"
menu_text24_E:
	incbin "FQ_menu\menu24_E.bin"
menu_text25_E:
	incbin "FQ_menu\menu25_E.bin"
menu_text26_E:
	incbin "FQ_menu\menu26_E.bin"
menu_text27_E:
	incbin "FQ_menu\menu27_E.bin"
menu_text28_E:
	incbin "FQ_menu\menu28_E.bin"
menu_text29_E:
	incbin "FQ_menu\menu29_E.bin"
menu_text2A_E:
	incbin "FQ_menu\menu2A_E.bin"
menu_text2B_E:
	incbin "FQ_menu\menu2B_E.bin"
menu_text2C_E:
	incbin "FQ_menu\menu2C_E.bin"
menu_text2D_E:
	incbin "FQ_menu\menu2D_E.bin"
menu_text2E_E:
	incbin "FQ_menu\menu2E_E.bin"
menu_text2F_E:
	incbin "FQ_menu\menu2F_E.bin"
menu_text30_E:
	incbin "FQ_menu\menu30_E.bin"
menu_text31_E:
	incbin "FQ_menu\menu31_E.bin"
menu_text32_E:
	incbin "FQ_menu\menu32_E.bin"
menu_text33_E:
	incbin "FQ_menu\menu33_E.bin"
menu_text34_E:
	incbin "FQ_menu\menu34_E.bin"
menu_text35_E:
	incbin "FQ_menu\menu35_E.bin"
menu_text36_E:
	incbin "FQ_menu\menu36_E.bin"
menu_text37_E:
	incbin "FQ_menu\menu37_E.bin"
menu_text38_E:
	incbin "FQ_menu\menu38_E.bin"
menu_text39_E:
	incbin "FQ_menu\menu39_E.bin"
menu_text3A_E:
	incbin "FQ_menu\menu3A_E.bin"
menu_text3B_E:
	incbin "FQ_menu\menu3B_E.bin"
menu_text3C_E:
	incbin "FQ_menu\menu3C_E.bin"
menu_text3D_E:
	incbin "FQ_menu\menu3D_E.bin"
menu_text3E_E:
	incbin "FQ_menu\menu3E_E.bin"
menu_text3F_E:
	incbin "FQ_menu\menu3F_E.bin"
menu_text40_E:
	incbin "FQ_menu\menu40_E.bin"
menu_text41_E:
	incbin "FQ_menu\menu41_E.bin"
menu_text42_E:
	incbin "FQ_menu\menu42_E.bin"
menu_text43_E:
	incbin "FQ_menu\menu43_E.bin"
menu_text44_E:
	incbin "FQ_menu\menu44_E.bin"
menu_text45_E:
	incbin "FQ_menu\menu45_E.bin"
menu_text46_E:
	incbin "FQ_menu\menu46_E.bin"
menu_text47_E:
	incbin "FQ_menu\menu47_E.bin"
menu_text48_E:
	incbin "FQ_menu\menu48_E.bin"
menu_text49_E:
	incbin "FQ_menu\menu49_E.bin"
menu_text4A_E:
	incbin "FQ_menu\menu4A_E.bin"
menu_text4B_E:
	incbin "FQ_menu\menu4B_E.bin"
menu_text4C_E:
	incbin "FQ_menu\menu4C_E.bin"
menu_text4D_E:
	incbin "FQ_menu\menu4D_E.bin"
menu_text4E_E:
	incbin "FQ_menu\menu4E_E.bin"
menu_text4F_E:
	incbin "FQ_menu\menu4F_E.bin"
menu_text50_E:
	incbin "FQ_menu\menu50_E.bin"
menu_text51_E:
	incbin "FQ_menu\menu51_E.bin"
menu_text52_E:
	incbin "FQ_menu\menu52_E.bin"
menu_text53_E:
	incbin "FQ_menu\menu53_E.bin"
menu_text54_E:
	incbin "FQ_menu\menu54_E.bin"
menu_text55_E:
	incbin "FQ_menu\menu55_E.bin"
menu_text56_E:
	incbin "FQ_menu\menu56_E.bin"
menu_text57_E:
	incbin "FQ_menu\menu57_E.bin"
menu_text58_E:
	incbin "FQ_menu\menu58_E.bin"
menu_text59_E:
	incbin "FQ_menu\menu59_E.bin"
menu_text5A_E:
	incbin "FQ_menu\menu5A_E.bin"
menu_text5B_E:
	incbin "FQ_menu\menu5B_E.bin"
menu_text5C_E:
	incbin "FQ_menu\menu5C_E.bin"
menu_text5D_E:
	incbin "FQ_menu\menu5D_E.bin"
menu_text5E_E:
	incbin "FQ_menu\menu5E_E.bin"
menu_text5F_E:
	incbin "FQ_menu\menu5F_E.bin"
menu_text60_E:
	incbin "FQ_menu\menu60_E.bin"
menu_text61_E:
	incbin "FQ_menu\menu61_E.bin"
menu_text62_E:
	incbin "FQ_menu\menu62_E.bin"
menu_text63_E:
	incbin "FQ_menu\menu63_E.bin"
menu_text64_E:
	incbin "FQ_menu\menu64_E.bin"
chimei00_E:
	incbin "FQ_chimei\chimei00_E.bin"
chimei01_E:
	incbin "FQ_chimei\chimei01_E.bin"
chimei02_E:
	incbin "FQ_chimei\chimei02_E.bin"
chimei03_E:
	incbin "FQ_chimei\chimei03_E.bin"
chimei04_E:
	incbin "FQ_chimei\chimei04_E.bin"
chimei05_E:
	incbin "FQ_chimei\chimei05_E.bin"
chimei06_E:
	incbin "FQ_chimei\chimei06_E.bin"
chimei07_E:
	incbin "FQ_chimei\chimei07_E.bin"
chimei08_E:
	incbin "FQ_chimei\chimei08_E.bin"
chimei09_E:
	incbin "FQ_chimei\chimei09_E.bin"
chimei0A_E:
	incbin "FQ_chimei\chimei0A_E.bin"
chimei0B_E:
	incbin "FQ_chimei\chimei0B_E.bin"
chimei0C_E:
	incbin "FQ_chimei\chimei0C_E.bin"
chimei0D_E:
	incbin "FQ_chimei\chimei0D_E.bin"
chimei0E_E:
	incbin "FQ_chimei\chimei0E_E.bin"
chimei0F_E:
	incbin "FQ_chimei\chimei0F_E.bin"
chimei10_E:
	incbin "FQ_chimei\chimei10_E.bin"
chimei11_E:
	incbin "FQ_chimei\chimei11_E.bin"
chimei12_E:
	incbin "FQ_chimei\chimei12_E.bin"
chimei13_E:
	incbin "FQ_chimei\chimei13_E.bin"
chimei14_E:
	incbin "FQ_chimei\chimei14_E.bin"
chimei15_E:
	incbin "FQ_chimei\chimei15_E.bin"
chimei16_E:
	incbin "FQ_chimei\chimei16_E.bin"
chimei17_E:
	incbin "FQ_chimei\chimei17_E.bin"
chimei18_E:
	incbin "FQ_chimei\chimei18_E.bin"
chimei19_E:
	incbin "FQ_chimei\chimei19_E.bin"
chimei1A_E:
	incbin "FQ_chimei\chimei1A_E.bin"
chimei1B_E:
	incbin "FQ_chimei\chimei1B_E.bin"
chimei1C_E:
	incbin "FQ_chimei\chimei1C_E.bin"
chimei1D_E:
	incbin "FQ_chimei\chimei1D_E.bin"
chimei1E_E:
	incbin "FQ_chimei\chimei1E_E.bin"
chimei1F_E:
	incbin "FQ_chimei\chimei1F_E.bin"
chimei20_E:
	incbin "FQ_chimei\chimei20_E.bin"
chimei21_E:
	incbin "FQ_chimei\chimei21_E.bin"
chimei22_E:
	incbin "FQ_chimei\chimei22_E.bin"
chimei23_E:
	incbin "FQ_chimei\chimei23_E.bin"
chimei24_E:
	incbin "FQ_chimei\chimei24_E.bin"
chimei25_E:
	incbin "FQ_chimei\chimei25_E.bin"
chimei26_E:
	incbin "FQ_chimei\chimei26_E.bin"
chimei27_E:
	incbin "FQ_chimei\chimei27_E.bin"
chimei28_E:
	incbin "FQ_chimei\chimei28_E.bin"
chimei29_E:
	incbin "FQ_chimei\chimei29_E.bin"
chimei2A_E:
	incbin "FQ_chimei\chimei2A_E.bin"
chimei2B_E:
	incbin "FQ_chimei\chimei2B_E.bin"
chimei2C_E:
	incbin "FQ_chimei\chimei2C_E.bin"
chimei2D_E:
	incbin "FQ_chimei\chimei2D_E.bin"
chimei2E_E:
	incbin "FQ_chimei\chimei2E_E.bin"
chimei2F_E:
	incbin "FQ_chimei\chimei2F_E.bin"
chimei30_E:
	incbin "FQ_chimei\chimei30_E.bin"
chimei31_E:
	incbin "FQ_chimei\chimei31_E.bin"
chimei32_E:
	incbin "FQ_chimei\chimei32_E.bin"
chimei33_E:
	incbin "FQ_chimei\chimei33_E.bin"
chimei34_E:
	incbin "FQ_chimei\chimei34_E.bin"
chimei35_E:
	incbin "FQ_chimei\chimei35_E.bin"
chimei36_E:
	incbin "FQ_chimei\chimei36_E.bin"
chimei37_E:
	incbin "FQ_chimei\chimei37_E.bin"
chimei38_E:
	incbin "FQ_chimei\chimei38_E.bin"
chimei39_E:
	incbin "FQ_chimei\chimei39_E.bin"
chimei3A_E:
	incbin "FQ_chimei\chimei3A_E.bin"
chimei3B_E:
	incbin "FQ_chimei\chimei3B_E.bin"
chimei3C_E:
	incbin "FQ_chimei\chimei3C_E.bin"
chimei3D_E:
	incbin "FQ_chimei\chimei3D_E.bin"
chimei3E_E:
	incbin "FQ_chimei\chimei3E_E.bin"
chimei3F_E:
	incbin "FQ_chimei\chimei3F_E.bin"
chimei40_E:
	incbin "FQ_chimei\chimei40_E.bin"
chimei41_E:
	incbin "FQ_chimei\chimei41_E.bin"
chimei42_E:
	incbin "FQ_chimei\chimei42_E.bin"
chimei43_E:
	incbin "FQ_chimei\chimei43_E.bin"
chimei44_E:
	incbin "FQ_chimei\chimei44_E.bin"
chimei45_E:
	incbin "FQ_chimei\chimei45_E.bin"
Item_E:
	incbin "FQ_item\Item_E.bin"
Name_E:
	incbin "FQ_name\Name_E.bin"
Class_E:
	incbin "FQ_class\Class_E.bin"
status_E:
	incbin "FQ_status\status_E.bin"
	
org $DE0000
kaiwa_E:
	incbin "FQ_kaiwa\kaiwa_E.bin"
kaiwa_E_end:

org $DF0000
menu_text00:
	incbin "FQ_menu\menu00.bin"
menu_text01:
	incbin "FQ_menu\menu01.bin"
menu_text02:
	incbin "FQ_menu\menu02.bin"
menu_text03:
	incbin "FQ_menu\menu03.bin"
menu_text04:
	incbin "FQ_menu\menu04.bin"
menu_text05:
	incbin "FQ_menu\menu05.bin"
menu_text06:
	incbin "FQ_menu\menu06.bin"
menu_text07:
	incbin "FQ_menu\menu07.bin"
menu_text08:
	incbin "FQ_menu\menu08.bin"
menu_text09:
	incbin "FQ_menu\menu09.bin"
menu_text0A:
	incbin "FQ_menu\menu0A.bin"
menu_text0B:
	incbin "FQ_menu\menu0B.bin"
menu_text0C:
	incbin "FQ_menu\menu0C.bin"
menu_text0D:
	incbin "FQ_menu\menu0D.bin"
menu_text0E:
	incbin "FQ_menu\menu0E.bin"
menu_text0F:
	incbin "FQ_menu\menu0F.bin"
menu_text10:
	incbin "FQ_menu\menu10.bin"
menu_text11:
	incbin "FQ_menu\menu11.bin"
menu_text12:
	incbin "FQ_menu\menu12.bin"
menu_text13:
	incbin "FQ_menu\menu13.bin"
menu_text14:
	incbin "FQ_menu\menu14.bin"
menu_text15:
	incbin "FQ_menu\menu15.bin"
menu_text16:
	incbin "FQ_menu\menu16.bin"
menu_text17:
	incbin "FQ_menu\menu17.bin"
menu_text18:
	incbin "FQ_menu\menu18.bin"
menu_text19:
	incbin "FQ_menu\menu19.bin"
menu_text1A:
	incbin "FQ_menu\menu1A.bin"
menu_text1B:
	incbin "FQ_menu\menu1B.bin"
menu_text1C:
	incbin "FQ_menu\menu1C.bin"
menu_text1D:
	incbin "FQ_menu\menu1D.bin"
menu_text1E:
	incbin "FQ_menu\menu1E.bin"
menu_text1F:
	incbin "FQ_menu\menu1F.bin"
menu_text20:
	incbin "FQ_menu\menu20.bin"
menu_text21:
	incbin "FQ_menu\menu21.bin"
menu_text22:
	incbin "FQ_menu\menu22.bin"
menu_text23:
	incbin "FQ_menu\menu23.bin"
menu_text24:
	incbin "FQ_menu\menu24.bin"
menu_text25:
	incbin "FQ_menu\menu25.bin"
menu_text26:
	incbin "FQ_menu\menu26.bin"
menu_text27:
	incbin "FQ_menu\menu27.bin"
menu_text28:
	incbin "FQ_menu\menu28.bin"
menu_text29:
	incbin "FQ_menu\menu29.bin"
menu_text2A:
	incbin "FQ_menu\menu2A.bin"
menu_text2B:
	incbin "FQ_menu\menu2B.bin"
menu_text2C:
	incbin "FQ_menu\menu2C.bin"
menu_text2D:
	incbin "FQ_menu\menu2D.bin"
menu_text2E:
	incbin "FQ_menu\menu2E.bin"
menu_text2F:
	incbin "FQ_menu\menu2F.bin"
menu_text30:
	incbin "FQ_menu\menu30.bin"
menu_text31:
	incbin "FQ_menu\menu31.bin"
menu_text32:
	incbin "FQ_menu\menu32.bin"
menu_text33:
	incbin "FQ_menu\menu33.bin"
menu_text34:
	incbin "FQ_menu\menu34.bin"
menu_text35:
	incbin "FQ_menu\menu35.bin"
menu_text36:
	incbin "FQ_menu\menu36.bin"
menu_text37:
	incbin "FQ_menu\menu37.bin"
menu_text38:
	incbin "FQ_menu\menu38.bin"
menu_text39:
	incbin "FQ_menu\menu39.bin"
menu_text3A:
	incbin "FQ_menu\menu3A.bin"
menu_text3B:
	incbin "FQ_menu\menu3B.bin"
menu_text3C:
	incbin "FQ_menu\menu3C.bin"
menu_text3D:
	incbin "FQ_menu\menu3D.bin"
menu_text3E:
	incbin "FQ_menu\menu3E.bin"
menu_text3F:
	incbin "FQ_menu\menu3F.bin"
menu_text40:
	incbin "FQ_menu\menu40.bin"
menu_text41:
	incbin "FQ_menu\menu41.bin"
menu_text42:
	incbin "FQ_menu\menu42.bin"
menu_text43:
	incbin "FQ_menu\menu43.bin"
menu_text44:
	incbin "FQ_menu\menu44.bin"
menu_text45:
	incbin "FQ_menu\menu45.bin"
menu_text46:
	incbin "FQ_menu\menu46.bin"
menu_text47:
	incbin "FQ_menu\menu47.bin"
menu_text48:
	incbin "FQ_menu\menu48.bin"
menu_text49:
	incbin "FQ_menu\menu49.bin"
menu_text4A:
	incbin "FQ_menu\menu4A.bin"
menu_text4B:
	incbin "FQ_menu\menu4B.bin"
menu_text4C:
	incbin "FQ_menu\menu4C.bin"
menu_text4D:
	incbin "FQ_menu\menu4D.bin"
menu_text4E:
	incbin "FQ_menu\menu4E.bin"
menu_text4F:
	incbin "FQ_menu\menu4F.bin"
menu_text50:
	incbin "FQ_menu\menu50.bin"
menu_text51:
	incbin "FQ_menu\menu51.bin"
menu_text52:
	incbin "FQ_menu\menu52.bin"
menu_text53:
	incbin "FQ_menu\menu53.bin"
menu_text54:
	incbin "FQ_menu\menu54.bin"
menu_text55:
	incbin "FQ_menu\menu55.bin"
menu_text56:
	incbin "FQ_menu\menu56.bin"
menu_text57:
	incbin "FQ_menu\menu57.bin"
menu_text58:
	incbin "FQ_menu\menu58.bin"
menu_text59:
	incbin "FQ_menu\menu59.bin"
menu_text5A:
	incbin "FQ_menu\menu5A.bin"
menu_text5B:
	incbin "FQ_menu\menu5B.bin"
menu_text5C:
	incbin "FQ_menu\menu5C.bin"
menu_text5D:
	incbin "FQ_menu\menu5D.bin"
menu_text5E:
	incbin "FQ_menu\menu5E.bin"
menu_text5F:
	incbin "FQ_menu\menu5F.bin"
menu_text60:
	incbin "FQ_menu\menu60.bin"
menu_text61:
	incbin "FQ_menu\menu61.bin"
menu_text62:
	incbin "FQ_menu\menu62.bin"
menu_text63:
	incbin "FQ_menu\menu63.bin"
menu_text64:
	incbin "FQ_menu\menu64.bin"


dict00:
	incbin "FQ_dict\dict00.bin"
dict01:
	incbin "FQ_dict\dict01.bin"
dict02:
	incbin "FQ_dict\dict02.bin"
dict03:
	incbin "FQ_dict\dict03.bin"
dict04:
	incbin "FQ_dict\dict04.bin"
dict05:
	incbin "FQ_dict\dict05.bin"
dict06:
	incbin "FQ_dict\dict06.bin"
dict07:
	incbin "FQ_dict\dict07.bin"
dict08:
	incbin "FQ_dict\dict08.bin"
dict09:
	incbin "FQ_dict\dict09.bin"
dictF0:
	incbin "FQ_dict\dictF0.bin"
	
chimei00:
	incbin "FQ_chimei\chimei00.bin"
chimei01:
	incbin "FQ_chimei\chimei01.bin"
chimei02:
	incbin "FQ_chimei\chimei02.bin"
chimei03:
	incbin "FQ_chimei\chimei03.bin"
chimei04:
	incbin "FQ_chimei\chimei04.bin"
chimei05:
	incbin "FQ_chimei\chimei05.bin"
chimei06:
	incbin "FQ_chimei\chimei06.bin"
chimei07:
	incbin "FQ_chimei\chimei07.bin"
chimei08:
	incbin "FQ_chimei\chimei08.bin"
chimei09:
	incbin "FQ_chimei\chimei09.bin"
chimei0A:
	incbin "FQ_chimei\chimei0A.bin"
chimei0B:
	incbin "FQ_chimei\chimei0B.bin"
chimei0C:
	incbin "FQ_chimei\chimei0C.bin"
chimei0D:
	incbin "FQ_chimei\chimei0D.bin"
chimei0E:
	incbin "FQ_chimei\chimei0E.bin"
chimei0F:
	incbin "FQ_chimei\chimei0F.bin"
chimei10:
	incbin "FQ_chimei\chimei10.bin"
chimei11:
	incbin "FQ_chimei\chimei11.bin"
chimei12:
	incbin "FQ_chimei\chimei12.bin"
chimei13:
	incbin "FQ_chimei\chimei13.bin"
chimei14:
	incbin "FQ_chimei\chimei14.bin"
chimei15:
	incbin "FQ_chimei\chimei15.bin"
chimei16:
	incbin "FQ_chimei\chimei16.bin"
chimei17:
	incbin "FQ_chimei\chimei17.bin"
chimei18:
	incbin "FQ_chimei\chimei18.bin"
chimei19:
	incbin "FQ_chimei\chimei19.bin"
chimei1A:
	incbin "FQ_chimei\chimei1A.bin"
chimei1B:
	incbin "FQ_chimei\chimei1B.bin"
chimei1C:
	incbin "FQ_chimei\chimei1C.bin"
chimei1D:
	incbin "FQ_chimei\chimei1D.bin"
chimei1E:
	incbin "FQ_chimei\chimei1E.bin"
chimei1F:
	incbin "FQ_chimei\chimei1F.bin"
chimei20:
	incbin "FQ_chimei\chimei20.bin"
chimei21:
	incbin "FQ_chimei\chimei21.bin"
chimei22:
	incbin "FQ_chimei\chimei22.bin"
chimei23:
	incbin "FQ_chimei\chimei23.bin"
chimei24:
	incbin "FQ_chimei\chimei24.bin"
chimei25:
	incbin "FQ_chimei\chimei25.bin"
chimei26:
	incbin "FQ_chimei\chimei26.bin"
chimei27:
	incbin "FQ_chimei\chimei27.bin"
chimei28:
	incbin "FQ_chimei\chimei28.bin"
chimei29:
	incbin "FQ_chimei\chimei29.bin"
chimei2A:
	incbin "FQ_chimei\chimei2A.bin"
chimei2B:
	incbin "FQ_chimei\chimei2B.bin"
chimei2C:
	incbin "FQ_chimei\chimei2C.bin"
chimei2D:
	incbin "FQ_chimei\chimei2D.bin"
chimei2E:
	incbin "FQ_chimei\chimei2E.bin"
chimei2F:
	incbin "FQ_chimei\chimei2F.bin"
chimei30:
	incbin "FQ_chimei\chimei30.bin"
chimei31:
	incbin "FQ_chimei\chimei31.bin"
chimei32:
	incbin "FQ_chimei\chimei32.bin"
chimei33:
	incbin "FQ_chimei\chimei33.bin"
chimei34:
	incbin "FQ_chimei\chimei34.bin"
chimei35:
	incbin "FQ_chimei\chimei35.bin"
chimei36:
	incbin "FQ_chimei\chimei36.bin"
chimei37:
	incbin "FQ_chimei\chimei37.bin"
chimei38:
	incbin "FQ_chimei\chimei38.bin"
chimei39:
	incbin "FQ_chimei\chimei39.bin"
chimei3A:
	incbin "FQ_chimei\chimei3A.bin"
chimei3B:
	incbin "FQ_chimei\chimei3B.bin"
chimei3C:
	incbin "FQ_chimei\chimei3C.bin"
chimei3D:
	incbin "FQ_chimei\chimei3D.bin"
chimei3E:
	incbin "FQ_chimei\chimei3E.bin"
chimei3F:
	incbin "FQ_chimei\chimei3F.bin"
chimei40:
	incbin "FQ_chimei\chimei40.bin"
chimei41:
	incbin "FQ_chimei\chimei41.bin"
chimei42:
	incbin "FQ_chimei\chimei42.bin"
chimei43:
	incbin "FQ_chimei\chimei43.bin"
chimei44:
	incbin "FQ_chimei\chimei44.bin"
chimei45:
	incbin "FQ_chimei\chimei45.bin"
	
Item:
	incbin "FQ_item\Item.bin"
Name:
	incbin "FQ_name\Name.bin"
Class:
	incbin "FQ_class\Class.bin"
kaiwa:
	incbin "FQ_kaiwa\kaiwa.bin"
kaiwa_end:
status:
	incbin "FQ_status\status.bin"


