# Create PR
BRANCH=$(git rev-parse --abbrev-ref HEAD)

IFS='-' read -r KIND PROJECT NUM REST <<< "$BRANCH"
DESCRIPTION=$(echo $REST | tr '-' ' ')

TICKET=$(echo "$PROJECT-$NUM")
echo $KIND: $TICKET $DESCRIPTION

hub pull-request --assign jnthnrzr --browse --draft -m -F --
