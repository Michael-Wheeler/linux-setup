######## Docker ########
# Stop Running Docker Containers
alias stopdockers="docker stop $(docker ps -a -q)"

function stopdocker {
    docker stop $(docker ps -a -q)
}

# Remove Stopped Containers
function rmdocker {
    docker rm $(docker ps -a -q)
}

######## PHP ########
# Composer Install without reqs
alias icomposer="composer install --ignore-platform-reqs"

# Runs tests in docker container
alias testf="bin/docker-dev-test --filter"

# Runs static code inspections
function checkcode {
    local PHPSTAN=bin/phpstan
    local PSR12=bin/comply-to-psr12
    local CODESNIFFER=bin/docker-dev-codesniffer

    if [ -e "$PSR12" ]; then
        echo -e "\e[96m\e[1mPSR12 script present, running analysis\e[0m"
        bin/comply-to-psr12
    fi

    if [ -e "$CODESNIFFER" ]; then
        echo -e "\e[96m\e[1mPHP CodeSniffer present, running analysis\e[0m"
        bin/docker-dev-codesniffer
        echo ''
    fi

    if [ -e "$PHPSTAN" ]; then
        echo -e "\e[96m\e[1mPHPStan present, running analysis\e[0m"
        bin/phpstan
        echo ''
    fi

    return 0;
}

######## Git ########
# Push to git after running code checks
function pushgit {
    local PHPSTAN=bin/phpstan
    local PSR12=bin/comply-to-psr12
    local CODESNIFFER=bin/docker-dev-codesniffer

    if [ -e "$PSR12" ]; then
        echo -e "\e[96m\e[1mPSR12 script present, running analysis\e[0m"
        bin/comply-to-psr12
    fi

    if [ -e "$CODESNIFFER" ]; then
        echo -e "\e[96m\e[1mPHP CodeSniffer present, running analysis\e[0m"
        bin/docker-dev-codesniffer
        echo ''
    fi

    if [ -e "$PHPSTAN" ]; then
        echo -e "\e[96m\e[1mPHPStan present, running analysis\e[0m"
        bin/phpstan
        echo ''
    fi

    echo -e "\e[96m\e[1mCode checks passed, pushing code to GitHub\e[0m"
    git push
}

# To remove local git branches whose remote equivalent has been deleted
function cleangit {
    echo -e "\e[96m\e[1mFetching branches and tags from origin, tracking branches with no remote reference will be pruned\e[0m"
    git fetch -a -p
    echo ''

    DELETE='-d'
    if [[ $1 == "-D" ]]; then
        echo -e "\e[1m\e[31mHard delete specified, local branches with remote references that have been closed or merged will be deleted\e[0m"
        DELETE='-D'
    fi

    echo -e "\e[96m\e[1mRemoving local refs to remote branches\e[0m"
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch $DELETE;
    echo ''

    echo -e "\e[96m\e[1mMerging current branch with origin\e[0m"
    git merge FETCH_HEAD
}

######## Repos ########
# cd into hub
alias hub="cd ~/git/opia/opia-hub"

# cd into storage
alias storage="cd ~/git/opia/opia-storage"

# cd into notify
alias notify="cd ~/git/opia/opia-notify"

# cd into product
alias product="cd ~/git/opia/opia-product"

# cd into reseller
alias reseller="cd ~/git/opia/opia-reseller"

# cd into cloud
alias cloud="cd ~/git/opia/opia-cloud"

# cd into auth
alias auth="cd ~/git/opia/opia-auth"

# cd into qualify
alias qualify="cd ~/git/opia/opia-qualify"

# cd into skeleton
alias skeleton="cd ~/git/opia/opia-skeleton"

# cd into recycler-portal
alias recycler="cd ~/git/opia/opia-recycler-portal"

# cd into ocr validator
alias validator="cd ~/git/opia/opia-ocr-validator"

# cd into cloud
alias cloud="cd ~/git/opia/opia-cloud"

# cd into cms
alias cms="cd ~/git/opia/opia-cms"

# cd into crm
alias crm="cd ~/git/opia/opia-crm"

# cd into note
alias note="cd ~/git/opia/opia-note"

# cd into ocr
alias ocr="cd ~/git/opia/opia-ocr"

# cd into packages
alias packages="cd ~/git/opia/opia-packages"

# cd into promo-base
alias promobase="cd ~/git/opia/opia-promo-base"

# cd into promo-notifier
alias promonotifier="cd ~/git/opia/opia-promo-notifier"

# cd into visitor
alias visitor="cd ~/git/opia/opia-visitor"

# cd into secure-send
alias securesend="cd ~/git/opia/opia-secure-send"

# cd into talkdesk
alias talkdesk="cd ~/git/opia/opia-talkdesk"

# cd into opia-it-service-desk-scripts
alias servicedesk="cd ~/git/opia/opia-it-service-desk-scripts"

# cd into opia-lib-hub
alias libhub="cd ~/git/opia/opia-lib-hub"

# cd into opia-lib-ocr
alias libocr="cd ~/git/opia/opia-lib-ocr"

# cd into opia-lib-qualify
alias libqualify="cd ~/git/opia/opia-lib-qualify"

# cd into opia-lib-reseller
alias libreseller="cd ~/git/opia/opia-lib-reseller"

# cd into opia-lib-skeleton
alias libskeleton="cd ~/git/opia/opia-lib-skeleton"

# cd into opia-lib-visitor
alias libvisitor="cd ~/git/opia/opia-lib-visitor"

# cd into opia-lib-product
alias libproduct="cd ~/git/opia/opia-lib-product"

# cd into cycle saver PHP
alias cyclesaver="cd ~/git/personal/cycle-saver-api-php"

# cd into linux setup
alias linuxsetup="cd ~/git/personal/linux-setup"

# cd into personal site
alias personalsite="cd ~/git/personal/personal-site"

# cd into bison
alias bison="cd ~/git/opia/opia-promo-framework-bison"

######## PHPStorm ########
# Start PHPStorm
alias storm="~/PhpStorm-193.5233.101/bin/./phpstorm.sh >/dev/null 2>&1 < /dev/null &"
