# HƯỚNG DẪN SỬ DỤNG UNIKEY-MUONG
*(UniKey-Muong User Manual & Reference Guide)*

---

## 1. Giới thiệu tổng quan

**UniKey-Muong** là phiên bản mở rộng từ phần mềm gõ tiếng Việt mã nguồn mở UniKey của tác giả Phạm Kim Long. Phần mềm được thiết kế và phát triển chuyên biệt nhằm phục vụ công tác soạn thảo, nghiên cứu, số hóa và bảo tồn ngữ liệu **tiếng Mường**.

Do hệ thống ngữ âm và chữ viết tiếng Mường có những đặc thù riêng biệt so với chữ Quốc ngữ tiếng Việt (chữ `w` được sử dụng phổ biến làm phụ âm đầu/âm đệm/âm cuối; hiện tượng nguyên âm dài/nhân đôi nguyên âm; các dấu thanh điệu riêng biệt), UniKey-Muong đã tích hợp thêm:
- **Bảng mã chuyên dụng**: `Unicode Muong` (chuẩn Unicode tổ hợp theo ngữ âm học tiếng Mường).
- **Kiểu gõ chuyên dụng**: `TELEX_MUONG` (kiểu gõ Telex được tinh chỉnh tối ưu cho từ vựng và cấu trúc âm tiết tiếng Mường).
- **Tính năng tự động sửa chính tả tiếng Mường (Auto-fix Spell)**: Tự động chuyển tự từ cách ghi tiếng Việt sang quy chuẩn chính tả tiếng Mường.
- Hỗ trợ đầy đủ các kiểu gõ và bảng mã tiếng Việt truyền thống (Unicode dựng sẵn, TCVN3, VNI, VIQR,...).

---

## 2. Yêu cầu hệ thống & Cài đặt

### Yêu cầu hệ thống
- **Hệ điều hành**: Microsoft Windows 7 / 8 / 8.1 / 10 / 11 (32-bit và 64-bit).
- **Thư viện phụ thuộc**: **Không cần** cài đặt Microsoft Visual C++ Redistributable hay .NET Framework (ứng dụng đã được liên kết tĩnh độc lập `/MT`).
- **Font chữ khuyến nghị**: Các phông chữ hỗ trợ đầy đủ Unicode Diacritics (như *Times New Roman*, *Arial*, *Segoe UI*, *Calibri*, *Charis SIL*).

### Cấu trúc thư mục phát hành (`publish/UniKey-Muong/`)
Phần mềm là dạng Portable, không cần chạy trình cài đặt (installer). Bạn chỉ cần giải nén tệp `UniKey-Muong-Release.zip` vào một thư mục cố định (ví dụ `D:\UniKey-Muong\` hoặc `C:\Program Files\UniKey-Muong\`).

| Tệp tin | Vai trò |
|---|---|
| `UniKey-Muong.exe` | Chương trình chính của bộ gõ (Unicode 32-bit) |
| `ukhook35.dll` | Thư viện hook bàn phím toàn hệ thống |
| `rtfio.dll` | Thư viện chuyển đổi định dạng văn bản giàu (Rich Text Format) |
| `DOC.docx` | Tài liệu nghiên cứu và thiết kế kỹ thuật bảng mã |
| `MANUAL.md` | Tài liệu hướng dẫn sử dụng chi tiết này |
| `license.txt` | Bản quyền phần mềm mã nguồn mở GNU GPL v2 |
| `readme.txt` | Thông tin từ tác giả gốc UniKey |

> [!IMPORTANT]
> `UniKey-Muong.exe`, `ukhook35.dll` và `rtfio.dll` bắt buộc phải luôn nằm trong cùng một thư mục. Không di chuyển riêng lẻ tệp `.exe` ra ngoài màn hình desktop; nếu muốn tạo biểu tượng ngoài màn hình, hãy nhấp chuột phải vào `UniKey-Muong.exe` và chọn **Send to -> Desktop (create shortcut)**.

---

## 3. Khởi động và Thiết lập ban đầu

1. **Khởi chạy ứng dụng**:
   - Nhấp đúp vào `UniKey-Muong.exe`.
   - Biểu tượng chương trình sẽ xuất hiện trên khay hệ thống (System Tray, góc dưới bên phải màn hình taskbar) với chữ **V** (bật gõ tiếng Mường/Việt) hoặc **E** (chế độ tiếng Anh).
2. **Thiết lập chuẩn để gõ tiếng Mường**:
   - Mở cửa sổ điều khiển chính của UniKey-Muong.
   - Tại mục **Bảng mã (Character set)**: Chọn `Unicode Muong`.
   - Tại mục **Kiểu gõ (Input method)**: Chọn `TELEX_MUONG`.
   - Nhấp nút **Mở rộng (Advanced)** để cấu hình các tùy chọn nâng cao theo nhu cầu.
   - Nhấp **Đóng (Close)** để thu nhỏ chương trình xuống khay hệ thống.

---

## 4. Quy tắc gõ tiếng Mường (`TELEX_MUONG`)

### 4.1. Bảng phím gõ dấu thanh điệu

Tiếng Mường sử dụng các ký tự dấu tổ hợp (Combining Diacritical Marks) riêng biệt:

| Dấu thanh tiếng Mường | Phím gõ Telex | Mã Unicode kết hợp | Tên ký tự Unicode |
|---|:---:|:---:|---|
| **Dấu Sắc** | `s` | `U+0301` | Combining Acute Accent |
| **Dấu Huyền** | `f` | `U+0312` | Combining Turned Comma Above |
| **Dấu Hỏi** | `r` | `U+0309` | Combining Hook Above |
| **Dấu Ngã** | `x` | `U+0303` | Combining Tilde |
| **Dấu Nặng (Dấu dưới)** | `j` | `U+032D` | Combining Circumflex Accent Below |
| **Xóa dấu đã gõ** | `z` | — | Khôi phục nguyên âm gốc |

> [!TIP]
> Để xóa dấu thanh vừa bỏ, bạn có thể gõ phím `z` hoặc gõ lặp lại chính phím dấu đó (ví dụ: `as` -> `á`, gõ thêm `s` -> `as`).

---

### 4.2. Nguyên âm đôi / Nhân đôi nguyên âm bằng phím `q` / `Q`

Trong ngữ âm tiếng Mường, các nguyên âm kéo dài/nhân đôi xuất hiện rất phổ biến. Kiểu gõ `TELEX_MUONG` bổ sung cơ chế nhân đôi nguyên âm tiện lợi thông qua phím **`q`**:
- Gõ nguyên âm bất kỳ + `q` sẽ tự động nhân đôi nguyên âm đó:
  - `aq` $\rightarrow$ `aa`
  - `eq` $\rightarrow$ `ee`
  - `oq` $\rightarrow$ `oo`
  - `uq` $\rightarrow$ `uu`
  - `iq` $\rightarrow$ `ii`
- Nếu gõ tiếp phím `q` một lần nữa, hệ thống sẽ khôi phục lại chữ tiếng Anh ban đầu (ví dụ: `aq` $\rightarrow$ `aa`, gõ tiếp `q` $\rightarrow$ `aq`).

---

### 4.3. Quy tắc gõ chữ `w` trong tiếng Mường

- Trong tiếng Việt thông thường, chữ `w` được dùng làm phím tắt để gõ chữ `ư` hoặc dấu trăng (`ă`), móc (`ơ`, `ư`).
- Trong **tiếng Mường**, chữ `w` là một phụ âm/âm đệm/âm cuối rất phổ biến (ví dụ: *kwál, kwel, khwách, kew, mew, kwew, khwew*).
- Do đó, trong kiểu gõ `TELEX_MUONG`:
  - Phím `w` hoạt động trực tiếp như ký tự **`w`** khi đứng sau phụ âm hoặc độc lập.
  - Các kết hợp như `uw`, `aw`, `ow` được xử lý thông minh để không làm mất chữ `w` trong từ vựng tiếng Mường.

---

### 4.4. Các chữ cái có mũ (`â`, `ê`, `ô`) và chữ `đ`

Cách gõ mũ theo chuẩn Telex truyền thống được giữ nguyên:
- `aa` $\rightarrow$ `â`
- `ee` $\rightarrow$ `ê`
- `oo` $\rightarrow$ `ô`
- `dd` $\rightarrow$ `đ`

---

### 4.5. Các phím tắt ký tự đặc biệt tiếng Mường

Bộ gõ cung cấp các phím tắt nhanh để nhập các ký tự đặc biệt:
- Phím `[` $\rightarrow$ Ký tự tắt tiếng Mường 1 (ơ / dấu đặc thù).
- Phím `]` $\rightarrow$ Ký tự tắt tiếng Mường 2 (ư / dấu đặc thù).
- Phím `\` $\rightarrow$ Ký tự tắt tiếng Mường 3.

---

## 5. Tính năng Tự động sửa lỗi chính tả (`Auto fix spell`)

Trong bảng tùy chọn nâng cao của UniKey-Muong có mục **"Tự động sửa lỗi chính tả" (Auto fix spell)**:
```
[x] Tự động sửa lỗi chính tả (Auto fix spell)
```

Khi bật tùy chọn này và sử dụng kiểu gõ `TELEX_MUONG`, mỗi khi bạn gõ xong một từ và nhấn **phím Cách (Spacebar)**, bộ gõ sẽ tự động kiểm tra và chuẩn hóa từ vừa gõ theo quy tắc chính tả chữ Mường:

1. **Phụ âm `c`, `q`**:
   - Chữ `c` ở đầu từ (nếu không đi với `h` tạo thành `ch`) sẽ được chuyển thành **`k`**.
   - Chữ `q` ở đầu từ sẽ chuyển thành **`k`**.
   - Cụm `qu` kết hợp với nguyên âm sẽ chuyển thành **`kw`** (ví dụ: *qua* $\rightarrow$ *kwa*).
2. **Phụ âm `tr`**:
   - `tr` ở đầu từ được tự động chuyển thành **`ch`**.
3. **Phụ âm `d`, `g`, `gi`, `gh`**:
   - `gi` đầu từ $\rightarrow$ rút gọn thành **`g`**.
   - `gh` đầu từ $\rightarrow$ rút gọn thành **`g`**.
   - `d` hoặc `g` đứng đầu từ $\rightarrow$ chuyển đổi thành **`z`**.
4. **Phụ âm `s`**:
   - Chữ `s` đứng đầu từ được chuyển thành **`x`**.
5. **Âm đệm `w`**:
   - Nếu đã có âm `w`, các chữ thừa `u`, `o` đi liền sau sẽ được tự động lược bỏ.
   - Cụm `kho`, `khu` (trừ trường hợp ngoại lệ *khua*) sẽ được tự động chuyển thành **`khw`**.
6. **Bán âm `y`**:
   - Chữ `y` đơn sẽ được chuẩn hóa thành **`i`**.

---

## 6. Các tính năng nâng cao & Phím tắt hệ thống

### Phím chuyển đổi nhanh Chế độ Gõ (Switch Key)
Bạn có thể chuyển đổi qua lại giữa chế độ gõ Mường/Việt và tiếng Anh mà không cần mở bảng điều khiển:
- **`Ctrl + Shift`** (Mặc định)
- hoặc **`Alt + Z`**

### Khởi động cùng Windows (Auto-run at boot time)
- Chọn checkbox **"Khởi động cùng Windows" (Auto-run UniKey-Muong at boot time)** trong hộp thoại điều khiển.
- UniKey-Muong sẽ tự động chạy ngầm dưới khay hệ thống mỗi khi bạn mở máy tính.

### Bảng gõ tắt (Macro Table)
- Hỗ trợ gõ tắt từ/cụm từ dài:
  1. Đánh dấu chọn **"Cho phép gõ tắt" (Enable macros)**.
  2. Bấm vào nút **Bảng gõ tắt (Macro table...)**.
  3. Nhập từ viết tắt vào ô *Thay thế (Replace)* và cụm từ đầy đủ vào ô *Bởi (With)* rồi nhấn **Thêm (Add)**.
  4. Nhấn **Lưu (Save)**.

### Công cụ chuyển mã (UniKey-Muong Toolkit)
Nhấn tổ hợp phím **`Ctrl + Shift + F6`** hoặc nhấp chuột phải vào biểu tượng khay hệ thống và chọn **Công cụ... (Toolkit)**:
- **Chuyển mã Clipboard**: Chuyển đổi toàn bộ văn bản đang copy từ bảng mã này sang bảng mã khác chỉ với 1 click.
- **Chuyển mã tập tin**: Chọn tệp nguồn và tệp đích để chuyển đổi bảng mã hàng loạt.
- **Tùy chọn văn bản**:
  - Chuyển sang chữ hoa (To upper case).
  - Chuyển sang chữ thường (To lower case).
  - Loại bỏ dấu thanh (Remove tone marks).
  - Không sử dụng rich text (Plain text only).

---

## 7. Khắc phục sự cố thường gặp (FAQ & Troubleshooting)

### 1. Dấu tiếng Mường hiển thị thành ô vuông hoặc ký tự lạ?
- **Nguyên nhân**: Phông chữ bạn đang dùng trong Word hoặc trình duyệt không hỗ trợ các ký tự dấu tổ hợp (Combining Diacritical Marks) của Unicode như `U+0312` hay `U+032D`.
- **Cách xử lý**: Đổi font chữ của đoạn văn bản sang **Times New Roman**, **Arial**, **Segoe UI**, hoặc các font chuyên dụng cho ngôn ngữ dân tộc như **Charis SIL**, **Doulos SIL**.

### 2. Không gõ được tiếng Mường trong một số ứng dụng hoặc Game?
- **Nguyên nhân**: Ứng dụng mục tiêu đang chạy dưới quyền Quản trị viên (Administrator), trong khi UniKey-Muong đang chạy dưới quyền người dùng thông thường.
- **Cách xử lý**: Tắt UniKey-Muong dưới khay hệ thống, sau đó nhấp chuột phải vào `UniKey-Muong.exe` và chọn **Run as administrator**.

### 3. Có thể gõ tiếng Việt có dấu bình thường trên UniKey-Muong không?
- **Hoàn toàn được**: Bạn chỉ cần chuyển **Bảng mã** về `Unicode` và **Kiểu gõ** về `TELEX` hoặc `VNI`. Khi cần gõ tài liệu tiếng Mường, chuyển lại sang `Unicode Muong` và `TELEX_MUONG`.

### 4. Làm thế nào để sao lưu các cài đặt cá nhân?
- Các thiết lập được lưu trữ an toàn trong Windows Registry tại khóa:
  `HKEY_CURRENT_USER\Software\PkLong\UniKey-Muong`

---

## 8. Thông tin bản quyền & Đóng góp

- **Dự án gốc UniKey**: Tác giả **Phạm Kim Long** (http://unikey.org).
- **Kho mã nguồn gốc tiếng Mường**: Được phát triển bởi **nhvu95** (HieuNguyenVu) tại [https://github.com/nhvu95/unikey-muong-language](https://github.com/nhvu95/unikey-muong-language).
- **Kho mã nguồn hiện tại**: [https://github.com/xuanhaivptthn/unikey-muong-language](https://github.com/xuanhaivptthn/unikey-muong-language)
- **Giấy phép**: GNU General Public License (GPL) version 2.0.
