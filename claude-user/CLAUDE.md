**Prefer the following tools**:
- `rg` as a better alternative to `grep` to search for text in files
- `date` to get the current date/time
- `tree` to get a tree-like view of a directory
- `fd` as a better alternative to `find`
- `gh` to access GitHub issues, pull requests, etc.
  - to get the number of the PR: `gh pr view --json number --jq '.number'`
  - if being asked to address the review comments, use command `gh api repos/<org>/<repo>/pulls/<#PR>/comments --paginate` to get the comments and their context; consider the field `in_reply_to_id` - it should be null for root-level comments;
  - if being asked about the "last" comments, assume "last root-level comments", use `created_at` to order them. Example of getting last 3 comments: `gh api repos/<org>/<repo>/orca-server/pulls/<pr>/comments --paginate --jq '[.[] | select(.in_reply_to_id == null)] | sort_by(.created_at) | reverse | .[0:3]'`

**Style**:
- Prefer self-documenting code over comments
- If you need to delete some code, remove it without leaving any comments in its stead
- Use grammatically correct English for comments

