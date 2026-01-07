# Setting Up IONOS Domains with Vercel

## Your Domains
- **nithinbalamurugan.com**
- **nithinbalamurugan.org**

---

## Step 1: Deploy Your Project to Vercel

### If Not Already Deployed:

1. **Go to Vercel Dashboard**
   - Visit: https://vercel.com
   - Sign in (or create account)

2. **Import Your GitHub Repository**
   - Click **"Add New..."** → **"Project"**
   - Click **"Import Git Repository"**
   - Select: `nithinbala08-cyber/Personal-Website`
   - Click **"Import"**

3. **Configure Project**
   - **Framework Preset:** Other (or leave default)
   - **Root Directory:** `./`
   - **Build Command:** Leave empty
   - **Output Directory:** Leave empty
   - Click **"Deploy"**

4. **Wait for deployment** - You'll get a URL like: `personal-website-xxxxx.vercel.app`

---

## Step 2: Add Both Domains to Vercel

### For nithinbalamurugan.com:

1. In Vercel Dashboard → Your Project → **Settings** → **Domains**
2. Enter: `nithinbalamurugan.com`
3. Click **"Add"**
4. **Copy the DNS configuration** Vercel shows you (you'll need this)

### For nithinbalamurugan.org:

1. In the same **Domains** section
2. Enter: `nithinbalamurugan.org`
3. Click **"Add"**
4. **Copy the DNS configuration** for this domain too

**Note:** Vercel will show you specific DNS records for each domain. Keep these handy!

---

## Step 3: Configure DNS in IONOS

### Log into IONOS:

1. Go to: https://www.ionos.com
2. Sign in to your account
3. Go to **"Domains & SSL"** → **"Domains"**
4. Click on your domain (start with `.com` first)

### For nithinbalamurugan.com:

#### Option A: Use Vercel's Nameservers (Easiest - Recommended)

1. In IONOS, go to your domain → **"Nameservers"**
2. Click **"Change nameservers"**
3. Select **"Use custom nameservers"**
4. Enter Vercel's nameservers (from Vercel dashboard):
   - `ns1.vercel-dns.com`
   - `ns2.vercel-dns.com`
5. Click **"Save"**

**Note:** If you use Vercel nameservers, you don't need to add individual DNS records - Vercel manages everything!

#### Option B: Keep IONOS Nameservers (Add DNS Records)

If you want to keep IONOS nameservers, add these DNS records:

1. Go to your domain → **"DNS"** or **"DNS Settings"**

2. **Add A Record for Root Domain:**
   - **Type:** `A`
   - **Name/Host:** `@` or leave blank (for root domain)
   - **Value/Points to:** `76.76.21.21` (or the IP Vercel shows you)
   - **TTL:** `3600` (or default)
   - Click **"Add Record"** or **"Save"**

3. **Add CNAME Record for WWW:**
   - **Type:** `CNAME`
   - **Name/Host:** `www`
   - **Value/Points to:** `cname.vercel-dns.com.` (note the trailing dot)
   - **TTL:** `3600` (or default)
   - Click **"Add Record"** or **"Save"**

### For nithinbalamurugan.org:

Repeat the same steps for your `.org` domain:

1. Go to **"Domains & SSL"** → Click on `nithinbalamurugan.org`
2. Follow the same process (either use Vercel nameservers OR add DNS records)

---

## Step 4: Verify DNS Configuration

### In Vercel:

1. Go to **Settings** → **Domains**
2. Check status for both domains:
   - Should show: **"Valid Configuration"** or **"Pending"**
   - If it shows errors, double-check DNS records

### Check DNS Propagation:

1. Visit: https://www.whatsmydns.net
2. Search for: `nithinbalamurugan.com`
3. Check if A record shows the correct IP
4. Repeat for `nithinbalamurugan.org`

**DNS propagation typically takes:**
- **5-15 minutes** (most common)
- **Up to 48 hours** (worst case)
- Usually completes within **30 minutes**

---

## Step 5: SSL Certificates

✅ **Vercel automatically provisions SSL certificates** for both domains!

- Once DNS is configured correctly, Vercel will:
  - Detect the domain configuration
  - Issue SSL certificates automatically
  - Enable HTTPS for both domains

**This usually happens within:**
- **5-10 minutes** after DNS is configured
- Check Vercel dashboard → Domains → SSL status

---

## Step 6: Configure Domain Redirects (Optional)

### Redirect .org to .com (or vice versa):

If you want one domain to redirect to the other:

1. In Vercel → **Settings** → **Domains**
2. Click on the domain you want to redirect FROM (e.g., `nithinbalamurugan.org`)
3. Under **"Redirects"**, add:
   - **From:** `nithinbalamurugan.org`
   - **To:** `https://nithinbalamurugan.com`
   - **Status Code:** `301` (Permanent Redirect)
   - **Save**

### Or redirect www to non-www:

1. In Vercel → **Settings** → **Domains**
2. Add redirect:
   - **From:** `www.nithinbalamurugan.com`
   - **To:** `nithinbalamurugan.com`
   - **Status Code:** `301`

---

## Step 7: Update Your Website Content

Update your `index.html` to use your new domains:

```html
<!-- Update these in your index.html -->
<meta property="og:url" content="https://nithinbalamurugan.com" />
<link rel="canonical" href="https://nithinbalamurugan.com" />
```

---

## IONOS-Specific Tips

### Finding DNS Settings in IONOS:

1. **Login** → **"Domains & SSL"** → **"Domains"**
2. Click on your domain name
3. Look for tabs: **"DNS"**, **"Nameservers"**, or **"DNS Settings"**
4. IONOS interface may vary - look for **"DNS Records"** or **"Manage DNS"**

### IONOS DNS Record Format:

When adding records in IONOS:
- **Name field:** Use `@` for root domain, `www` for www subdomain
- **Type:** Select from dropdown (A, CNAME, etc.)
- **Value:** Enter the IP or hostname
- **TTL:** Usually defaults to 3600 (1 hour)

### If You Can't Find DNS Settings:

- IONOS sometimes hides DNS settings if nameservers are managed elsewhere
- If using Vercel nameservers, DNS is managed in Vercel dashboard
- Contact IONOS support if you need help finding DNS settings

---

## Troubleshooting

### Domain shows "Invalid Configuration" in Vercel:

1. **Check DNS records** match exactly what Vercel shows
2. **Wait longer** - DNS can take time to propagate
3. **Verify in IONOS** that records are saved correctly
4. **Check for typos** in DNS record values

### Domain not resolving:

1. **Check DNS propagation:** https://www.whatsmydns.net
2. **Verify records in IONOS** match Vercel's requirements
3. **Clear browser cache** and try again
4. **Try incognito/private browsing** mode

### SSL Certificate not provisioning:

1. **Wait 24 hours** after DNS is configured
2. **Verify DNS records** are correct
3. **Check Vercel dashboard** for error messages
4. **Contact Vercel support** if still not working after 24 hours

### "Domain already in use" error:

- Domain might be added to another Vercel project
- Remove it from the other project first
- Or contact Vercel support

### IONOS DNS changes not saving:

- Make sure you click **"Save"** or **"Apply"** after adding records
- Some changes require confirmation email from IONOS
- Check your email for IONOS confirmation requests

---

## Quick Reference

### Your Domains:
- **Primary:** https://nithinbalamurugan.com
- **Secondary:** https://nithinbalamurugan.org

### Vercel Dashboard:
- **Projects:** https://vercel.com/dashboard
- **Domain Settings:** Project → Settings → Domains

### IONOS Dashboard:
- **Login:** https://www.ionos.com
- **Domains:** Domains & SSL → Domains

### DNS Checker:
- **Check propagation:** https://www.whatsmydns.net

### Common DNS Records:
- **A Record (Root):** `@` → `76.76.21.21`
- **CNAME (WWW):** `www` → `cname.vercel-dns.com.`

---

## After Setup Checklist

- [ ] Both domains added to Vercel
- [ ] DNS records configured in IONOS (or nameservers changed)
- [ ] DNS propagation verified (check whatsmydns.net)
- [ ] SSL certificates provisioned (check Vercel dashboard)
- [ ] Both domains accessible via HTTPS
- [ ] Website content updated with new domains
- [ ] Redirects configured (if needed)

---

## Need Help?

- **Vercel Support:** https://vercel.com/support
- **Vercel Docs:** https://vercel.com/docs/concepts/projects/domains
- **IONOS Support:** Contact through IONOS dashboard
- **DNS Propagation Checker:** https://www.whatsmydns.net

---

## Expected Timeline

1. **Deploy to Vercel:** 2-5 minutes
2. **Add domains in Vercel:** 1 minute
3. **Configure DNS in IONOS:** 5-10 minutes
4. **DNS Propagation:** 15-30 minutes (usually)
5. **SSL Certificate:** 5-10 minutes after DNS is configured
6. **Total:** ~30-60 minutes from start to finish

Your sites will be live at:
- ✅ https://nithinbalamurugan.com
- ✅ https://nithinbalamurugan.org

