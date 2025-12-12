#!/bin/bash
# Quick setup script for Render deployment

echo "🚀 Render Deployment Setup"
echo "=========================="
echo ""
echo "Step 1: Initialize Git (if not already done)"
if [ ! -d .git ]; then
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

echo ""
echo "Step 2: Create .gitignore"
cat > .gitignore << 'EOF'
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
.venv
*.log
.DS_Store
.env
EOF
echo "✅ .gitignore created"

echo ""
echo "Step 3: Ready to commit"
git add .
git status

echo ""
echo "📋 NEXT STEPS:"
echo "=============="
echo "1. Create GitHub repository"
echo "2. Run: git commit -m 'Initial commit for Render'"
echo "3. Run: git remote add origin YOUR_GITHUB_URL"
echo "4. Run: git push -u origin main"
echo ""
echo "5. Go to Render.com and create:"
echo "   - Web Service (Backend): dashboard/api"
echo "   - Static Site (Frontend): dashboard"
echo ""
echo "6. After backend deploys, update API URL in dashboard/index.html"
echo "   Change line 596: const API_BASE_URL = 'YOUR_RENDER_API_URL';"
echo ""
echo "Full instructions: See RENDER_DEPLOYMENT.md"
