# Directives for development

#
# Git
#

# function git-parent {
#     git show-branch -a \
#         | grep '\*' \
#         | grep -v `git rev-parse --abbrev-ref HEAD` \
#         | head -n1 \
#         | sed 's/.*\[\(.*\)\].*/\1/' \
#         | sed 's/[\^~].*//'
# }

#
# Perl
#

function pm-check {
    git diff --name-only --diff-filter=ACRM master... | grep -P '\.p[lm]' |xargs -r -I{} sh -c 'perlcritic || true';
}

#
# MySQL
#

function mysql-locate-constraint {
    local query="
        USE INFORMATION_SCHEMA;
        SELECT TABLE_NAME,
            COLUMN_NAME,
            CONSTRAINT_NAME,
            REFERENCED_TABLE_NAME,
            REFERENCED_COLUMN_NAME
        FROM KEY_COLUMN_USAGE
        WHERE REFERENCED_COLUMN_NAME IS NOT NULL
            AND CONSTRAINT_NAME LIKE '%$1%'
    ";
    echo $query | mysql |column -t -x
}


