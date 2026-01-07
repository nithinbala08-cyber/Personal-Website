# Deploy AI Finance Tracker to Vercel

## Quick Deployment Steps

### Step 1: Deploy Frontend to Vercel

1. **Go to Vercel Dashboard:**
   - Visit: https://vercel.com
   - Sign in with GitHub
   - Click "Add New Project"

2. **Import Repository:**
   - Select: `nithinbala08-cyber/AI-Finance-Tracker`
   - Click "Import"

3. **Configure Settings:**
   - **Root Directory:** `frontend`
   - **Framework Preset:** React
   - **Build Command:** `npm run build` (or check your frontend/package.json)
   - **Output Directory:** `dist` (or `build` - check your build config)
   - **Install Command:** `npm install`

4. **Environment Variables:**
   Add these in Vercel dashboard:
   ```
   REACT_APP_API_URL=https://your-backend-url.vercel.app
   REACT_APP_AI_SERVICE_URL=https://your-ai-service-url.vercel.app
   ```

5. **Deploy:**
   - Click "Deploy"
   - Copy the deployment URL (e.g., `https://ai-finance-tracker.vercel.app`)

### Step 2: Deploy Backend (Node.js)

1. **Create New Vercel Project:**
   - Click "Add New Project" again
   - Import same repository: `nithinbala08-cyber/AI-Finance-Tracker`

2. **Configure Settings:**
   - **Root Directory:** `backend`
   - **Framework Preset:** Other
   - **Build Command:** Leave empty or `npm install`
   - **Output Directory:** Leave empty
   - **Install Command:** `npm install`

3. **Environment Variables:**
   ```
   PORT=5000
   DATABASE_URL=your_postgresql_connection_string
   AI_SERVICE_URL=https://your-ai-service-url.vercel.app
   NODE_ENV=production
   ```

4. **Create API Folder Structure:**
   - Vercel uses `/api` folder for serverless functions
   - You may need to restructure backend to use Vercel serverless functions

### Step 3: Deploy AI Service (Python FastAPI)

**Option A: Use Vercel Python Runtime**
- Create `/api` folder in root
- Convert FastAPI endpoints to Vercel serverless functions

**Option B: Deploy Separately (Recommended)**
- Use Railway.app, Render.com, or Fly.io for Python service
- These platforms handle Python/FastAPI better than Vercel

### Step 4: Update Your Portfolio Website

Once you have the frontend URL, update `project-ai-finance-tracker.html`:
```html
<a href="https://your-finance-tracker-url.vercel.app" target="_blank" class="project-link-detail">View Project</a>
```

## Alternative: Simple Frontend-Only Deployment

If you want to deploy just the frontend first:

1. Deploy frontend to Vercel (follow Step 1)
2. Update the "View Project" link with the frontend URL
3. Backend and AI service can be added later

## Need Help?

If you encounter issues:
- Check Vercel build logs
- Verify environment variables are set
- Ensure all dependencies are in package.json
- Check that build commands match your project structure

