# Stock Ranking 2026 - Fix Summary

## Errors Fixed

### 1. Google Fonts Loading Error
**Problem:** `ERR_NAME_NOT_RESOLVED`
**Cause:** Invalid URL with spaces: `wght @300` instead of `wght@300`
**Fix:** Corrected the font URL format in the `<link>` tag

### 2. CORS Policy Error (Anthropic API)
**Problem:** Browser blocked requests to `api.anthropic.com`
**Cause:** Anthropic API doesn't support CORS for browser-based requests
**Fix:** Changed API from Anthropic to Kimi (Moonshot AI)

### 3. 404 Error
**Problem:** Failed resource loading
**Cause:** Cascading failure from the CORS error
**Fix:** Resolved by fixing the API integration

---

## Changes Made

### 1. API Integration Changed
**Before:** Anthropic Claude API
```javascript
fetch('https://api.anthropic.com/v1/messages', {
  headers: {'Content-Type': 'application/json'}
})
```

**After:** Kimi API (Moonshot AI)
```javascript
fetch('https://api.moonshot.cn/v1/chat/completions', {
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${window.KIMI_API_KEY}`
  }
})
```

### 2. JSON Logging Added
New `logToJSON()` function that:
- Saves all input data to `localStorage` as backup
- Optionally sends data to external API endpoint
- Records timestamp, code, and evaluation results

### 3. Secret Management
API keys are now loaded from:
- `window.KIMI_API_KEY` - Set via GitHub Secrets
- `window.STOCK_API_ENDPOINT` - Optional logging endpoint

---

## Files Created/Modified

| File | Status | Purpose |
|------|--------|---------|
| `stock_ranking_2026.html` | Modified | Main application with Kimi API |
| `.github/workflows/deploy.yml` | Created | GitHub Actions for Vercel deploy |
| `.env.example` | Created | Environment variable template |
| `README.md` | Created | Setup and usage documentation |
| `setup/setup-secrets.ps1` | Created | GitHub secrets setup script |
| `CHANGES.md` | Created | This file |

---

## GitHub Secrets Required

Set these in your GitHub repository: **Settings → Secrets and variables → Actions**

| Secret | Required | Description |
|--------|----------|-------------|
| `KIMI_API_KEY` | ✓ | Kimi API authentication |
| `VERCEL_TOKEN` | ✓ | Vercel deployment |
| `VERCEL_ORG_ID` | ✓ | Vercel organization |
| `VERCEL_PROJECT_ID` | ✓ | Vercel project ID |
| `STOCK_API_ENDPOINT` | Optional | Custom logging endpoint |

---

## How to Get Kimi API Key

1. Visit [Moonshot AI Platform](https://platform.moonshot.cn/)
2. Create an account
3. Go to API Keys section
4. Generate a new API key
5. Copy and save to GitHub Secrets as `KIMI_API_KEY`

---

## Deployment Steps

### 1. Push to GitHub
```bash
git add .
git commit -m "Update to Kimi API with JSON logging"
git push origin main
```

### 2. Configure GitHub Secrets
```powershell
# Run the setup script
.\setup\setup-secrets.ps1 `
  -KimiApiKey 'your-kimi-key' `
  -VercelToken 'your-vercel-token' `
  -VercelOrgId 'your-org-id' `
  -VercelProjectId 'your-project-id'
```

### 3. Verify Deployment
- Check GitHub Actions tab for deployment status
- Visit your Vercel URL: `https://stock-ranking-2026.vercel.app`

---

## Testing Locally

1. Open `stock_ranking_2026.html` in a browser
2. Enter a stock code (e.g., `4417`)
3. Click "評価する"
4. Check browser console for any errors
5. Verify data is saved to localStorage:
   ```javascript
   JSON.parse(localStorage.getItem('stock_screening_log'))
   ```

---

## API Response Format

The Kimi API returns:
```json
{
  "choices": [{
    "message": {
      "content": "{\"name\":\"銘柄名\",\"fc\":\"+XX%\",\"grade\":\"A+\",\"score\":90,...}"
    }
  }]
}
```

The app parses this and creates a stock object with all scoring fields.

---

## Troubleshooting

### CORS Error Persists
- Ensure you're using the Kimi API, not Anthropic
- Check that `KIMI_API_KEY` is set correctly

### 401 Unauthorized
- Verify API key is valid
- Check GitHub secret is properly set

### Data Not Logging
- Check browser console for errors
- Verify `STOCK_API_ENDPOINT` if using custom endpoint
- localStorage always works as fallback

---

## Next Steps

1. Get Kimi API key from Moonshot platform
2. Add secrets to GitHub repository
3. Push changes to trigger deployment
4. Test with a few stock codes
5. Monitor localStorage for logged data
