

######### NỘI DUNG / TABLE OF KONTENTS #########

I. Tiếng Việt
II. English

############################################

************************  I.  Tiếng Việt  ************************  

1. Khái quát
	Đây là bản dịch tiếng đa ngôn ngữ cùng mã nguồn bản dịch của trò "First Queen - Ornic Senki" do hãng Kure Software phát triển, Culture Brain phát hành cho máy chơi game Sufami vào năm 1994.
	Bản dịch đi kèm với sách hướng dẫn (tiếng Nhật + bản dịch tiếng Việt) của nhà sản xuất tặng kèm băng game.
	Người chơi có thể lựa chọn một trong ba ngôn ngữ ngay sau khi khởi động game:
			- Tiếng Việt
			- Tiếng Nhật (bản gốc)
			- Tiếng Anh
	
	Bản dịch tiếng Việt/Anh còn có thêm một số tính năng ẩn mà bản gốc tiếng Nhật không có.
	Chẳng hạn như cho phép người chơi nhấn các combo nút bí mật vào đúng thời điểm để kích hoạt tính năng bí mật.
	Dĩ nhiên, bạn có thể tìm hiểu về những tính năng ẩn này bằng cách đọc mã nguồn.
	
2. Cách sử dụng
	Tải mã nguồn của bản dịch từ trang Github của thuyền đá.
	Sau đó, đưa ROM gốc của bạn (bản tiếng Nhật chưa chỉnh sửa), không header vào thư mục "FQ_ROM".
	Tiếp theo, đổi tên ROM gốc của bạn thành "FQJP.sfc" hoặc bất cứ tên gì, miễn là trùng khớp với tên được mô tả trong file .bat.
	Cuối cùng, click vào file thực thi ở thư mục gốc. Có 2 lựa chọn:
			- Nếu bạn dùng hệ điều hành WINDOWS, hãy click vào file "FQ.bat".
			- Nếu bạn dùng hệ điều hành MAC, hãy click vào file "FQ.command" (bạn cần có thêm phần mềm "wine" để chạy)
	
	Lúc này, file được dịch có tên là "FQ_translation" (hoặc bất cứ tên gì trùng khớp với mô tả trong file .bat) sẽ được tạo thành trong thư mục "FQ_ROM".
	Đây là file đích của bạn, chứa toàn bộ nội dung dịch thuật.
	
* Lưu ý:
	- Bạn có thể chỉnh sửa lời thoại của bản dịch bằng cách biên tập các file kaiwa bên trong thư mục "FQ_kaiwa".
	- Bạn cũng có thể chỉnh sửa code chức năng của game bằng cách biên tập các file .asm bên trong thư mục "FQ_ASM".
	Phần này đỏi hỏi kiến thức về phần cứng và ngôn ngữ phần mềm của máy Sufami.
	Nếu bạn không am hiểu thì đừng động vào các file .asm.
	
3. Tri ân
	- byuu (Near) vì đã tạo ra xkas, một phần mềm assembler tuyệt vời trong số những thứ tuyệt vời.
	- Klarth vì đã tạo ra Atlas, phần mềm chèn text cực kỳ xuất sắc.
	
	Dự án này có sử dụng công cụ xkas và Atlas như đề cập bên trên.
	
4. Danh đề
		- Dịch thuật (Nhật --> Việt): thuyền đá
		- Lập trình: thuyền đá
		
		https://github.com/stoneboat65816
		https://sites.google.com/view/sfc65816
		https://www.facebook.com/SuperFamicom65816
		https://www.youtube.com/@RetroTV_65816
		
	
************************  II.  English  ************************  
1. Overview

	This is a multilingual translation of First Queen - Ornic Senki, along with its source code.
	The game was developed by Kure Software and published by Culture Brain for the Super Famicom in 1994.
	The translation package also includes the original Japanese instruction manual and its Vietnamese translation, based on the manual originally included with the game cartridge.
	Immediately after launching the game, players can choose from three languages:
		Vietnamese
		Japanese (Original)
		English
		
	The Vietnamese and English versions also include several hidden features that are not available in the original Japanese version.
	For example, players can activate secret features by entering specific button combinations on the controller at the right moment.
	Of course, you can learn more about these hidden features by examining the source code.

2. How to Use

	Download the translation source code from my GitHub page.
	Next, place your original, unmodified Japanese ROM (without a header) into the FQ_ROM folder.
	Rename your ROM to FQJP.sfc, or use any other filename, provided it matches the filename specified in the .bat file.
	Finally, run the appropriate executable file located in the root directory. There are two options:
			Windows: Run FQ.bat.
			macOS: Run FQ.command (you will also need Wine installed).

	The translated ROM, named FQ_translation (or whatever filename is specified in the .bat file), will then be generated in the FQ_ROM folder.
	This is your output file, containing all the translated content.

Notes:
	You can modify the dialogue by editing the kaiwa files inside the FQ_kaiwa folder.
	You can also modify the game's functional code by editing the .asm files inside the FQ_ASM folder.
	Please note that modifying these files requires knowledge of the Super Famicom's hardware architecture and assembly language.
	If you are not familiar with these subjects, I strongly recommend that you leave the .asm files untouched.
	
3. Special Thanks

		byuu (Near) for creating xkas, an outstanding assembler that stands among the very best.
		Klarth for creating Atlas, an exceptionally powerful and well-crafted text insertion tool.
	This project uses xkas and Atlas, the tools mentioned above.
	
4. Credits

	Translation (Japanese → Vietnamese): Stoneboat
	Programming: Stoneboat
	
	https://github.com/stoneboat65816
	https://sites.google.com/view/sfc65816
	https://www.youtube.com/@RetroTV_65816
