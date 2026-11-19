# Git mini exercise — answers

The workflow was completed using a helper that ran the Git commands. This file records the commands and observations, rather than claiming they were all typed manually.

## Part 1 — Setup

Git version was checked with `git --version` (Apple Git 2.50.1).
The identity was set inside the exercise repository:

```bash
git config user.name "Dinou265"
git config user.email "98661687+Dinou265@users.noreply.github.com"
```

## Parts 2 and 3 — First repository and commit

```bash
mkdir my-first-repo
cd my-first-repo
git init -b main
touch readme.txt
git status
git add readme.txt
git commit -m "Add readme file"
git --no-pager log --oneline
```

## Part 4 — Make changes

```bash
printf 'First line of text\n' >> readme.txt
git status
git add readme.txt
git commit -m "Add a line to readme"
git rev-list --count HEAD
```

Before staging, `git status` showed that readme.txt was modified but not staged. After this second commit, the count was 2.

## Part 5 — Exploration

- `git diff`: shows unstaged changes compared with the staging area. Before staging the new line, it showed the added text. After committing with no further edits, it was empty.
- `git log --oneline`: shows each commit using a short ID and its message.

## Parts 6 and 7 — Branches and script

```bash
git branch
git branch feature-script
git switch feature-script
git switch -c dev
git switch feature-script
git branch --show-current
# Write install.sh with its shebang, messages, package update and tree installation.
chmod +x install.sh
bash -n install.sh
git add install.sh
git commit -m "Add install script"
git --no-pager log --oneline
```

The script selects Homebrew or apt-get. Its syntax was checked, but installing tree is not claimed as a completed runtime test.

## Part 8 — Merge

```bash
git switch main
ls
git merge feature-script
ls
git branch -d feature-script
git --no-pager log --oneline
```

Before merging, install.sh was absent on main because the commit adding it was only on feature-script. After the merge, it was present. Main had not diverged, so the merge was a fast-forward and main reached all three commits.

## Part 9 — Publish

```bash
gh repo create Dinou265/my-first-repo --public --source=. --remote=origin --push
```

This created the repository without an extra README commit, configured origin, and pushed the local history. The equivalent separate linking and push commands are:

```bash
git remote add origin https://github.com/Dinou265/my-first-repo.git
git push -u origin main
```

GitHub displayed install.sh, readme.txt, and the three commits. The separate commands are alternatives, not extra commands run after origin already existed.

## Part 10 — Delete and clone

After making an external backup, the helper left the repository folder, deleted only the dedicated local practice folder, cloned it from GitHub, and checked the files and original commit ID:

```bash
cd "$HOME/oop-exercises"
rm -r "$HOME/oop-exercises/my-first-repo"
git clone https://github.com/Dinou265/my-first-repo.git "$HOME/oop-exercises/my-first-repo"
cd "$HOME/oop-exercises/my-first-repo"
ls
git --no-pager log --oneline
```

Both tracked files and the same three-commit history were recovered.

## Part 11 — Full workflow

The temporary local and GitHub my-first-repo were deleted only after explicit confirmation and a backup. AIDAMS was left untouched.

```bash
cd "$HOME/oop-exercises"
rm -r "$HOME/oop-exercises/my-first-repo"
gh repo delete Dinou265/my-first-repo --yes
mkdir bash-installer
cd bash-installer
git init -b main
# Set the same local commit identity; write README.md and .gitignore.
git add README.md .gitignore
git commit -m "Add README"
git switch -c feature-install
# Copy the preserved install.sh into this repository.
chmod +x install.sh
git add install.sh
git commit -m "Add install script"
git switch main
git merge feature-install
git branch -d feature-install
# Write these answers after the practical workflow.
git add answers.md
git commit -m "Add exercise answers"
gh repo create Dinou265/bash-installer --public --source=. --remote=origin --push
```

The final merge was also a fast-forward. The last additional commit records the written answers.

## Reflection

- **Why version control?** It keeps a history, helps recover earlier work and makes collaboration easier.
- **Staging vs committing?** Staging selects the content for the next snapshot. Committing records that snapshot in local history.
- **When to commit?** After a small, coherent change that is worth saving. Avoid mixing unrelated changes.
- **init vs clone?** init starts a repository here. clone copies an existing repository and its history.
- **Why clear messages?** They explain what changed so it is easier to review history or find the change that caused a problem.
- **Why branches?** They let work develop separately from the main committed line before integration.
- **When use a new branch?** For a feature, fix or experiment that should stay separate until it is ready.

## Original practice history

Captured before deleting the temporary repository:

```text
5747dba Add install script
947e3e4 Add a line to readme
4a1c3a6 Add readme file

```
