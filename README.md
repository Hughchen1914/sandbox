# 🔥 沙盒 Sandbox

> 自主迭代沙盒 — 基于 git keep/revert 协议

让 AI agent（Claude Code / Codex / OpenClaw）在安全环境里自动改代码、跑测试、保留好结果、回退坏结果，持续迭代进化。

## 核心协议

```
agent 读 program.md 理解任务
  → 改 main.py
  → 跑 test.py
  → 读 results.txt
  → 好了 → git commit [keep]
  → 坏了 → git checkout 回退
  → 重复
```

## 文件结构

```
sandbox/
├── program.md    ← AI 读的自主迭代协议
├── task.md       ← 具体任务描述（用户写）
├── main.py       ← AI 可编辑的目标文件
├── test.py       ← 测试/回测脚本
├── results.txt   ← 每次运行结果
└── loop.sh       ← 启动器
```

## 快速开始

```bash
cd sandbox
./loop.sh "任务描述" 50  # 最多50轮
```

## 灵感来源

karpathy/autoresearch (82816⭐) 的 program.md + git keep/revert 架构

## 许可

MIT
