#!/bin/bash

# 定义 Python 脚本路径
SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
PYTHON_SCRIPT=$SCRIPT_DIR"/yi_translator.py"

empty_lines=0
input_lines=()

echo "一个空输入将执行翻译"

# 循环读取输入
while true; do
  read input
  # 如果输入为空，增加空行计数器
  if [ -z "$input" ]; then
    echo "正在翻译..."
    # 当收集到输入后，调用Python脚本并将数组作为参数传递
    if [ ${#inputs[@]} -gt 0 ]; then
      # 调用Python脚本并传递数组内容作为参数
      python3 $PYTHON_SCRIPT "${inputs[@]}"
      inputs=()
      empty_lines=0
      echo ""
    else
      echo "没有输入内容传递给Python脚本。"
    fi
  else
    # 重置空行计数器
    inputs+=("$input")
  fi
done
