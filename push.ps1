param(
    [string]$message = "Update project"
)

# Navigate to project
cd c:\vue\Millers

# Stage all changes
git add .

# Commit with message
git commit -m $message

# Push to GitHub
git push

Write-Host "✅ Changes pushed to GitHub!" -ForegroundColor Green
