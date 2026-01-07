# How to Push Code to GitHub

## Quick Steps

1. **Navigate to your project directory:**
   ```bash
   cd /Users/nithinbalamurugan/PersonalWebsite
   ```

2. **Check status:**
   ```bash
   git status
   ```

3. **If you have changes, stage them:**
   ```bash
   git add .
   ```

4. **Commit changes (if needed):**
   ```bash
   git commit -m "Description of your changes"
   ```

5. **Push to GitHub:**
   ```bash
   git push -u origin main
   ```

## Authentication Options

### Option 1: GitHub CLI (Recommended)
```bash
gh auth login
git push -u origin main
```

### Option 2: Personal Access Token
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Select `repo` scope
4. Copy the token
5. When prompted for password during push, paste the token

### Option 3: SSH Key
If you have SSH keys set up:
```bash
git remote set-url origin git@github.com:nithinbala08-cyber/Personal-Website.git
git push -u origin main
```

## Your Repository
- **URL:** https://github.com/nithinbala08-cyber/Personal-Website.git
- **Username:** nithinbala08-cyber
- **Branch:** main

## After Successful Push ✅

**Verify your code is on GitHub:**
- Visit: https://github.com/nithinbala08-cyber/Personal-Website
- You should see all your files!

**For future pushes (after initial setup):**
```bash
git add .
git commit -m "Your commit message"
git push
```
Note: You only need `git push` now (no need for `-u origin main` after the first time)

**Enable GitHub Pages (Optional):**
1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Source", select **Deploy from a branch**
4. Choose branch: `main` and folder: `/(root)`
5. Click **Save**
6. Your site will be live at: `https://nithinbala08-cyber.github.io/Personal-Website/`

## Troubleshooting

**If push fails:**
- Make sure you're authenticated: `gh auth status`
- Check remote URL: `git remote -v`
- Verify you have internet connection
- Ensure the repository exists on GitHub

**If you get "permission denied":**
- Check your GitHub username and repository name
- Verify you have write access to the repository
- Try re-authenticating with `gh auth login`
- Make sure your Personal Access Token has the `repo` scope

