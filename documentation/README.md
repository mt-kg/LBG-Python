# THIS IS OUR NEW README FILE

## Initialise a new repo
```
git init
```

## To stage all files
```
git add *
```

## To commit staged files
```
git commit -m "meaningful message"
```

## To push commits to remote repo
```
git push -u REMOTE_NAME BRANCH_NAME
```
```
git push
```

## To create a branch
```
git branch NEW_BRANCH_NAME
```
```
git checkout -b NEW_BRANCH_NAME
```

##To swap branch
```
git checkout BRANCH_NAME
```

##To delete a branch
```git branch -d BRANCH_NAME
```

# To delete a branch from the remote

```
git push --delete REMOTE_NAME BRANCH_NAME
```

## To merge a branch into your current branch
```
git merge BRANCH_NAME
```

## To undo a commit with a new commit
```
git revert COMMIT_IDENTIFIER
```

## To delete all commits back to a specific point
```
git reset --hard COMMIT_IDENTIFIER
```

## To get updates from a remote and merge them locally
```
git pull REMOTE_NAME BRANCH_NAME
```
