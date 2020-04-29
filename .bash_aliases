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
    bin/comply-to-psr12
    bin/docker-dev-codesniffer
}

######## Git ########
# To remove local git branches whose remote equivalent has been deleted
function cleangit {
    git fetch -a -p
    git merge FETCH_HEAD
    git remote prune origin
    git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d;
    git pull
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
alias reseller="cd ~/git/opia/opia-product"

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

# cd into qualify
alias qualify="cd ~/git/opia/opia-qualify"

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
alias servicedesk="cd ~/git/opia/opia-opia-it-service-desk-scripts"

# cd into opia-lib-hub
alias libhub="cd ~/git/opia/opia-opia-lib-hub"

# cd into opia-lib-ocr
alias libocr="cd ~/git/opia/opia-opia-lib-ocr"

# cd into opia-lib-qualify
alias libqualify="cd ~/git/opia/opia-opia-lib-qualify"

# cd into opia-lib-reseller
alias libreseller="cd ~/git/opia/opia-opia-lib-reseller"

# cd into opia-lib-skeleton
alias libskeleton="cd ~/git/opia/opia-opia-lib-skeleton"

# cd into opia-lib-visitor
alias libvisitor="cd ~/git/opia/opia-opia-lib-visitor"

# cd into opia-lib-product
alias libproduct="cd ~/git/opia/opia-opia-lib-product"

# cd into cycle saver PHP
alias cyclesaver="cd ~/git/personal/cycle-saver-api-php"

######## PHPStorm ########
# Start PHPStorm
alias storm="~/PhpStorm-193.5233.101/bin/./phpstorm.sh >/dev/null 2>&1 < /dev/null &"
