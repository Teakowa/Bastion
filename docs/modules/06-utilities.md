# 06. 通用工具层（`utilities/`）

`utilities/` 是项目最核心的复用层，包含 26 个文件，分为三类：子程序、系统规则、开发工具。

## A. 子程序（可复用动作）

- `updatePlayerStats.opy`：统一刷新移速/承伤/治疗/击退参数
- `setEventDuration.opy`：事件倒计时 HUD 追踪
- `resetPlayerCD.opy`：重置技能冷却
- `setPlayerSize.opy`：体型缩放
- `setPlayerHP.opy`：根据 size/heart_steel 计算并设置最大生命
- `startCombatRegen.opy`：触发战斗后再生逻辑
- `setThirdPerson.opy`：切换三人称摄像机
- `savePlayerData.opy`：存档（按玩家字符串索引）
- `progressHero.opy`：推进英雄进度并落盘
- `setPlayerEvent.opy`：分配并写入玩家事件
- `clearPlayerEvent.opy`：事件收尾与状态回收
- `setDifficulty.opy`：难度文本与颜色初始化
- `setPlayerTitle.opy`：计算玩家可用称号集合
- `unlockAchievement.opy`：通用成就解锁
- `createBastionBot.opy`：补齐堡垒 dummy

## B. 系统规则

- `mapDetection.opy`：地图判定与后备 raycast 识别
- `healthPool.opy`：临时生命池过期清理
- `playerRegen.opy`：被动再生系统（信号触发）
- `dashDetector.opy`：位移/相位技能状态检测
- `removeFromBlacklist.opy`：黑名单踢出
- `hashtag.opy`：成就可用性开关与完整性检查
- `anticrash.opy`：服务器负载保护（慢动作降载）
- `overhealthDecay.opy`：过量生命衰减（当前禁用）

## C. 开发工具

- `devTool.opy`：大型调试菜单
  - 难度、重开、目标玩家
  - 无敌/空中行走/传送门
  - 事件权重动态调试
  - debug HUD

## 关键实现模式

- 通过 `wait(getAverageServerLoad()/...)` 做负载自适应节流
- 长循环均包含 wait，避免无等待循环
- 高复用动作封装为 subroutine，规则中只做触发与组合

## 易错点

- 事件结束后若忘记 `clearPlayerEvent()`，容易残留状态
- 新增属性修正时需记得并入 `updatePlayerStats()`
- 生命池类功能（`hp_data`）必须维护过期清理，否则元素数会累积
