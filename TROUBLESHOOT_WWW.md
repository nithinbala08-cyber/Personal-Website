# Troubleshooting www.nithinbalamurugan.com

## Common Issues and Solutions

### Issue 1: DNS Not Configured for www Subdomain

**Check DNS Configuration:**

1. **If using Vercel Nameservers:**
   - Vercel should handle www automatically
   - But verify in Vercel dashboard → Domains → Check if www shows "Valid Configuration"

2. **If using IONOS Nameservers:**
   - You MUST add a CNAME record for www
   - Go to IONOS → DNS Settings
   - Add CNAME: `www` → `cname.vercel-dns.com.`

### Issue 2: DNS Propagation Still In Progress

**Check DNS Propagation:**
- Visit: https://www.whatsmydns.net/#CNAME/www.nithinbalamurugan.com
- If you see red dots, DNS hasn't propagated yet
- Wait 15-30 minutes and check again

### Issue 3: SSL Certificate Not Provisioned

**Check SSL Status in Vercel:**
- Go to Vercel Dashboard → Settings → Domains
- Click on `www.nithinbalamurugan.com`
- Check SSL certificate status
- Should show "Valid Certificate" or "Provisioning"
- Can take 5-10 minutes after DNS is configured

### Issue 4: Domain Not Properly Added in Vercel

**Verify in Vercel:**
- Settings → Domains
- Should see BOTH:
  - `nithinbalamurugan.com` ✅
  - `www.nithinbalamurugan.com` ✅
- Both should show "Valid Configuration"

## Step-by-Step Fix

### Step 1: Verify Domain in Vercel
1. Go to https://vercel.com/dashboard
2. Your Project → Settings → Domains
3. Confirm `www.nithinbalamurugan.com` is listed
4. Check status - should say "Valid Configuration"

### Step 2: Check DNS Records in IONOS

**If using IONOS Nameservers:**

1. Login to IONOS
2. Domains & SSL → `nithinbalamurugan.com` → DNS Settings
3. Look for CNAME record with name `www`
4. Should point to: `cname.vercel-dns.com.` (with trailing dot)
5. If missing, add it:
   - Type: CNAME
   - Name: www
   - Value: cname.vercel-dns.com.
   - TTL: 3600

**If using Vercel Nameservers:**
- DNS is managed by Vercel
- Just verify in Vercel dashboard that www shows "Valid Configuration"

### Step 3: Test DNS Propagation

Visit these sites to check:
- https://www.whatsmydns.net/#CNAME/www.nithinbalamurugan.com
- https://dnschecker.org/#CNAME/www.nithinbalamurugan.com

Look for:
- Green dots = DNS is working
- Red dots = DNS not configured/propagated yet

### Step 4: Test Different URLs

Try these in your browser:
- `http://www.nithinbalamurugan.com` (without https)
- `https://www.nithinbalamurugan.com` (with https)
- `https://nithinbalamurugan.com` (root domain - should work)

**If HTTP works but HTTPS doesn't:**
- SSL certificate is still provisioning
- Wait 5-10 more minutes

**If neither works:**
- DNS isn't configured correctly
- Check DNS records again

### Step 5: Clear Browser Cache

Sometimes browsers cache DNS:
- **Chrome:** Settings → Privacy → Clear browsing data → Cached images and files
- **Safari:** Develop → Empty Caches (enable Develop menu first)
- **Firefox:** Settings → Privacy → Clear Data → Cached Web Content

Or try **Incognito/Private browsing** mode

## Common Error Messages

### "This site can't be reached"
- DNS not configured or not propagated
- Check DNS records in IONOS
- Wait for DNS propagation

### "Your connection is not private" / SSL Error
- SSL certificate not provisioned yet
- Wait 5-10 minutes after DNS is configured
- Check SSL status in Vercel dashboard

### "Server IP address could not be found"
- DNS records missing or incorrect
- Verify CNAME record for www in IONOS
- Check DNS propagation status

## Quick Diagnostic Commands

Run these in Terminal to check DNS:

```bash
# Check if www resolves
nslookup www.nithinbalamurugan.com

# Check CNAME record
dig www.nithinbalamurugan.com CNAME

# Check if site responds
curl -I https://www.nithinbalamurugan.com
```

## Expected Timeline

- **DNS Configuration:** Immediate (once you add records)
- **DNS Propagation:** 15-30 minutes (usually)
- **SSL Certificate:** 5-10 minutes after DNS is configured
- **Total:** 20-40 minutes from configuration to working

## Still Not Working?

1. **Double-check Vercel dashboard:**
   - Both domains show "Valid Configuration"
   - SSL certificates show "Valid"

2. **Double-check IONOS:**
   - CNAME record exists for `www`
   - Points to `cname.vercel-dns.com.`
   - TTL is set (3600 or default)

3. **Wait longer:**
   - Sometimes takes up to 48 hours (rare)
   - Usually works within 30 minutes

4. **Contact Support:**
   - Vercel Support: https://vercel.com/support
   - IONOS Support: Through IONOS dashboard

