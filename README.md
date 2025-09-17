# Virtusa_VIT_Team-5
Business Case #4 - SOCIETY FINANCIAL MANAGEMENT

🚀 Git Workflow Guide for Virtusa_VIT_Team-5

This document explains how to clone the repository, create a branch, and start working on individual features.

1. Create a folder , say virtusa  
Now open this folder in VSCode  

2. Clone the Repository (One Time Setup)
Run this in your terminal (Git Bash / VS Code terminal):   
git clone https://github.com/man0j-1234/Virtusa_VIT_Team-5.git   
cd Virtusa_VIT_Team-5  

3. Create a New Branch
Each feature / bug fix should have its own branch.
Follow the naming convention:  
feature/<feature-name> → for new features  
fix/<issue-name> → for bug fixes  
docs/<doc-name> → for documentation    
Example:    
git checkout -b feature/login-page   

4. Work on Your Feature  
Add or update code.  
Test your changes locally.  

5. Stage and Commit Changes  
git add .  
git commit -m "Added login page UI"  

6. Push Your Branch to GitHub  
git push origin feature/login-page  

7. Create a Pull Request (PR)  
Go to the GitHub repository: Virtusa_VIT_Team-5  
You’ll see a banner suggesting to create a PR.  
Open a Pull Request against main.  
Add reviewers (team members) and wait for approval.  

✅ Best Practices  
One branch per feature (not per developer).  
Commit often with meaningful messages.   
Pull frequently from main to avoid conflicts.  
Never push directly to main.  
