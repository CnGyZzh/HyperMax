<div align="center">

<img src="assets/readme-banner.svg" width="100%" alt="HyperMax" />

# HyperMax

Xiaomi 17 Pro · 高刷 / 触控 / 温控整合适配

[下载模块](https://github.com/CnGyZzh/HyperMax/releases) · [兼容性](#兼容性) · [安装与使用](#安装与使用) · [作者与致谢](#作者与致谢)

</div>

## 功能概览

| 模块 | 能力 | 默认 |
| :-- | :-- | :--: |
| 🖥️ 刷新率 | 144 / 120 / 90 / 60 Hz | **144Hz** |
| 👆 触控 | 原机 / 300Hz | **300Hz** |
| 🌡️ 温控 | 夏日限定 / 深度定制 / 极致性能 / 丧心病狂 | **深度定制** |
| 🎛️ 控制 | 轻量 WebUI，即时切换 | ✓ |

### v2.2 · TouchFix

- 修复切回**原机触控**后，被开机延迟 300Hz 补偿再次覆盖的问题。
- 延迟补偿只在当前状态仍为 300Hz 时执行，**无常驻轮询**。
- 保留已验证的 144 / 120 / 90 / 60Hz 刷新率切换逻辑。
- 开机默认 **144Hz + 300Hz**，采用有限次数重试应对 HyperOS 启动阶段策略回写。
- 四档温控支持即时切换、状态校验和缺失配置保护。

## 兼容性

> [!IMPORTANT]
> 当前版本针对 **Xiaomi 17 Pro** 调整。144Hz 不是原厂标准刷新率，必须提前具备兼容的 **144Hz 超频 DTBO / 显示模式**。HyperMax **不会刷写 DTBO**。

建议使用 KernelSU / KowSU 等兼容 Root 模块环境。系统版本、内核、DTBO、触控 IC 或厂商配置不同都可能导致行为差异。

## 安装与使用

1. 从 [Releases](https://github.com/CnGyZzh/HyperMax/releases) 下载完整的 HyperMax ZIP，阅读该版本的更新说明。
2. 在兼容的 Root 管理器中刷入 ZIP。
3. 重启设备。
4. 打开模块 WebUI，切换触控、刷新率或温控档位。
5. 状态异常时优先恢复原机触控、较低刷新率或保守温控配置。

> [!WARNING]
> 高刷新率、触控参数和温控策略会改变设备底层行为，可能增加功耗、发热或稳定性风险。超频显示尤其依赖底层 DTBO 与面板支持。

## 下载与版本

完整可刷模块统一通过 **GitHub Releases** 发布。仓库主页仅保留项目说明，不提供散文件，避免误下载不完整模块。

此 README 记录 **HyperMax v2.2 · TouchFix**；最新版本与附件以 [Releases](https://github.com/CnGyZzh/HyperMax/releases) 为准。

不要将 GitHub 自动生成的 Source code 压缩包当作可刷模块；此仓库当前仅提供项目说明，模块使用 Release 附件分发。

## 排查与反馈

- **没有 144Hz 选项**：先确认设备已有兼容的超频 DTBO / 显示模式；本模块不会刷写 DTBO。
- **设置未生效**：检查系统、内核和 Root 环境是否匹配，记录 WebUI 显示的状态。
- **需要反馈**：在 [Issues](https://github.com/CnGyZzh/HyperMax/issues) 提供模块版本、机型、系统版本、Root 管理器和复现步骤。

此仓库用于发布说明与模块分发；兼容范围和行为以对应版本的 Release 说明为准。

## 作者与致谢

HyperMax 是针对 Xiaomi 17 Pro 的**整合与适配项目**，不会将上游作者的成果声明为 Gy 原创。

- **温控原作者：苏疫杆菌** — [酷安主页](https://www.coolapk.com/u/5807874)
- **触控原作者：裤安不太热** — [酷安主页](https://www.coolapk.com/u/1442593)
- **HyperMax 修改 / 整合 / Xiaomi 17 Pro 适配：Gy**

感谢原作者的工作。若上游项目另有授权、转载或分发要求，请以上游作者要求为准，因此本仓库暂不擅自添加 LICENSE。

---

<div align="center">

### HyperMax
**Performance, without the clutter.**

Maintained by **Gy**

</div>
