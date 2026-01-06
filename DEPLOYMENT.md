# Deployment Guide - Connecting Your Domain to Your Website

## Option 1: Netlify (Recommended - Easiest)

### Step 1: Deploy to Netlify
1. Go to [netlify.com](https://www.netlify.com) and sign up for a free account
2. Drag and drop your `PersonalWebsite` folder onto the Netlify dashboard, OR
3. Connect your GitHub repository (if you push your code to GitHub)

### Step 2: Get Your Netlify URL
- After deployment, Netlify will give you a URL like: `your-site-name.netlify.app`

### Step 3: Connect Your Domain
1. In Netlify dashboard, go to **Site settings** → **Domain management**
2. Click **Add custom domain**
3. Enter your domain name (e.g., `yourdomain.com`)
4. Follow Netlify's DNS instructions

### Step 4: Configure DNS (at your domain registrar)
Add these DNS records at your domain registrar (where you bought the domain):

**Option A: Use Netlify DNS (Easiest)**
- Change nameservers to Netlify's nameservers (provided in Netlify dashboard)

**Option B: Use CNAME Record**
- Add a CNAME record:
  - Name: `@` or `www`
  - Value: `your-site-name.netlify.app`
- Add an A record for root domain:
  - Name: `@`
  - Value: `75.2.60.5` (Netlify's IP)

---

## Option 2: Vercel (Also Easy)

### Step 1: Deploy to Vercel
1. Go to [vercel.com](https://vercel.com) and sign up
2. Install Vercel CLI: `npm i -g vercel`
3. In your project folder, run: `vercel`
4. Or drag and drop your folder on Vercel dashboard

### Step 2: Connect Domain
1. Go to your project settings → **Domains**
2. Add your domain
3. Follow DNS configuration instructions

---

## Option 3: GitHub Pages (Free)

### Step 1: Push to GitHub
```bash
cd /Users/nithinbalamurugan/PersonalWebsite
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

### Step 2: Enable GitHub Pages
1. Go to your repository on GitHub
2. Settings → **Pages**
3. Source: Select `main` branch and `/root` folder
4. Save

### Step 3: Connect Domain
1. In GitHub Pages settings, add your custom domain
2. Create a file named `CNAME` in your repo root with your domain name
3. Configure DNS at your registrar:
   - Add A records pointing to GitHub IPs:
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`
   - Or add CNAME: `@` → `YOUR_USERNAME.github.io`

---

## DNS Configuration Guide

### Common DNS Records:

**A Record** (for root domain):
- Name: `@` or leave blank
- Type: `A`
- Value: IP address provided by hosting service

**CNAME Record** (for subdomains like www):
- Name: `www`
- Type: `CNAME`
- Value: Your hosting service URL (e.g., `your-site.netlify.app`)

**Nameservers** (if using hosting provider's DNS):
- Replace your registrar's nameservers with hosting provider's nameservers

### Where to Configure DNS:
- Go to your domain registrar's website (where you bought the domain)
- Look for "DNS Management" or "Domain Settings"
- Add the records mentioned above

---

## Quick Start Commands

### For Netlify:
```bash
# Install Netlify CLI (optional)
npm install -g netlify-cli

# Deploy
netlify deploy --prod
```

### For Vercel:
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

---

## Important Notes:

1. **DNS Propagation**: Changes can take 24-48 hours to propagate globally
2. **SSL Certificate**: Netlify and Vercel provide free SSL certificates automatically
3. **www vs non-www**: Configure redirects in your hosting provider settings
4. **Update Title**: Don't forget to update the `<title>` tag in `index.html` with your actual name/domain

---

## Need Help?

- **Netlify Support**: https://docs.netlify.com
- **Vercel Support**: https://vercel.com/docs
- **GitHub Pages**: https://docs.github.com/pages

