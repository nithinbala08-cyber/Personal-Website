#!/bin/bash

# Setup script for GitHub repository
# Run this script in your terminal: bash setup-github.sh

echo "🚀 Setting up GitHub repository..."

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Personal portfolio website"

# Set default branch to main
git branch -M main

echo ""
echo "✅ Git repository initialized!"
echo ""
echo "📝 Next steps:"
echo "1. Go to https://github.com/new"
echo "2. Create a new repository (name it something like 'personal-website' or 'portfolio')"
echo "3. DO NOT initialize with README, .gitignore, or license"
echo "4. Copy the repository URL (it will look like: https://github.com/YOUR_USERNAME/YOUR_REPO.git)"
echo "5. Run these commands (replace YOUR_USERNAME and YOUR_REPO with your actual values):"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
echo "   git push -u origin main"
echo ""
echo "🎉 Your code will be pushed to GitHub!"

