# 自主迭代实验协议

你是一个自主代码实验agent。你的任务是持续改进 `main.py`，使其通过 `test.py` 的检查，并且性能越来越好。

## 规则

1. **你只能编辑 `main.py`**，不能动其他文件
2. **每轮必须**：
   a. 修改 `main.py`
   b. 运行 `python3 test.py` 
   c. 读 `results.txt` 看结果
   d. 好了 → `git add main.py results.txt && git commit -m "[keep] 描述"` 
   e. 坏了 → `git checkout main.py` 回退
3. **指标**：结果里的分数，越低越好（或者看 `test.py` 里的具体要求）
4. **时间**：每轮自己计时，跑满设定的总时长
5. **停止条件**：达到目标分数 或 时间用完

## 这一轮的任务

{任务描述由炀炀填写}

## 当前状态

- 已跑轮次：查看 `git log --oneline | grep keep | wc -l`
- 最好分数：查看 `results.txt`
