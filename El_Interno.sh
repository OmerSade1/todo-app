# Bash script to completely mess up a repository by adding a bunch of files, commits, and branches.
# Usage: ./gremlin.sh <num_commits>
# Written by: Leonardo Juárez Zucco
# To be used for educational purposes only and with caution.
# This script is not meant to be used in production.
# This script has to be run in a git repository.

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: ./gremlin.sh <num_commits>"
    exit 1
fi
# Check if the current directory is a git repository
if [ ! -d .git ]; then
    echo "This script has to be run in a git repository."
    exit 1
fi
# Set the GIT_EDITOR environment variable to :wq
export GIT_EDITOR=':wq'

# Get the number of commits from the command-line argument
num_commits=$1
num_branches=$((num_commits/10))
num_tags=$num_branches
num_orphans=$((num_commits/20))

# Create a number of files equal to the number of commits
for i in $(seq 1 $num_commits)
do
    echo "This is file $i" > file$i.txt
    git add file$i.txt
    git commit -m "Add file $i"
    #git push origin master
done

# Create a number of branches and commits
commits_per_branch=$((num_commits/10))
for i in $(seq 1 $num_branches)
do
    git checkout -b branch$i
    for j in $(seq 1 $commits_per_branch)
    do
        echo "This is file $j in branch $i" > file$j.txt
        git add file$j.txt
        git commit -m "Add file $j in branch $i"
        git push origin branch$i
    done
done

# Merge all branches into master
git checkout master
for i in $(seq 1 $num_branches)
do
    git merge branch$i --no-ff
    # Resolve any merge conflicts by taking changes from the incoming branch
    git checkout --theirs .
    git add .
    git commit -m "Merge branch$i into master, resolving conflicts by taking changes from branch$i"
    git push origin master
done

# Create some orphan branches
for i in $(seq 1 $num_orphans)
do
    git checkout --orphan orphan$i
    echo "This is file in orphan$i" > file_orphan$i.txt
    git add file_orphan$i.txt
    git commit -m "Add file in orphan$i"
    git push origin orphan$i
done

# Create some stashes
git stash save "This is a stash"

# Leave the repository in a detached head state
git checkout HEAD~1

# Create a number of tags equal to the number of branches
for i in $(seq 1 $num_tags)
do
    git tag tag$i
done

# Close the script
exit 0
