#!/bin/bash

echo "🔧 Fixing GitHub authentication issues..."

# Clear cached credentials
echo "1. Clearing cached credentials..."
git credential-osxkeychain erase <<EOF
host=github.com
protocol=https
EOF

# Also try clearing git credential cache
git credential-cache exit 2>/dev/null || true

echo "✅ Credentials cleared!"
echo ""
echo "📝 Next steps:"
echo ""
echo "Option 1: Create a NEW Personal Access Token"
echo "1. Go to: https://github.com/settings/tokens/new"
echo "2. Name: 'Personal Website'"
echo "3. Expiration: Choose your preference"
echo "4. IMPORTANT: Check these scopes:"
echo "   - ✅ repo (Full control of private repositories)"
echo "   - ✅ workflow (if you plan to use GitHub Actions)"
echo "5. Click 'Generate token'"
echo "6. COPY THE TOKEN IMMEDIATELY"
echo ""
echo "7. Then run:"
echo "   git push -u origin main"
echo "   Username: nithinbala08-cyber"
echo "   Password: [paste your NEW token]"
echo ""
echo "Option 2: Switch to SSH (Recommended)"
echo "Run these commands:"
echo ""
echo "   # Generate SSH key (if you don't have one)"
echo "   ssh-keygen -t ed25519 -C 'nithinbala08@gmail.com'"
echo ""
echo "   # Copy public key"
echo "   cat ~/.ssh/id_ed25519.pub | pbcopy"
echo ""
echo "   # Add to GitHub: Settings → SSH and GPG keys → New SSH key"
echo "   # Then change remote URL:"
echo "   git remote set-url origin git@github.com:nithinbala08-cyber/Personal-Website.git"
echo ""
echo "   # Test and push"
echo "   ssh -T git@github.com"
echo "   git push -u origin main"

