---
name: session-skill-maintainer
description: 总结 Bastion 最近 session 并编排 skills 维护改造的总控流程。Use when user asks to summarize recent sessions, identify reusable workflow patterns, and propose/update Bastion skill docs with verifiable checks and drift controls.
---

# Session Skill Maintainer

用于“近期 session 复盘 + skill 改造编排”。按最小改动执行，不做无关代码改动。

## 1) 触发条件

满足任一条件时使用：

1. 用户要求总结最近几天/几周 session 内容。
2. 用户要求新增 skill 或优化现有 skill。
3. 用户要求把重复流程固化为可复用模板与检查清单。

## 2) 必改真源

1. Session 真源：`/Users/teakowa/.codex/memories/MEMORY.md`（必要时查对应 rollout summary）。
2. Bastion 路由真源：`AGENTS.md` 与 `docs/agents/*.md`。
3. Skill 真源：`skills/*/SKILL.md` 与 `skills/*/references/*`。

约束：

1. AGENTS 仅保留路由/指针，不复制完整技能规范。
2. 保持技能触发语义兼容，不随意改 skill 名称。

## 3) 生成/同步

1. 输出最近 session 摘要，默认采用“Bastion 优先 + 跨仓通用经验附录”。
2. 将复盘结论映射为 skill 变更建议：
- 去重重复规则。
- 对齐命令真值到 `package.json`。
- 增加失败处理和 stop-rule。
3. 新增/更新模板文件时，复用本 skill 的模板结构。

固定输出四段：

1. `Session 摘要`
2. `Skill 变更建议`
3. `验证命令`
4. `未决风险`

## 4) 验证

执行 [references/maintenance-template.md](references/maintenance-template.md) 的校验命令：

1. 结构完整性检查（skill/references/agents）。
2. 命令真值检查（与 `package.json` 一致）。
3. 红线规则覆盖检查（顺序语义、生成产物、枚举/COUNT 约束）。

## 5) 交付说明

交付时必须说明：

1. 本次 session 摘要覆盖范围与时间窗口。
2. 新增/优化了哪些 skill 与模板。
3. 执行了哪些验证命令，哪些未执行及原因。
4. 仍需后续人工决策的风险点。
