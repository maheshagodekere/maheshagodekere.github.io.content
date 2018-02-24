#!/bin/bash

echo -e "\033[0;32mDeploying maheshagodekere.io update to GitHub...\033[0m"

SOURCE=$HOME/dev/ml/maheshagodekere.github.io.content
DESTINATION=$HOME/dev/ml/maheshagodekere.github.io/

echo "Building from $SOURCE"
hugo
if [ $? -eq 0 ]; then
    echo "Copying to $DESTINATION"
    cp -a $SOURCE/public/. $DESTINATION
    cp $SOURCE/CNAME $DESTINATION
fi

cd $DESTINATION
git add .

# Commit changes.
msg="rebuilding maheshagodekere.io site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

cd $SOURCE