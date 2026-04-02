# 日本株 成長銘柄スクリーニング 2026

日本株の中小〜中堅銘柄を AI が評価・スコアリングする Web アプリケーション

## 機能

- **AI スコアリング**: Kimi API (Moonshot AI) を使用して銘柄を自動評価
- **110 点満点評価**: 成長性・収益性・財務健全性・割安度・PEG ボーナスの 5 項目
- **伸び代可視化**: 外国人比率から発見余地を算出
- **JSON ログ記録**: 入力データを自動で JSON 形式で保存

## セットアップ

### 1. GitHub Secrets の設定

GitHub リポジトリの Settings → Secrets and variables → Actions で以下を設定：

| Secret Name | Description |
|-------------|-------------|
| `KIMI_API_KEY` | Kimi API の API キー |
| `VERCEL_TOKEN` | Vercel デプロイ用トークン |
| `VERCEL_ORG_ID` | Vercel オーガニゼーション ID |
| `VERCEL_PROJECT_ID` | Vercel プロジェクト ID |
| `STOCK_API_ENDPOINT` | (任意) ログ送信先 API エンドポイント |

### 2. Kimi API キーの取得

1. [Moonshot AI](https://platform.moonshot.cn/) にアクセス
2. アカウント作成
3. API キーを発行
4. GitHub Secrets に `KIMI_API_KEY` として登録

### 3. ローカル開発

```bash
# リポジトリをクローン
git clone https://github.com/your-username/stock-ranking-2026.git
cd stock-ranking-2026

# HTML ファイルをブラウザで開く
open stock_ranking_2026.html
```

## 使い方

1. 4 桁の証券コードを入力（例：`4417`）
2. 「評価する」ボタンをクリック
3. AI が銘柄を分析し、スコアを付与
4. リストに追加され、詳細説明が表示

## 評価基準

| 項目 | 配点 | 満点基準 |
|------|------|----------|
| 成長性 | 40 点 | 売上成長率 30%+ |
| 収益性 | 30 点 | ROE 20%+ / ROA 10%+ / 利益率 15%+ |
| 財務健全性 | 15 点 | 自己資本比率 50%+ / 負債比率 50% 以下 |
| 割安度 | 15 点 | PER 10 倍以下 / PBR 1 倍以下 |
| PEG ボーナス | 10 点 | PEG 0.5 以下 |
| **合計** | **110 点** | |

## 技術スタック

- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **AI API**: Kimi API (Moonshot AI)
- **Deployment**: Vercel
- **Logging**: localStorage + GitHub Actions

## データ保存

- 入力履歴は `localStorage` に自動保存
- GitHub Actions を経由して外部 API にも送信可能

## ライセンス

MIT
