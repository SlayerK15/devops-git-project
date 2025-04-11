# DevOps Git Project

This repository demonstrates Git best practices for DevOps workflows as part of the DevOps Internship Task 4.

## Project Description

This project showcases Git version control workflows including:

- Branching strategies
- Pull request management
- Tagging releases
- Documentation practices

## Repository Structure

- `master` branch: Initial repository setup
- `main` branch: Production-ready code
- `dev` branch: Development and integration
- `feature` branch: Feature implementation with additional files

## Project Components

- **README.md**: Project documentation
- **PROCESS.md**: Workflow documentation
- **docker_install.sh**: Script to install Docker
- **.gitignore**: Configuration for ignored files

## Git Workflow

1. Create a feature branch from `dev`
2. Implement changes and commit them
3. Push the feature branch to GitHub
4. Create a pull request to merge into `dev`
5. After review and approval, merge into `dev`
6. Create a tag for the development version
7. Merge `dev` into `main` for production
8. Create a release tag in `main`

## Getting Started

```bash
# Clone the repository
git clone https://github.com/SlayerK15/devops-git-project.git

# Navigate to the project
cd devops-git-project

# View all branches
git branch -a

# Check out a specific branch
git checkout <branch-name>
```

## Author

Created by SlayerK15