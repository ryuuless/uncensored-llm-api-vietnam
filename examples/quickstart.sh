#!/usr/bin/env bash
# API LLM không kiểm duyệt cho lập trình viên Việt Nam — quickstart
set -euo pipefail
: "${UNLLM_KEY:?export UNLLM_KEY=sk-...}"

curl -s https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"Giải thích ngắn gọn cách tính vốn hóa thị trường của một đồng crypto."}]}' | head -c 2000
echo
