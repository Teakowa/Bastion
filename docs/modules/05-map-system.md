# 05. 地图系统（`map/`）

## 设计目标

- 每张图独立维护点位与地图流程
- 支持单图逃生与多段控制点/传送切图
- 与玩家进度系统、Bastion 生成逻辑解耦

## 聚合入口

- `src/map/setup_all_map.opy` 统一 include 全部地图文件
- 新增地图时必须同步更新该聚合文件

## 地图文件通用职责

每个地图文件通常设置以下变量：

- `bastionPosition`
- `endPosition`
- `resetPosition`
- `creditsPosition`
- 可选：`controlRespawnPosition`, `controlJumpPosition`, `controlRespawnAxis`, `controlRespawnAxisThreshold`
- 可选：`portalPosition`, `springBoardPosition`
- 可选：`__currentMapText___`, `__currentMapPioneerText___`

## 多段地图（典型）

三图挑战相关地图（如 `lijiang_tower`, `samoa`, `oasis`, `busan`, `nepal`）使用：

- `controlJumpPosition`：到达后切段
- `controlRespawnPosition`：切段后复活基准点
- `controlRespawnAxis*`：防止出生房偏移导致回档失败

## 代表性地图能力

- 传送门地图：`new_junk_city.opy`（`portalPosition`）
- 弹板地图：`temple_of_anubis.opy`, `esperanca.opy`（`springBoardPosition`）
- 子图判定地图：`ilios.opy`（按子图分支设置点位）

## 地图清单摘要（37 个文件）

- 单图：如 `dorado`, `eichenwalde`, `route66`, `kings_row`, `paraiso` 等
- 多段：`lijiang_tower`, `samoa`, `oasis`, `busan`, `nepal`, `rialto`, `new_junk_city`
- 新图/实验：`suravasa`, `hanaoka`, `aatlis`, `throne_of_anubis`

## 关联模块

- `utilities/mapDetection.opy`：地图识别
- `effects/init.opy`：终点/跳点可视化
- 入口主规则：切图传送与终点晋级

## 开发注意

- 点位优先维护在各地图文件，避免散落在入口。
- 添加新地图时，需验证：
  - Bastion 数量与 `bastionPosition` 长度一致
  - 终点触发半径可达
  - reset/third-person/world text 不重叠
