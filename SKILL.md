---
name: sandbox
description: "Autonomous code iteration sandbox based on git keep/revert protocol. Use when: (1) running long-duration autonomous experiments, (2) iterating on code with automated testing, (3) letting AI agents self-improve scripts, (4) backtesting stock strategies, (5) optimizing parameters through trial-and-error loops."
---

# Sandbox — 自主迭代沙盒

让 AI agent（cbc/炀炀）在安全环境里自动改代码、跑测试、保留好结果、回退坏结果，持续迭代。

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
└── loop.sh       ← 启动器（调用 cbc 按协议循环）
```

## 使用方法

### 快速开始

```bash
cd sandbox
# 1. 写 task.md 描述任务
# 2. 确保 main.py 和 test.py 就绪
# 3. 启动迭代
./loop.sh "任务描述" 50  # 最多50轮
```

### task.md 规范

写清楚：目标、数据源、搜索方向、输出格式。

### test.py 规范

- 导入 main.py 中的函数
- 运行测试/回测
- 输出分数到 results.txt
- score 越低越好（或根据任务定义）
- status: PASS/FAIL

## 典型场景

- 股票策略回测调参
- 代码优化实验
- A/B 测试脚本迭代
- 任何需要「改代码→跑→看结果→保留或回退」的循环任务

## 配置 cron 自动运行

在 OpenClaw 中设置定时任务，让 sandbox 在指定时间自动启动并运行 N 轮。
