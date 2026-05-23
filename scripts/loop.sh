#!/bin/bash
# 沙盒启动器 — 让 cbc 或其他 agent 在 sandbox 里自主循环
# 用法：./loop.sh "任务描述" [最大轮次]

TASK="${1:-具体任务描述}"
MAX_ROUNDS="${2:-50}"

# 初始化 git（如果还没）
if [ ! -d .git ]; then
  git init
  git add -A
  git commit -m "sandbox init"
fi

echo "=== 沙盒启动 ==="
echo "任务: $TASK"
echo "最大轮次: $MAX_ROUNDS"
echo "协议: program.md"
echo ""

# 更新 program.md 中的任务描述
sed -i '' "s/{任务描述由炀炀填写}/$TASK/" program.md

# 交给 cbc 执行
cbc -p --permission-mode bypassPermissions "$(cat << INNER
你在执行一个自主迭代实验。协议文件是 sandbox/program.md。

工作目录：/Users/chenmingze/.openclaw/workspace/sandbox

任务：$TASK

执行循环：
1. 读 program.md 理解协议
2. 读 task.md 理解具体任务
3. 修改 main.py
4. 运行 python3 test.py
5. 读 results.txt
6. git keep/revert
7. 重复直到目标达成或达到 $MAX_ROUNDS 轮

开始。
INNER
)"
