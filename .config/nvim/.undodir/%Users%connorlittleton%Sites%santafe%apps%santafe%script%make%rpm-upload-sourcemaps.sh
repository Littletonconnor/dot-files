Vim�UnDo� ri�r��n[Я���I�%�xp^L��� �۪   &                                   gxy:     _�                              ����                                                                                                                                                                                                                                                                                                                                                 v       gxy9     �               #   #!/usr/bin/env bash   set -euo pipefail   BSCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"   source "$SCRIPTPATH/_common.sh"       main() {   6  if [[ "${SENTRY_RELEASE_AUTH_TOKEN-}" != "" ]]; then   N    ./node_modules/.bin/sentry-cli --auth-token="$SENTRY_RELEASE_AUTH_TOKEN" \   4      releases --org=wealthfront --project=santafe \         new "$REVISION"           # shellcheck disable=SC2088       {   N    ./node_modules/.bin/sentry-cli --auth-token="$SENTRY_RELEASE_AUTH_TOKEN" \   4      releases --org=wealthfront --project=santafe \         files "$REVISION" \   P      upload-sourcemaps --ext js --ext map --url-prefix '~/assets' public/assets       }       N    ./node_modules/.bin/sentry-cli --auth-token="$SENTRY_RELEASE_AUTH_TOKEN" \   4      releases --org=wealthfront --project=santafe \         finalize "$REVISION"     fi       B  if [[ "${SELF_HOSTED_SENTRY_RELEASE_AUTH_TOKEN-}" != "" ]]; then   �    ./node_modules/.bin/sentry-cli --auth-token="$SELF_HOSTED_SENTRY_RELEASE_AUTH_TOKEN" --url=https://sentry.wlth.fr/ releases --org=wealthfront --project=santafe-javascript new "$REVISION"      ./node_modules/.bin/sentry-cli --auth-token="$SELF_HOSTED_SENTRY_RELEASE_AUTH_TOKEN" --url=https://sentry.wlth.fr/ releases --org=wealthfront --project=santafe-javascript files "$REVISION" upload-sourcemaps --ext js --ext map --url-prefix '~/assets' public/assets  		./node_modules/.bin/sentry-cli --auth-token="$SELF_HOSTED_SENTRY_RELEASE_AUTH_TOKEN" --url=https://sentry.wlth.fr/ releases --org=wealthfront --project=santafe-javascript files "$REVISION" upload-sourcemaps --ext js --ext map --url-prefix '~/vite' public/vite;   �    ./node_modules/.bin/sentry-cli --auth-token="$SELF_HOSTED_SENTRY_RELEASE_AUTH_TOKEN" --url=https://sentry.wlth.fr/ releases --org=wealthfront --project=santafe-javascript finalize "$REVISION"     fi   }       %benchmark_start rpm-upload-sourcemaps   main   $benchmark_stop rpm-upload-sourcemaps5�5��