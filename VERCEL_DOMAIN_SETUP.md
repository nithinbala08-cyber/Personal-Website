# Adding Custom Domain to Vercel

## Prerequisites
- Your code is pushed to GitHub: `https://github.com/nithinbala08-cyber/Personal-Website`
- You have a Vercel account (sign up at https://vercel.com if needed)
- Your project is deployed on Vercel

---

## Step 1: Deploy Your Project to Vercel (If Not Already Done)

### Option A: Import from GitHub (Recommended)
1. Go to [vercel.com](https://vercel.com) and sign in
2. Click **"Add New..."** → **"Project"**
3. Click **"Import Git Repository"**
4. Select your repository: `nithinbala08-cyber/Personal-Website`
5. Click **"Import"**
6. Configure project:
   - **Framework Preset:** Other (or leave as default)
   - **Root Directory:** `./` (default)
   - **Build Command:** Leave empty (static site)
   - **Output Directory:** Leave empty (or `./`)
7. Click **"Deploy"**
8. Wait for deployment to complete

### Option B: Deploy via CLI
```bash
# Install Vercel CLI globally
npm install -g vercel

# Navigate to your project
cd /Users/nithinbalamurugan/PersonalWebsite

# Deploy
vercel

# Follow the prompts:
# - Link to existing project? No
# - Project name: Personal-Website (or your choice)
# - Directory: ./
# - Override settings? No
```

---

## Step 2: Add Your Custom Domain to Vercel

1. **Go to your Vercel Dashboard**
   - Visit: https://vercel.com/dashboard
   - Click on your project: **Personal-Website**

2. **Navigate to Domain Settings**
   - Click on the **"Settings"** tab
   - Click **"Domains"** in the left sidebar

3. **Add Your Domain**
   - Enter your domain name (e.g., `yourdomain.com`)
   - Click **"Add"**

4. **Vercel will show you DNS configuration instructions**
   - You'll see specific DNS records to add
   - **Note these down** - you'll need them in the next step

---

## Step 3: Configure DNS Records at Your Domain Registrar

Go to your domain registrar (where you bought the domain - e.g., Namecheap, GoDaddy, Google Domains, etc.)

### For Root Domain (yourdomain.com):

**Option A: Use Vercel's Nameservers (Easiest)**
1. In Vercel, you'll see nameservers like:
   - `ns1.vercel-dns.com`
   - `ns2.vercel-dns.com`
2. At your domain registrar:
   - Go to **DNS Settings** or **Nameservers**
   - Replace existing nameservers with Vercel's nameservers
   - Save changes

**Option B: Use A Record (If you want to keep your registrar's nameservers)**
1. In Vercel, you'll see an A record value (IP address)
2. At your domain registrar:
   - Add an **A Record**:
     - **Name/Host:** `@` or leave blank
     - **Type:** `A`
     - **Value:** The IP address shown in Vercel (usually `76.76.21.21`)
     - **TTL:** 3600 (or default)

### For WWW Subdomain (www.yourdomain.com):

**Add CNAME Record:**
1. At your domain registrar:
   - Add a **CNAME Record**:
     - **Name/Host:** `www`
     - **Type:** `CNAME`
     - **Value:** `cname.vercel-dns.com.` (note the trailing dot)
     - **TTL:** 3600 (or default)

**OR** if Vercel shows a different CNAME value, use that instead.

---

## Step 4: Verify Domain Configuration

1. **Back in Vercel:**
   - Go to **Settings** → **Domains**
   - You'll see your domain with status: "Valid Configuration" or "Pending"
   - If it shows errors, check the DNS records again

2. **Wait for DNS Propagation:**
   - DNS changes can take **5 minutes to 48 hours** to propagate
   - Usually takes **15-30 minutes** for most cases
   - You can check propagation status at: https://www.whatsmydns.net

3. **SSL Certificate:**
   - Vercel automatically provisions SSL certificates (HTTPS)
   - This happens automatically once DNS is configured correctly
   - You'll see "Valid Certificate" in the domain settings

---

## Step 5: Configure Domain Redirects (Optional)

### Redirect www to non-www (or vice versa):

1. In Vercel Dashboard → **Settings** → **Domains**
2. Click on your domain
3. Under **"Redirects"**, configure:
   - **From:** `www.yourdomain.com`
   - **To:** `yourdomain.com`
   - **Status Code:** `301` (Permanent Redirect)

Or use the opposite if you prefer `www.yourdomain.com` as primary.

---

## Step 6: Update Your Website (Optional)

Update your `index.html` to reflect your new domain:

```html
<!-- Update meta tags -->
<meta property="og:url" content="https://yourdomain.com" />
<link rel="canonical" href="https://yourdomain.com" />
```

---

## Troubleshooting

### Domain shows "Invalid Configuration"
- **Check DNS records:** Make sure A record and CNAME are correct
- **Wait longer:** DNS propagation can take time
- **Check at your registrar:** Verify records are saved correctly
- **Remove trailing dots:** Some registrars don't like trailing dots in CNAME values

### SSL Certificate not provisioning
- Wait 24 hours after DNS is configured
- Make sure DNS records are correct
- Check Vercel dashboard for any error messages

### Domain not resolving
- Use DNS checker: https://www.whatsmydns.net
- Verify records at your registrar match Vercel's instructions
- Clear your browser cache and try again

### "Domain already in use" error
- The domain might be added to another Vercel project
- Remove it from the other project first
- Or contact Vercel support

---

## Quick Reference

**Vercel Dashboard:** https://vercel.com/dashboard
**Domain Settings:** Project → Settings → Domains
**DNS Checker:** https://www.whatsmydns.net

**Common DNS Records:**
- **A Record (Root):** `@` → `76.76.21.21` (or IP shown in Vercel)
- **CNAME (WWW):** `www` → `cname.vercel-dns.com.`

---

## Need Help?

- **Vercel Docs:** https://vercel.com/docs/concepts/projects/domains
- **Vercel Support:** https://vercel.com/support
- **DNS Propagation Checker:** https://www.whatsmydns.net

---

## After Setup

Once your domain is configured:
- Your site will be accessible at: `https://yourdomain.com`
- SSL certificate will be automatically provisioned
- Both `yourdomain.com` and `www.yourdomain.com` will work (if configured)

**Test your site:**
```bash
# Check if domain resolves
ping yourdomain.com

# Check SSL certificate
curl -I https://yourdomain.com
```

