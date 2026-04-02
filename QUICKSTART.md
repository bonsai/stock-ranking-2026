# クイックスタートガイド

## 手順 1: API キーを設定

**setup-api-key.html** をブラウザで開く:
```powershell
# または PowerShell でローカルサーバーを起動
.\serve.ps1
```

その後、http://localhost:8080/setup-api-key.html にアクセス

1. API エンドポイントを選択（Sakura LLM API）
2. API キーを入力
3. 「保存」をクリック

## 手順 2: アプリを開く

**stock_ranking_2026.html** をブラウザで開く:
- API キーが自動で読み込まれます
- 銘柄コード（例：`4417`）を入力
- 「評価する」をクリック

## 手順 3: 結果を確認

- AI が銘柄を評価し、スコアを表示
- データは localStorage に自動保存
- 表やカードで結果を確認

---

## トラブルシューティング

### 「API キーが設定されていません」と表示

ブラウザのコンソール（F12）で以下を実行:
```javascript
localStorage.setItem('sakura_api_key', 'あなたの API キー');
location.reload();
```

### CORS エラーが発生

Sakura LLM API が CORS に対応しているか確認してください。
または、プロキシサーバーを経由する必要があります。

### 接続エラー

API エンドポイントが正しいか確認:
```javascript
// コンソールで確認
localStorage.getItem('sakura_api_endpoint')
```

---

## API キーの削除

設定をリセットする場合:
```javascript
localStorage.removeItem('sakura_api_key');
localStorage.removeItem('sakura_api_endpoint');
location.reload();
```

---

## 関連ファイル

| ファイル | 説明 |
|---------|------|
| `setup-api-key.html` | API キー設定 UI |
| `stock_ranking_2026.html` | メインアプリ |
| `serve.ps1` | ローカルサーバー |
| `SETUP-INSTRUCTIONS.md` | 詳細設定ガイド |
