# XT Exchange Plugin for Claude Code

A Claude Code plugin for interacting with the XT.COM exchange — spot and futures trading via a natural, progressive conversation interface.

## Features

**Spot Trading (sapi.xt.com)**
- Market data: ticker / 24h stats / order book / K-lines / symbol info
- Account: balance / open orders / order history
- Trading: limit/market buy & sell / cancel order / cancel all
- Assets: account transfer / withdrawal

**Futures Trading (fapi.xt.com, USDT-M perpetual)**
- Market data: ticker / order book / funding rate / K-lines
- Account: equity & margin / open positions / open orders
- Trading: open long/short (limit or market) / close position / cancel order / order history

## Installation

### Option 1 — `npx skills` (recommended)

```bash
npx skills add https://github.com/realm520/xt-exchange-plugin
```

### Option 2 — Claude Code plugin marketplace

Run in Claude Code:

```
claude plugin marketplace add realm520/xt-exchange-plugin
claude plugin install xt-exchange@realm520-xt-exchange-plugin
```

> Python dependencies (`requests`) are installed automatically on the first Claude Code session start via a `SessionStart` hook.

## API Key Setup

```bash
mkdir -p ~/.xt-exchange
cat > ~/.xt-exchange/credentials.json << 'EOF'
{
  "access_key": "your_access_key",
  "secret_key": "your_secret_key"
}
EOF
chmod 600 ~/.xt-exchange/credentials.json
```

Enable the following permissions in the XT.COM API Management page:
- **Read** — market data and account queries
- **Trade** — place and cancel orders
- **Transfer** — internal account transfers
- **Withdraw** — withdrawals to external addresses

## Usage

Type `/xt-exchange` in Claude Code and follow the prompts.

The plugin uses progressive disclosure — it asks one question at a time rather than showing a full menu, keeping interactions fast and context-efficient.

## Safety

- **Withdrawals are irreversible.** Full details (currency, chain, amount, fee, address) are shown and explicit confirmation is required before execution.
- All order placement, cancellation, and transfer actions require confirmation before execution.
- API credentials are stored locally at `~/.xt-exchange/credentials.json` with permissions set to owner-read-only (`600`).

## Notes

- Futures quantity is in **contracts** (integer). Contract size varies by symbol (e.g. BTC = 0.001 BTC/contract, ETH = 0.01 ETH/contract).
- Transfer account types: `SPOT` / `LEVER` / `FUTURES_U` (USDT-M) / `FUTURES_C` (Coin-M) / `FINANCE`

## Requirements

- Python 3.8+
- `requests >= 2.28.0`
