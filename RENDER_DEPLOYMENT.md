# Seismic Risk Dashboard - Render Deployment

## Quick Deploy to Render

### Prerequisites
- GitHub account
- Render account (free tier works)

### Deployment Steps

#### Step 1: Push to GitHub
```bash
git init
git add .
git commit -m "Initial commit for Render deployment"
git branch -M main
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

#### Step 2: Deploy Backend API

1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository
4. Configure:
   - **Name**: `seismic-dashboard-api`
   - **Region**: Choose closest to you
   - **Branch**: `main`
   - **Root Directory**: `dashboard/api`
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app --bind 0.0.0.0:$PORT`
   - **Instance Type**: `Free`

5. Click **"Create Web Service"**
6. Wait for deployment (5-10 minutes)
7. **Copy your API URL** (e.g., `https://seismic-dashboard-api.onrender.com`)

#### Step 3: Update Frontend API URL

1. Open `dashboard/index.html`
2. Find this line (around line 70-80):
   ```javascript
   const API_URL = 'http://127.0.0.1:5000';
   ```
3. Replace with your Render API URL:
   ```javascript
   const API_URL = 'https://seismic-dashboard-api.onrender.com';
   ```
4. Commit and push:
   ```bash
   git add dashboard/index.html
   git commit -m "Update API URL for Render"
   git push
   ```

#### Step 4: Deploy Frontend

1. In Render Dashboard, click **"New +"** → **"Static Site"**
2. Connect your GitHub repository
3. Configure:
   - **Name**: `seismic-dashboard`
   - **Branch**: `main`
   - **Root Directory**: Leave empty
   - **Build Command**: Leave empty or `echo "No build needed"`
   - **Publish Directory**: `dashboard`

4. Click **"Create Static Site"**
5. Wait for deployment (2-3 minutes)
6. **Your dashboard URL**: `https://seismic-dashboard.onrender.com`

### Important Notes

⚠️ **Free Tier Limitations**:
- Backend API may sleep after 15 min inactivity (first request takes 30-60s to wake up)
- 750 hours/month free (enough for one service)

🔧 **Required Files** (already created):
- ✅ `dashboard/api/requirements.txt` (with gunicorn)
- ✅ `dashboard/api/Procfile`
- ✅ Model files in `latest/` folder

### Troubleshooting

**Backend won't start?**
- Check logs in Render dashboard
- Verify all model files exist in `latest/` folder
- Ensure Python version is 3.9-3.11

**Frontend shows errors?**
- Verify API URL is correct in `index.html`
- Check browser console for CORS errors
- Ensure backend is deployed and running

**Models not loading?**
- Confirm file paths in `app.py` match your structure
- Check model files are committed to GitHub

### Architecture
```
Frontend (Static Site) → Backend API (Python/Flask) → CatBoost Models
```

### Need Help?
- Check Render logs: Dashboard → Your Service → Logs
- Test API directly: `https://your-api.onrender.com/health`
