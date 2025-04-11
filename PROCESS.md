# DevOps Git Project Process Documentation

This document outlines the Git workflow process followed to complete the DevOps Internship Task 4.

## Repository Setup

1. **Create GitHub Repository**
   - Created a new repository at GitHub.com named "devops-git-project"
   - URL: https://github.com/SlayerK15/devops-git-project.git

2. **Initialize Local Repository**
   - Created an empty local Git repository
   ```bash
   mkdir devops-git-project
   cd devops-git-project
   git init
   ```

3. **Add Original README.md**
   - Created initial README.md with basic project information
   ```bash
   # Create README.md file with basic content
   touch README.md
   # Edit README.md with content
   ```

4. **Create Master Branch**
   - Set up the master branch as the initial branch
   ```bash
   git add README.md
   git commit -m "Initial commit with README.md"
   git remote add origin https://github.com/SlayerK15/devops-git-project.git
   git push -u origin master
   ```

## Branch Management

1. **Create Main Branch**
   - Created main branch as the production branch from master
   ```bash
   git checkout -b main
   git push -u origin main
   ```

2. **Create Dev Branch**
   - Created dev branch for development work from main
   ```bash
   git checkout main
   git checkout -b dev
   git push -u origin dev
   ```

3. **Create Feature Branch**
   - Created feature branch for new features from dev
   ```bash
   git checkout dev
   git checkout -b feature
   ```

## Feature Implementation

1. **Add Enhanced Documentation**
   - Updated README.md with comprehensive information
   - Created PROCESS.md to document the workflow
   - Added Docker installation script
   - Created .gitignore file

2. **Commit and Push Feature Branch**
   ```bash
   git add README.md PROCESS.md docker_install.sh .gitignore
   git commit -m "Add enhanced documentation and Docker installation script"
   git push -u origin feature
   ```

## Pull Request and Merge Workflow

1. **Merge Feature to Dev**
   - Created pull request from `feature` to `dev` on GitHub
   - Reviewed changes
   - Approved and merged pull request
   ```bash
   # After merging on GitHub:
   git checkout dev
   git pull origin dev
   ```

2. **Tag Dev Branch**
   - Added version tag to dev branch
   ```bash
   git tag -a v0.1.0 -m "Development version 0.1.0"
   git push --tags
   ```

3. **Merge Dev to Main**
   - Created pull request from `dev` to `main` on GitHub
   - Reviewed changes
   - Approved and merged pull request
   ```bash
   # After merging on GitHub:
   git checkout main
   git pull origin main
   ```

4. **Tag Main Branch**
   - Added release version tag to main branch
   ```bash
   git tag -a v1.0.0 -m "Release version 1.0.0"
   git push --tags
   ```

## Git Commands Reference

Below is a summary of the Git commands used in this workflow:

```bash
# Repository initialization
git init
git remote add origin https://github.com/SlayerK15/devops-git-project.git

# Branching
git checkout -b <branch-name>
git push -u origin <branch-name>

# Committing changes
git add <file1> <file2> ...
git commit -m "Commit message"
git push origin <branch-name>

# Pulling updates
git pull origin <branch-name>

# Tagging
git tag -a <tag-name> -m "Tag message"
git push --tags

# Viewing status
git status
git log
git branch -a
```

This process demonstrates understanding of Git workflows and best practices as required by the DevOps Internship Task 4.