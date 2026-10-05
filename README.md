<div align="center">

<img src="assets/readme-banner.svg" width="100%" alt="HyperMax" />

# HyperMax

**Xiaomi 17 Pro · Refresh Rate / Touch / Thermal**

[![Profile](https://img.shields.io/badge/CnGyZzh-Gy-181717?logo=github)](https://github.com/CnGyZzh)
[![Level](https://img.shields.io/badge/Hub-Level-6f42c1)](https://github.com/CnGyZzh/Level)
[![Device](https://img.shields.io/badge/Device-Xiaomi_17_Pro-orange)](#compatibility)

[保留版本](#maintained-builds) · [安装](#install) · [兼容性](#compatibility) · [致谢](#credits)

</div>

## Maintained builds

当前只维护两条版本线：

| 版本 | 刷新率 | 触控 | 温控 | 定位 |
| :--- | :---: | :---: | :---: | :--- |
| **v2.5.0 NoThermal** | 144 / 120 / 90 / 60Hz | 原机 / 300Hz | — | 极简高刷 + 300Hz 触控 |
| **v4.1.0 ThermalBindMount** | 144 / 120 / 90 / 60Hz | 原机 / 300Hz | ✓ | Bind Mount 温控版 |

### v2.5.0 · NoThermal

- 只保留刷新率与触控，不接管温控。
- 默认面向 **144Hz + 300Hz** 使用场景。
- Monet / FastUI WebUI。
- 无常驻轮询。
- [下载 Release](https://github.com/CnGyZzh/HyperMax/releases/tag/V2.5.0-NoThermal)

### v4.1.0 · ThermalBindMount

- 在高刷与 300Hz 触控基础上加入温控档位。
- 温控采用 **Bind Mount** 路线，减少直接改写系统配置。
- 包含 cool / pro / extreme / danger 四套配置。
- 保留 WebUI 与即时状态切换。

> 本仓库不再推荐早期 v2.2 / v2.4.x 等旧构建；维护入口只保留上面两条版本线。

## Features

| 模块 | 能力 |
| :--- | :--- |
| Refresh rate | 全局 144 / 120 / 90 / 60Hz |
| Touch | 原机 / 300Hz |
| WebUI | Material You / Monet 风格 |
| Thermal | 仅 ThermalBindMount 版本提供 |
| Recovery | 支持回退原机触控 / 较低刷新率 |

## Compatibility

> [!IMPORTANT]
> 当前针对 **Xiaomi 17 Pro**。144Hz 并非原厂标准刷新率，设备必须提前具备兼容的 **144Hz 超频 DTBO / 显示模式**。HyperMax **不会自动刷写 DTBO**。

推荐 KernelSU / KowSU 等兼容模块环境。系统版本、内核、面板、触控 IC、DTBO 或厂商配置不同，都可能导致行为差异。

## Install

1. 选择上方两条维护版本之一。
2. 使用兼容 Root 管理器安装 ZIP。
3. 重启设备。
4. 打开模块 WebUI 后再切换刷新率 / 触控 / 温控。
5. 如状态异常，先恢复原机触控与较低刷新率。

> [!WARNING]
> 高刷新率、触控参数与温控策略都可能增加功耗、发热或稳定性风险。请确认设备底层确实支持对应模式。

## Credits

- **触控原作者：裤安不太热** — [酷安主页](https://www.coolapk.com/u/1442593)
- **HyperMax 修改 / 整合 / Xiaomi 17 Pro 适配：Gy**
- 历史温控方案相关工作感谢原作者贡献

## Ecosystem

**[CnGyZzh Profile](https://github.com/CnGyZzh/CnGyZzh)** · **[Level](https://github.com/CnGyZzh/Level)** · **[WeType Monet](https://github.com/CnGyZzh/WeType_Monet-Gy)** · **[ZEEHO Auto](https://github.com/CnGyZzh/ZEEHO-Auto-Gy)**

---

<div align="center">

**HyperMax · Performance with control**

Maintained by **Gy**

</div>
