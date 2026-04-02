# ⚠️ SECURITY WARNING

## API Key Exposure Risk

You shared an API key in the chat:
```
88ce95d3-3f79-43c5-80dc-24d6d1075295:pEDC7v0kXtgS7Zx5l+swSmfiveym+Ck3PX98CUOV
```

### Immediate Actions Required

1. **DO NOT commit this key to Git** - I have NOT included it in any files
2. **Consider rotating the key** if it was accidentally exposed publicly
3. **Use GitHub Secrets** for deployment (never hardcode in source)

---

## How I Protected Your Key

The updated `stock_ranking_2026.html` uses secure key loading:

```javascript
// Key is loaded from window.SAKURA_API_KEY
// NOT hardcoded in the file
const API_KEY = window.SAKURA_API_KEY || '';
```

### For Local Testing

1. Open `setup-api-key.html` in your browser
2. Paste your API key
3. It's saved to localStorage (browser-only, never uploaded)
4. Open `stock_ranking_2026.html` - it will auto-load the key

### For Production (Vercel/GitHub)

Use GitHub Secrets:
```bash
# In GitHub: Settings → Secrets and variables → Actions
KIMI_API_KEY=your_key_here
```

---

## Best Practices

| Method | Security Level | Use Case |
|--------|---------------|----------|
| GitHub Secrets | ✓✓✓ | Production deployment |
| localStorage | ✓✓ | Local testing |
| Hardcoded in file | ✗ | NEVER use |
| .env file (committed) | ✗ | NEVER use |

---

## Files Created for Secure Setup

| File | Purpose |
|------|---------|
| `setup-api-key.html` | Local key configuration UI |
| `.env.example` | Template (no real keys) |
| `.github/workflows/deploy.yml` | Secure deployment |
| `README.md` | Setup instructions |

---

## Verify Your Key is Safe

Run this to check if keys are accidentally in files:

```powershell
# Search for your key pattern in project files
Select-String -Pattern "88ce95d3-3f79" -Path *.html,*.js,*.md
```

If you see results, **remove those files from Git history immediately**:
```bash
git reset HEAD~1  # If recent commit
# Or use BFG Repo-Cleaner for older commits
```

---

## Contact

If you believe your key was compromised:
1. Revoke it in Sakura AI dashboard
2. Generate a new key
3. Update GitHub Secrets
