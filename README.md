# API LLM không kiểm duyệt cho lập trình viên Việt Nam

> API tương thích OpenAI cho dev Việt Nam. Tiếng Việt tự nhiên, streaming, tool calling, không chèn đoạn cảnh báo vào mỗi câu trả lời. Base: https://uncensored-llm.sbs/v1

**API:** https://uncensored-llm.sbs/v1
**Trang:** https://uncensored-llm.sbs

Nếu từng dùng mô hình ngôn ngữ để viết về chính trị, sức khỏe, an ninh mạng hay bất kỳ chủ đề nào bị nhà cung cấp nước ngoài coi là nhạy cảm, bạn biết kết quả: từ chối chung chung, đoạn cảnh báo thay cho nội dung, câu trả lời bỏ dở. Trang này mô tả một lựa chọn trực tiếp — API tương thích OpenAI, trả lời đúng câu hỏi được đặt ra.

## Vì sao điều này quan trọng với dev Việt Nam

Sản phẩm tiếng Việt cần mô hình viết đúng văn phong bản địa, không phải bản dịch cứng từ tiếng Anh. Khó chịu hơn là khi mô hình từ chối những chủ đề hoàn toàn bình thường — học phí, vay vốn, sức khỏe, an toàn thông tin — vì chính sách thiết kế cho thị trường khác. Với API này bạn vẫn dùng SDK OpenAI, vẫn có tool calling, vẫn streaming, nhưng phạm vi sản phẩm do đội bạn quyết. Ranh giới duy nhất được giữ là nội dung trái pháp luật.

## Ví dụ gọi API

```bash
export UNLLM_KEY="sk-..."
curl https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"Giải thích ngắn gọn cách tính vốn hóa thị trường của một đồng crypto."}],"stream":true}'
```

```python
# pip install openai
from openai import OpenAI
client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key="sk-...")
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "Giải thích ngắn gọn cách tính vốn hóa thị trường của một đồng crypto."}],
)
print(r.choices[0].message.content)
```

```javascript
import OpenAI from "openai";
const ai = new OpenAI({ baseURL: "https://uncensored-llm.sbs/v1", apiKey: process.env.UNLLM_KEY });
const r = await ai.chat.completions.create({ model: "uncensored-llm", messages: [{ role: "user", content: "Giải thích ngắn gọn cách tính vốn hóa thị trường của một đồng crypto." }] });
console.log(r.choices[0].message.content);
```

## Thường được dùng cho

| Trường hợp | Lý do |
|---|---|
| Chăm sóc khách hàng | Bot giải quyết vấn đề thay vì đọc lại điều khoản. |
| Nội dung tiếng Việt | Bài viết, kịch bản, email đúng văn phong bản địa. |
| Nghiên cứu bảo mật | Kiểm thử tấn công có văn bản cho phép của khách hàng. |
| Truyện người lớn (18+) | Cảnh thân mật giữa người lớn, không cắt cảnh. |

## Độ trễ từ thành phố của bạn

Độ trễ phụ thuộc nhà mạng, không phụ thuộc quốc tịch. Hãy đo từ máy bạn trước:

```bash
curl -o /dev/null -s -w '%{time_total}s\n' https://uncensored-llm.sbs/v1/models
```

| Thành phố | Khu vực |
|---|---|
| Hà Nội | Miền Bắc |
| TP. Hồ Chí Minh | Miền Nam |
| Đà Nẵng | Miền Trung |
| Hải Phòng | Miền Bắc |
| Cần Thơ | Miền Nam |
| Nha Trang | Miền Trung |
| Huế | Miền Trung |
| Vũng Tàu | Miền Nam |
| Đà Lạt | Tây Nguyên |
| Buôn Ma Thuột | Tây Nguyên |
| Quy Nhơn | Miền Trung |

## Câu hỏi thực tế

### Có thật sự tương thích OpenAI?

Có. /v1/chat/completions, /v1/models và streaming SSE dùng đúng định dạng sự kiện. SDK chính thức chạy chỉ bằng cách đổi base_url.

### Có gói miễn phí hoặc dùng thử?

Điều kiện hiện hành được công bố tại https://uncensored-llm.sbs. Mọi thay đổi giá đều thông báo ở đó, không phải trong repo này.

### Nội dung gì bị chặn?

Nội dung trái pháp luật, bao gồm mọi tài liệu liên quan đến người dưới 18 tuổi. Ngoài phạm vi đó, câu trả lời bám theo yêu cầu.

### Dùng được với Open WebUI hay LibreChat?

Được. Cả hai nhận base URL kiểu OpenAI, chỉ cần điền https://uncensored-llm.sbs/v1 và API key.

### Bảo vệ API key thế nào?

Đặt trong biến môi trường theo từng môi trường, xoay vòng định kỳ, không bao giờ để ở frontend hay repo công khai.

## Tài liệu này bằng ngôn ngữ khác

- [pt-BR] https://brown1023.github.io/llm-api-sem-censura-brasil/
- [es-419] https://brown1023.github.io/api-llm-sin-censura-latam/
- [id-ID] https://ryuuless.github.io/uncensored-llm-api-indonesia/
- [tr-TR] https://askcode24.github.io/sansursuz-llm-api-turkiye/
- [de-DE] https://askcode24.github.io/uncensored-llm-api-deutschland/
- [es-ES] https://palazuel0s2004.github.io/api-llm-sin-censura-espana/
- [it-IT] https://palazuel0s2004.github.io/llm-api-senza-censura-italia/
- [en-IN] https://nirav0712.github.io/uncensored-llm-api-india/
- [en-PH] https://nirav0712.github.io/uncensored-llm-api-philippines/
- [ar] https://mohamedabderrehman.github.io/uncensored-llm-api-arabia/
- [ar-EG] https://mohamedabderrehman.github.io/uncensored-llm-api-egypt/

---

uncensored-llm.sbs — API tương thích OpenAI. Nội dung trái pháp luật, gồm mọi tài liệu liên quan đến người dưới 18 tuổi, bị chặn. Phần còn lại thuộc trách nhiệm người gọi.