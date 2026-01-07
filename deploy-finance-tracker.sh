#!/bin/bash

echo "🚀 AI Finance Tracker Deployment Helper"
echo "========================================"
echo ""
echo "This script will help you deploy your Finance Tracker to Vercel."
echo ""
echo "Prerequisites:"
echo "1. Vercel account (sign up at https://vercel.com)"
echo "2. GitHub repository: nithinbala08-cyber/AI-Finance-Tracker"
echo "3. Node.js installed"
echo ""
read -p "Press Enter to continue..."

echo ""
echo "Step 1: Install Vercel CLI (if not installed)"
echo "Run: npm install -g vercel"
echo ""
read -p "Have you installed Vercel CLI? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing Vercel CLI..."
    npm install -g vercel
fi

echo ""
echo "Step 2: Login to Vercel"
echo "Run: vercel login"
echo ""
read -p "Press Enter when you've logged in..."

echo ""
echo "Step 3: Navigate to your Finance Tracker repository"
echo "You'll need to:"
echo "1. Clone the repo if you haven't: git clone https://github.com/nithinbala08-cyber/AI-Finance-Tracker.git"
echo "2. cd AI-Finance-Tracker"
echo "3. cd frontend"
echo "4. vercel"
echo ""
echo "Or deploy via GitHub integration (easier):"
echo "1. Go to https://vercel.com/new"
echo "2. Import: nithinbala08-cyber/AI-Finance-Tracker"
echo "3. Set Root Directory to: frontend"
echo "4. Deploy!"
echo ""
echo "After deployment, you'll get a URL like: https://ai-finance-tracker.vercel.app"
echo ""
echo "Then update project-ai-finance-tracker.html with that URL!"
