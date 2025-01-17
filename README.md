

# GitHub Repository Creator Script 🧑🏻‍💻

## Overview

This project provides a simple **GitHub Repository Creator** script that automates the process of creating GitHub repositories directly from the terminal. The script interacts with GitHub’s API to create new repositories, either private or public, and optionally adds a README file to the repository. The project aims to simplify repository management by streamlining the creation process with minimal inputs.

## Features
- **Create GitHub repositories** directly from the terminal.
- **Option to make the repository private** or public.
- **Option to add a README file** during repository creation.
- **Secure integration** with GitHub API using environment variables and Personal Access Tokens (PATs).
- **Lightweight and efficient** – no need to manually navigate the GitHub interface.

---

## Prerequisites

Before running the script, make sure you have:
- **GitHub account** with API access.
- **A Personal Access Token (PAT)** with the required permissions to create repositories.

---

## How to Set Up the Script

### 1. Create a GitHub Personal Access Token (PAT)
To securely authenticate and interact with the GitHub API, you need to create a Personal Access Token (PAT).

#### Steps to Create a GitHub PAT:
1. Go to the top right corner of GitHub and click your profile picture, then select **Settings**.
2. Scroll down in the left menu and select **Developer settings**.
3. Select **Personal access tokens** (fine-grained).
4. Click **Generate new token**.
5. **Give the token a name** (e.g., "GitHub Repo Creator").
6. Set the **expiration date** to **1 day** (custom).
7. Under **Repository access**, select **All repositories**.
8. Under **Repository administration**, select **Read and write** access.
9. Click **Generate token** and copy the token. **Keep it secure**, as you won’t be able to view it again.

---

### 2. Git Clone: 
```
git clone https://github.com/nsahil992/Github-Repo-Creator.git
```

---

### 3. Set Up the `.env` File

Create a `.env` file in the same directory as the script to store your sensitive information like your GitHub username and PAT.

From your terminal, if the Github-Repo-Creator exits in on your Desktop then:
```
cd /path-to-the-cloned-repo
```

#### Steps to Create `.env`:
1. In the script directory, run:
   ```bash
   touch .env
   ```
2. Open the `.env` file:
   ```bash
   vim .env
   ```
3. Add your GitHub username and PAT:
   ```
   GITHUB_USERNAME=your_github_username
   GITHUB_TOKEN=your_personal_access_token
   ```
4. Save the file (press `Esc` then `Shift + :`, and `wq` to exit).
5. **Ensure the `.env` file is kept private**:
   ```bash
   chmod 600 .env
   ```

---

### 3. Safeguard Your Token

To prevent your `.env` file from being pushed to a public repository, add it to `.gitignore`.

#### Steps:
1. Create or open the `.gitignore` file:
   ```bash
   touch .gitignore
   vim .gitignore
   ```
2. Add `.env` to the `.gitignore` file:
   ```
   .env
   ```
3. Save and close the file.

---

### 4. Run the Script

Once the setup is complete, make the script executable and run it:

#### Steps:
1. **Make the script executable**:
   ```bash
   chmod +x github-repo-creator.sh
   ```
2. **Run the script**:
   ```bash
   ./github-repo-creator.sh
   ```
3. The script will prompt you for the repository name, privacy setting (private or public), and whether to add a README file. Follow the prompts to complete the process.

**🥳🎉!** Your GitHub repository is created!

---

## Conclusion

This script simplifies the process of creating repositories on GitHub, saving you time and effort. With a simple setup, you can start creating repositories securely with minimal interaction. Make sure to safeguard your token and keep it within your `.env` file.

---

**Security Reminder**:
- Always use tokens with limited permissions, only granting access to necessary resources.
- Rotate your tokens regularly to mitigate any potential security risks.
- **Do not share your `.env` file** publicly or commit it to version control.

---

### If you found this project valuable and helpful, consider giving it a ⭐️. Your support motivates me to create something valuable and impactful.

---
