<div align="center">

<img src="assets/readme-banner.svg" width="100%" alt="HyperMax" />

# HyperMax

Xiaomi 17 Pro · 高刷 / 触控整合适配

**当前最新：v2.5.0 · 无温控版**

[下载模块](https://github.com/CnGyZzh/HyperMax/releases) · [兼容性](#兼容性) · [安装与使用](#安装与使用) · [作者与致谢](#作者与致谢)

</div>

## 功能概览

| 模块 | 能力 | 默认 |
| :-- | :-- | :--: |
| 🖥️ 刷新率 | 144 / 120 / 90 / 60 Hz | **144Hz** |
| 👆 触控 | 原机 / 300Hz | **300Hz** |
| 🎛️ 控制 | Material You / Monet 轻量 WebUI，即时切换 | ✓ |
| 🌡️ 温控 | **v2.5.0 无温控版不包含温控功能** | — |

### v2.5.0 · 无温控版

> [!NOTE]
> 本版本已将 HyperMax 的温控功能完整移除，仅保留触控与刷新率。

- 删除温控页面、温控状态和温控切换入口。
- 删除运行时温控脚本与相关组件，不再主动管理 `mi_thermald` 或温控档位。
- 从旧版升级时，如检测到 HyperMax 旧温控部署标记，会尝试一次性恢复 OEM 温控配置；之后交回系统接管。
- 保留 **原机 / 300Hz** 触控切换。
- 保留已验证的 **144 / 120 / 90 / 60Hz** 全局刷新率切换逻辑。
- 保留 Monet WebUI、FastUI 低延迟交互和状态核对优化。
- 无常驻轮询。

### v2.4.4 · GreenStatus FastUI（含温控历史版本）

- 修复 **KowSU / KernelSU WebUI 状态读取与解析**。
- 优化 **FastUI**，减少重复 Shell / SurfaceFlinger 状态查询。
- 保留触控、刷新率和四档温控功能。

### v2.2 · TouchFix

- 修复切回**原机触控**后，被开机延迟 300Hz 补偿再次覆盖的问题。
- 延迟补偿只在当前状态仍为 300Hz 时执行，**无常驻轮询**。
- 保留已验证的 144 / 120 / 90 / 60Hz 刷新率切换逻辑。

## 兼容性

> [!IMPORTANT]
> 当前版本针对 **Xiaomi 17 Pro** 调整。144Hz 不是原厂标准刷新率，必须提前具备兼容的 **144Hz 超频 DTBO / 显示模式**。HyperMax **不会刷写 DTBO**。

建议使用 KernelSU / KowSU 等兼容 Root 模块环境。系统版本、内核、DTBO、触控 IC 或厂商配置不同都可能导致行为差异。

## 安装与使用

1. 从 [Releases](https://github.com/CnGyZzh/HyperMax/releases) 下载完整的 HyperMax ZIP，确认选择 **v2.5.0 · 无温控版**。
2. 在兼容的 Root 管理器中刷入 ZIP。
3. 重启设备。
4. 打开模块 WebUI，切换触控或刷新率。
5. 状态异常时优先恢复原机触控或较低刷新率。

> [!WARNING]
> 高刷新率和触控参数会改变设备底层行为，可能增加功耗、发热或稳定性风险。超频显示尤其依赖底层 DTBO 与面板支持。

## 下载与版本

完整可刷模块统一通过 **GitHub Releases** 发布。仓库主页仅保留项目说明，不提供散文件，避免误下载不完整模块。

当前推荐版本为 **HyperMax v2.5.0 · 无温控版**。

历史 **v2.4.4** Release 仍保留，属于包含温控功能的旧版本；需要无温控版本时请选择 **V2.5.0-NoThermal**。

不要将 GitHub 自动生成的 Source code 压缩包当作可刷模块；模块使用 Release 附件分发。

## 排查与反馈

- **没有 144Hz 选项**：先确认设备已有兼容的超频 DTBO / 显示模式；本模块不会刷写 DTBO。
- **设置未生效**：检查系统、内核和 Root 环境是否匹配，记录 WebUI 显示的状态。
- **需要反馈**：在 [Issues](https://github.com/CnGyZzh/HyperMax/issues) 提供模块版本、机型、系统版本、Root 管理器和复现步骤。

## 作者与致谢

- **触控原作者：裤安不太热** — [酷安主页](https://www.coolapk.com/u/1442593)
- **HyperMax 修改 / 整合 / Xiaomi 17 Pro 适配：Gy**

历史含温控版本使用过苏疫杆菌的温控方案；**v2.5.0 无温控版已移除该功能及运行时组件**。感谢原作者此前的工作。

---

<div align="center">

### HyperMax
**Performance, without the clutter.**

Maintained by **Gy**

</div>
