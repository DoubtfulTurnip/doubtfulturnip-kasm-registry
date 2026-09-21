#!/bin/bash
set -euo pipefail

DEFAULT=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')

mkdir -p base
cat > base/index.html << HTML
<meta http-equiv="refresh" content="0; url=./$DEFAULT/">
HTML
touch base/.nojekyll

# Generating documentation for each other branch in a subdirectory.
# A single branch with an incompatible toolchain (e.g. an archived version
# pinned to an older Next.js release) must not block publishing the rest.
echo "All branches:"
git fetch --all
echo "$(git branch --remotes --format '%(refname:lstrip=3)' | grep -Ev '^(HEAD|develop|gh-pages)$')"
for BRANCH in $(git branch --remotes --format '%(refname:lstrip=3)' | grep -Ev '^(HEAD|develop|gh-pages)$'); do
    SANITIZED_BRANCH="$(echo "$BRANCH" | sed 's/\//_/g')"
    echo "$SANITIZED_BRANCH" >> base/versions.txt
    git checkout -f "$BRANCH"

    if ! node processing; then
        echo "::warning::processing failed for branch $BRANCH, skipping"
        continue
    fi

    cp -a public/. process
    sed -i "s/1.0/$SANITIZED_BRANCH/" site/next.config.js

    if npm run deploy --prefix site; then
        cp -a process/. public/ # Have to run it again because the deploy wipes the file and folders out
        rm -rf process
        sed -i "s/$SANITIZED_BRANCH/1.0/" site/next.config.js # Set it back to 1.0 so it can be changed again on the next loop
        mv public "base/$SANITIZED_BRANCH"
        cp "base/$SANITIZED_BRANCH/favicon.ico" base/favicon.ico
    else
        echo "::warning::Build failed for branch $BRANCH, skipping"
        sed -i "s/$SANITIZED_BRANCH/1.0/" site/next.config.js
        rm -rf process public
    fi
done

mv base public

# A broken build for the default branch means the registry root (which
# redirects to it) and Kasm's schema-list check both end up 404ing, even
# though every step above only ever warns and keeps going. Fail loudly here
# instead of silently publishing a non-functional registry.
if [ ! -f "public/$DEFAULT/index.html" ] || [ ! -f "public/$DEFAULT/list.json" ]; then
    echo "::error::Build for the default branch ($DEFAULT) did not produce an index.html/list.json — refusing to publish a broken registry."
    exit 1
fi
