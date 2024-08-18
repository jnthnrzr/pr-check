# Create PR
BRANCH=$(git rev-parse --abbrev-ref HEAD)

IFS='-' read -r KIND PROJECT NUM REST <<< "$BRANCH"
DESCRIPTION=$(echo $REST | tr '-' ' ')

TICKET=$(echo "$PROJECT-$NUM")

TITLE="$KIND: $TICKET $DESCRIPTION"

hub pull-request \
    --assign jnthnrzr \
    --browse \
    --draft \
    -m "$TITLE" \
    -m "Jira: https://sesamecare.atlassian.net/browse/$TICKET" \
    -m "### Description" \
    -m "" \
    -m "$*"
