# PowerShell script to push code to GitHub

Write-Host "Starting Git Push process..." -ForegroundColor Cyan

# Check if git is installed
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Git is not installed on your system or not in PATH." -ForegroundColor Red
    exit
}

# 1. Initialize Git
if (!(Test-Path .git)) {
    Write-Host "Initializing Git repository..."
    git init
}

# 2. Add files
Write-Host "Adding files..."
git add .

# 3. Commit
Write-Host "Committing changes..."
git commit -m "Initial commit - Project Dashboards and Guidelines"

# 4. Set Remote
Write-Host "Connecting to GitHub..."
$remoteUrl = "https://github.com/khanhmy247-prog/Project-List.git"
if (git remote) {
    git remote set-url origin $remoteUrl
} else {
    git remote add origin $remoteUrl
}

# 5. Push
Write-Host "Pushing to GitHub (main branch)..."
git branch -M main
git push -u origin main

Write-Host "Done!" -ForegroundColor Green
