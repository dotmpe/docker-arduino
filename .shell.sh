#!/bin/bash

# highland builder does not obey skip tag
case "$(echo "$COMMIT_MSG" | tr 'A-Z' 'a-z') " in
  *"[skip build]"* | *"[build skip]"* | *"[skip ci]"* | *"[ci skip]"* )
    echo "Skipping build by ci-skip commit message"
    exit 0 ;;
esac

true "${DOCKER_TAGS:="$DOCKER_TAG"}"

true "${X_DCKR_CI_TIME:="` git show -s --format=%cI $GIT_SHA1`"}"
true "${X_DCKR_AI_TIME:="` git show -s --format=%aI $GIT_SHA1`"}"

urlsafe_datetime()
{
  test -n "${1:-}" || set -- "$(date --rfc-3339=seconds)"

  echo "$1" |tr ' ' 'T' |sed 's/+00:00/Z/g' |sed 's/+/%2B/g'
}

git_rev_tags()
{
  test $# -le 1 || return
  test $# -gt 0 -a -n "${1:-}" || set -- "$GIT_SHA1"

  git for-each-ref --format='%(objectname) %(refname:short)' refs/tags/ |
    grep ^$1 |
      cut -d' ' -f2
}
