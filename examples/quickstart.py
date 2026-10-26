# API LLM không kiểm duyệt cho lập trình viên Việt Nam — quickstart
# pip install openai
import os
from openai import OpenAI

client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key=os.environ["UNLLM_KEY"])
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "Giải thích ngắn gọn cách tính vốn hóa thị trường của một đồng crypto."}],
)
print(r.choices[0].message.content)
