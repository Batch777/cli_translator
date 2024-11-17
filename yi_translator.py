from openai import OpenAI
import sys

from langchain_openai import ChatOpenAI


from langchain_core.prompts import ChatPromptTemplate


def get_response(text):
    llm = ChatOpenAI(
        openai_api_base="https://api.lingyiwanwu.com/v1",
        openai_api_key="YOUR_API_KEY",
        model="yi-lightning",
    )
    prompt = ChatPromptTemplate.from_messages(
        [
            (
                "system",
                "你是一个有用的翻译助手将{input_language}翻译为{output_language}.",
            ),
            ("human", "{input}"),
        ]
    )
    chain = prompt | llm
    temp_input = {
        "input_language": "英文",
        "output_language": "中文",
        "input": text,
    }
    for chunk in chain.stream(temp_input):
        print(chunk.content, end="", flush=True)


if __name__ == "__main__":
    # 输出结果

    text = ""
    # 打印接收到的所有参数
    if len(sys.argv) > 1:
        for arg in sys.argv[1:]:
            text += arg.strip()
    else:
        print("未收到任何输入。")
    # 你可以在这里对字符串进行进一步处理
    get_response(text)
