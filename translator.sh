#!/bin/bash

# 定义 Python 脚本路径
PYTHON_SCRIPT="./yi_translator.py"

input_lines=()
# 无限循环
echo "输入t翻译，q退出"
while true; do
  # 提示用户输入
  read user_input

  if [ "$user_input" == "q" ]; then
    echo "退出程序。"
    break
    # 如果用户输入 't'，执行脚本
  elif [ "$user_input" == "t" ]; then
    # 检查是否有输入内容
    if [ ${#input_lines[@]} -eq 0 ]; then
      echo "没有输入内容。"
    else
      # 将数组内容传递给 Python 脚本
      echo "正在翻译..."
      python3 "$PYTHON_SCRIPT" "${input_lines[@]}"
      echo ""
      echo "翻译完毕。"
      # 清空数组以准备接收新的输入
      input_lines=()
    fi
  else
    # 如果输入不是 't' 或 'exit'，将其添加到数组中
    input_lines+=("$user_input")
    # echo "已添加到输入列表。"
  fi
  # 如果用户输入 'exit'，退出循环
done
