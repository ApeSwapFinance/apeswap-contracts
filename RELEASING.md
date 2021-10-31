# Releasing

> Visit the documentation for [details about release schedule].

Start on an up-to-date `main` branch.

Create the release branch with `yarn run release start minor`.

Publish a release candidate with `yarn run release rc`.

Publish the final release with `yarn run release final`.

Follow the general [OpenZeppelin Contracts release checklist].

## Merging the release branch

After the final release, the release branch should be merged back into `master`. This merge must not be squashed because it would lose the tagged release commit. Since the GitHub repo is set up to only allow squashed merges, the merge should be done locally and pushed.

Make sure to have the latest changes from `upstream` in your local release branch.

```
git checkout release-vX.Y.Z
git pull upstream
```

```
git checkout master
git merge --no-ff release-vX.Y.Z
git push upstream master
```

The release branch can then be deleted on GitHub.
