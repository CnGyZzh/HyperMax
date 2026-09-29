<div align="center">

# HyperMax

### Xiaomi 17 Pro 高刷 · 触控 · 温控一体化调校模块

**144Hz 全局刷新率 · 300Hz 触控 · 四档温控 · 轻量 WebUI**

![Version](https://img.shields.io/badge/version-v2.2-blue)
![Device](https://img.shields.io/badge/device-Xiaomi%2017%20Pro-black)
![Maintainer](https://img.shields.io/badge/maintainer-Gy-brightgreen)

</div>

## 功能

| 功能 | 支持 |
|---|---|
| 刷新率 | 144 / 120 / 90 / 60 Hz |
| 开机默认刷新率 | 144 Hz |
| 触控 | 原机 / 300 Hz |
| 开机默认触控 | 300 Hz |
| 温控 | cool / pro / extreme / danger |
| 控制界面 | 轻量 WebUI |

## v2.2 TouchFix

- 修复切换“原机触控”后，被开机延迟 300Hz 补偿重新覆盖的问题。
- 300Hz 延迟补偿仅在当前状态仍为 300 时执行，不使用常驻轮询。
- 保留已验证的 144 / 120 / 90 / 60Hz 刷新率切换逻辑。
- 默认开机应用 144Hz + 300Hz。
- 集成四档温控配置切换与状态校验。
- 使用有限次数重试，尽量降低后台占用。

## 兼容性

当前版本针对 **Xiaomi 17 Pro** 调整。

> [!IMPORTANT]
> 144Hz 并非原厂标准刷新率，需要设备已经具备兼容的 144Hz 超频 DTBO / 显示模式支持。HyperMax 本身不会刷写 DTBO。

需要 Root 模块环境（KernelSU / 兼容实现）。不同系统版本、内核、DTBO 与厂商配置可能产生不同结果，刷入前请保留可恢复方案。

## 使用

刷入模块并重启后，默认使用 **144Hz + 300Hz**。WebUI 中可以切换刷新率、触控模式与四档温控。

高刷新率、触控参数及温控策略涉及设备底层行为，可能增加功耗、发热或稳定性风险；温度或稳定性异常时请及时恢复保守配置。

## Credits

- **温控原作者：苏疫杆菌** — https://www.coolapk.com/u/5807874
- **触控原作者：裤安不太热** — https://www.coolapk.com/u/1442593
- **HyperMax 修改 / 整合 / Xiaomi 17 Pro 适配：Gy**

HyperMax 是面向 Xiaomi 17 Pro 的整合与适配项目，不会将上游作者的工作声明为 Gy 的原创。若上游项目另有授权或转载要求，请以上游作者要求为准。

<div align="center">

Maintained by **Gy**

</div>
