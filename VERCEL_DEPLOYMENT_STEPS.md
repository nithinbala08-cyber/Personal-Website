# Vercel Deployment Configuration

## If "React Router" is available:
1. Select "React Router" as Framework Preset
2. Set Root Directory to: `frontend`
3. Build Command: `npm run build` (or check your frontend/package.json)
4. Output Directory: `dist` or `build` (check your build config)
5. Deploy!

## If you need to use "Other":

### Configuration Settings:
- **Framework Preset:** Other
- **Root Directory:** `frontend`
- **Build Command:** `npm run build` (or `npm run build:prod`)
- **Output Directory:** 
  - Check your `frontend/package.json` for the build output
  - Common values: `dist`, `build`, `out`
- **Install Command:** `npm install`
- **Development Command:** `npm run dev` (optional)

### To find your build output:
1. Check `frontend/package.json` - look for the "build" script
2. Check `frontend/vite.config.js` or `frontend/webpack.config.js` for output directory
3. Common React build outputs:
   - Vite: `dist`
   - Create React App: `build`
   - Next.js: `.next` (but you'd use Next.js preset)

### After Deployment:
Once you get the URL, share it and I'll update your portfolio website!

