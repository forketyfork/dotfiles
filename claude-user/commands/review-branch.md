Review the changes in this branch by comparing the merge base of `master` (or `main`) and current branch to the current branch:
```shell
git diff main...
```

Review both committed, staged and unstaged files in the current working directory.

Consider the context of the project and changed files.

Consider not only what was done, but what wasn't done, for example:
- some piece of code was updated, but another similar piece of code was missed;
- an issue was fixed in one place, but there are other places affected by the same issue.

Pay special attention to:
- possible bugs;
- inconsistencies;
- performance issues.

Review the implementation against the CLAUDE.md guidelines.

Propose only significant improvements, do not report trivialities or code style issues.
In the end, output a comprehensive report to a file named `claude-review-<escaped-branch-name>.md`
