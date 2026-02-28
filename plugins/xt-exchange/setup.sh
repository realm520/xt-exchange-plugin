#!/bin/bash
# XT Exchange Plugin 安装脚本
# 在 plugin 目录下创建 Python venv 并安装依赖

set -e

PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV="$PLUGIN_DIR/.venv"

echo "📦 正在设置 xt-exchange-plugin..."
echo "  Plugin 目录: $PLUGIN_DIR"

# 创建 venv
if [ ! -f "$VENV/bin/python" ]; then
  echo "  创建 Python 虚拟环境..."
  python3 -m venv "$VENV"
fi

# 安装依赖
echo "  安装依赖..."
"$VENV/bin/pip" install -q -r "$PLUGIN_DIR/scripts/requirements.txt"

echo ""
echo "✅ 安装完成！"
echo ""
echo "使用方式："
echo "  1. 在 Claude Code 中执行：/plugin marketplace add <your-github-username>/xt-exchange-plugin"
echo "  2. 然后：/plugin install xt-exchange@<marketplace-name>"
echo ""
echo "凭证文件（首次使用前创建）："
echo "  mkdir -p ~/.xt-exchange"
echo "  echo '{\"access_key\": \"xxx\", \"secret_key\": \"yyy\"}' > ~/.xt-exchange/credentials.json"
echo "  chmod 600 ~/.xt-exchange/credentials.json"
