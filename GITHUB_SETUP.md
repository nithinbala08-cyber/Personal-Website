# GitHub Authentication Setup

## Option 1: Personal Access Token (Quick Setup)

### Step 1: Create a Personal Access Token
1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name like "Personal Website"
4. Select scopes: Check `repo` (full control of private repositories)
5. Click "Generate token"
6. **COPY THE TOKEN IMMEDIATELY** (you won't see it again!)

### Step 2: Use the Token
When you push, use the token as your password:
```bash
git push -u origin main
# Username: nithinbala08-cyber
# Password: [paste your token here]
```

### Step 3: Save Credentials (Optional)
To avoid entering it every time:
```bash
git config --global credential.helper osxkeychain
```

---

## Option 2: SSH Keys (Recommended - More Secure)

### Step 1: Check if you have SSH keys
```bash
ls -al ~/.ssh
```

### Step 2: Generate SSH key (if you don't have one)
```bash
ssh-keygen -t ed25519 -C "nithinbala08@gmail.com"
# Press Enter to accept default location
# Enter a passphrase (optional but recommended)
```

### Step 3: Add SSH key to ssh-agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### Step 4: Copy your public key
```bash
cat ~/.ssh/id_ed25519.pub
# Copy the entire output
```

### Step 5: Add to GitHub
1. Go to GitHub → Settings → SSH and GPG keys
2. Click "New SSH key"
3. Title: "MacBook Air"
4. Paste your public key
5. Click "Add SSH key"

### Step 6: Change remote URL to SSH
```bash
git remote set-url origin git@github.com:nithinbala08-cyber/Personal-Website.git
```

### Step 7: Test connection
```bash
ssh -T git@github.com
# Should say: "Hi nithinbala08-cyber! You've successfully authenticated..."
```

### Step 8: Push
```bash
git push -u origin main
```

---

## Quick Fix (If you just want to push now)

**Use Personal Access Token:**
1. Create token at: https://github.com/settings/tokens/new
2. When pushing, use token as password:
```bash
git push -u origin main
```

