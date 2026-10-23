# UniKey-Muong

**UniKey-Muong** là bộ gõ tiếng Mường cho hệ điều hành Windows, phát triển dựa trên dự án mã nguồn mở UniKey của tác giả Phạm Kim Long.

---

## 📌 Nguồn gốc & Đóng góp (Credits & Attribution)

- **Dự án gốc UniKey**: Tác giả **Phạm Kim Long** ([http://unikey.org](http://unikey.org)).
- **Kho mã nguồn gốc tiếng Mường**: Được phát triển ban đầu bởi **nhvu95** (HieuNguyenVu) tại [https://github.com/nhvu95/unikey-muong-language](https://github.com/nhvu95/unikey-muong-language).
- **Kho mã nguồn hiện tại**: [https://github.com/xuanhaivptthn/unikey-muong-language](https://github.com/xuanhaivptthn/unikey-muong-language)
- **Giấy phép bản quyền**: GNU General Public License (GPL) version 2.0.

---

## 🚀 Tính năng nổi bật

- **Bảng mã chuyên dụng**: `Unicode Muong` (chuẩn Unicode tổ hợp riêng theo thanh điệu tiếng Mường).
- **Kiểu gõ chuyên dụng**: `TELEX_MUONG`.
  - Phím gõ dấu thanh điệu: `s` (sắc), `f` (huyền), `r` (hỏi), `x` (ngã), `j` (nặng/mũ ngược dưới), `z` (xóa dấu).
  - Phím `q` / `Q` nhân đôi nguyên âm (vd: `aq` $\rightarrow$ `aa`).
  - Hỗ trợ chữ `w` tự do làm phụ âm đầu, âm đệm, âm cuối mà không bị can thiệp như tiếng Việt.
- **Tự động sửa lỗi chính tả (Auto fix spell)**: Tự động chuẩn hóa các âm tiết theo quy tắc ngữ âm tiếng Mường khi nhấn phím Cách.
- **Tương thích toàn diện**: Hiện đại hóa cho Visual Studio 2026 / MSVC `v145` và Windows 10/11 SDK.
- **Chạy trực tiếp (Portable)**: Biên dịch tĩnh độc lập (`/MT`), không đòi hỏi cài thêm bất kỳ Visual C++ Redistributable nào.

---

## 📖 Hướng dẫn sử dụng

Xem tài liệu hướng dẫn sử dụng và bảng tra cứu quy tắc gõ chi tiết tại:  
👉 **[MANUAL.md](MANUAL.md)**

---

## 🛠 Hướng dẫn biên dịch (Build Instructions)

Để tự động biên dịch và tạo gói phát hành `.zip` hoàn chỉnh:
```cmd
build_release.bat
```
Gói phát hành độc lập sẽ được tạo tại:
- Thư mục: `publish/UniKey-Muong/`
- Tệp nén: `publish/UniKey-Muong-Release.zip`
