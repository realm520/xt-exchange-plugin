# XT Exchange Plugin for Claude Code

XT.COM 交易所 Claude Code Plugin，支持现货和合约的渐进式交互操作。

## 功能

**现货（sapi.xt.com）**
- 行情：ticker / 24h / 盘口 / K线 / 交易对信息
- 账户：余额 / 当前挂单 / 历史订单
- 交易：限价/市价买卖 / 撤单 / 全部撤单
- 资产：账户划转 / 提币

**合约（fapi.xt.com，USDT-M 永续）**
- 行情：ticker / 盘口 / 资金费率 / K线
- 账户：账户权益 / 当前持仓 / 当前委托
- 交易：开多/开空（限价/市价）/ 平仓 / 撤单 / 历史委托

## 安装

在 Claude Code 中执行：

```
claude plugin marketplace add realm520/xt-exchange-plugin
claude plugin install xt-exchange@realm520-xt-exchange-plugin
```

> Python 依赖（requests）会在首次 Claude Code 会话启动时自动安装（通过 SessionStart hook）。

## 配置 API Key

```bash
mkdir -p ~/.xt-exchange
cat > ~/.xt-exchange/credentials.json << 'EOF'
{
  "access_key": "你的 Access Key",
  "secret_key": "你的 Secret Key"
}
EOF
chmod 600 ~/.xt-exchange/credentials.json
```

API Key 需要在 XT.COM 的 API 管理页面开启以下权限：
- 读取（查询行情/账户）
- 交易（下单/撤单/开平仓）
- 划转（账户间划转）
- 提币（提现到外部地址）

## 使用

在 Claude Code 中输入 `/xt-exchange`，按提示操作即可。

## 注意事项

- **提币不可撤销**，执行前会展示完整参数并要求确认
- 下单/开仓前均需用户确认
- 合约数量单位为"张"（整数），不同品种 contractSize 不同
- 划转账户类型：`SPOT` / `LEVER` / `FUTURES_U`（USDT本位）/ `FUTURES_C`（币本位）

## 依赖

- Python 3.8+
- requests >= 2.28.0
