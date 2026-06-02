# 🚀 Tài liệu Học Keymap Neovim của bạn

> Phím **Leader** của bạn là: `Space` (Phím cách).
> *(Khi thấy chữ `<leader>`, hãy bấm phím `Space` rồi bấm phím tiếp theo)*

## ⚙️ 1. Hệ thống (System & Config)
| Phím tắt | Lệnh | Mô tả |
| :--- | :--- | :--- |
| `<leader> <leader>` | `source %` | **Reload cấu hình.** Lưu và nạp lại file đang mở. (Chỉ chạy nếu đang mở file). |
| `<leader> x` | `chmod +x %` | **Cấp quyền thực thi** cho file hiện tại (Chạy script bash dễ dàng). |
| `<leader> fp` | `expand("%:~")` | **Copy đường dẫn file** hiện tại vào clipboard. |

---

## 🏃 2. Di chuyển (Motion & Navigation)
| Phím tắt | Mô tả chi tiết |
| :--- | :--- |
| `Ctrl + d` | Cuộn màn hình xuống một nửa, đồng thời **giữ con trỏ ở giữa màn hình**. |
| `Ctrl + u` | Cuộn màn hình lên một nửa, **giữ con trỏ ở giữa màn hình**. |
| `n` | Tìm kiếm kết quả tiếp theo (Next), **theo sau bởi việc căn giữa màn hình** (`nzzzv`). |
| `N` | Tìm kiếm kết quả trước đó (Prev), **theo sau bởi việc căn giữa màn hình** (`Nzzzv`). |
| `J` *(Normal Mode)* | Kéo dòng phía dưới nối vào dòng hiện tại, **nhưng vẫn giữ nguyên vị trí con trỏ** (không bị nhảy về cuối câu). |

---

## ✂️ 3. Copy, Paste & Xóa (Yank & Delete & Visual)
Neovim mặc định sẽ lưu những gì bạn vừa xoá vào trong Clipboard (Bộ nhớ tạm). Các phím tắt này giải quyết triệt để sự khó chịu đó!

| Phím tắt | Chế độ | Mô tả |
| :--- | :--- | :--- |
| `<leader> p` | Visual (Bôi đen) | **Tuyệt chiêu Paste đè:** Dán đè lên text mà KHÔNG lưu text bị xoá vào clipboard. |
| `p` | Visual | Dán đè lên text (giống `Leader + p`). |
| `<leader> d` | Normal / Visual | Xóa văn bản mà **không đưa vào Clipboard**. |
| `x` | Normal | Xóa 1 ký tự mà **không đưa vào Clipboard**. |
| `<leader> Y` | Normal | **Copy nội dung vào Clipboard của hệ điều hành** (giống `Ctrl+C` ở Win). |
| `J` | Visual | **Kéo các dòng** đang bôi đen **xuống dưới**. |
| `K` | Visual | **Kéo các dòng** đang bôi đen **lên trên**. |
| `<` hoặc `>` | Visual | Lùi lề / Tăng lề (Thụt lề) mà **vẫn giữ nguyên trạng thái bị bôi đen**. |

---

## 🪟 4. Quản lý Màn hình (Split Windows)
| Phím tắt | Mô tả |
| :--- | :--- |
| `<leader> sv` | Chia dọc màn hình. |
| `<leader> sh` | Chia ngang màn hình. |
| `<leader> sx` | Đóng màn hình đang chọn. |
| `<leader> se` | Làm cho tất cả các màn hình có **kích thước bằng nhau**. |
| `Ctrl + Mũi tên`| **Tăng giảm kích thước** chiều rộng/cao cho cửa sổ. |

---

## 📑 5. Quản lý Tab
| Phím tắt | Mô tả |
| :--- | :--- |
| `<leader> to` | Mở 1 Tab **mới trống**. |
| `<leader> tx` | **Đóng** Tab hiện tại. |
| `<leader> tn` | Đi đến Tab **tiếp theo** (Next). |
| `<leader> tp` | Quay lại Tab **trước đó** (Prev). |
| `<leader> tf` | Mở file hiện tại ở một Tab mới. |

---

## 🛠 6. Công cụ lập trình (Code Tools)
| Phím tắt | Lệnh | Mô tả |
| :--- | :--- | :--- |
| `<leader> f` | `vim.lsp.buf.format` | **Format code** (Dùng LSP mặc định, không cần Prettier). |
| `<leader> lx` | `Toggle Diagnostics` | **Bật / Tắt lỗi hiển thị** do LSP báo trên màn hình. |
| `<leader> s` | Search & Replace | Tự động **tìm kiếm và thay thế toàn bộ (Global)** cho TỪ khóa đang nằm dưới con trỏ màn hình. |
| `Ctrl + c` | Normal / Insert | Trong Insert Mode: Hoạt động như nút **<ESC>**. Trong Normal Mode: Xóa hiệu ứng Highlight sau khi tìm kiếm (`nohl`). |
| `<C-f>` | tmux-sessionizer | Mở tab tmux mới cực nhanh. |

---

## 💻 7. Plugin AI & LeetCode
| Phím tắt | Plugin | Mô tả |
| :--- | :--- | :--- |
| `<leader> lc` | LeetCode | Mở giao diện LeetCode. |
| `<leader> lr` | LeetCode | **Chạy (Run)** bài test LeetCode. |
| `<leader> ls` | LeetCode | **Nộp bài (Submit)** LeetCode. |
| `<leader> ll` | LeetCode | Danh sách **Problems** LeetCode. |
| `<leader> cc` | Claude Code | Bật trình điều khiển của Claude Code. |

*(💡 Lưu ý: Ngoài ra, như plugin **Avante** ta vừa cài, mặc định bạn có thể dùng `<leader>aa` bật thanh chat AI và bôi đen Code + `<leader>ae` để nhờ AI sửa code).*
