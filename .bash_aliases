######## Docker ########

# Stop All Running Docker Containers
function stopdocker {
    docker stop $(docker ps -a -q)
    docker network prune -f
}

# Remove Stopped Containers and Networks
function rmdocker {
    docker rm $(docker ps -a -q)
    docker network prune -f
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

######## Prductivity Tools ########

function tagtime {
    cd ~/git/personal/TagTime/
    ./tagtimed.pl &
}

alias solaar="~/git/personal/Solaar/bin/solaar &"

function startseq {
    solaar
    tagtime &
    sudo openvpn --config /../../../home/michael/Documents/Michael_Wheeler@52.208.69.192.ovpn
}

# cd into Opia repos
function op {
    cd ~/git/opia/opia-$1
}

# cd into cycle saver PHP
alias cyclesaver="cd ~/git/personal/cycle-saver-api-php"

# cd into linux setup
alias linuxsetup="cd ~/git/personal/linux-setup"

# cd into personal site
alias personalsite="cd ~/git/personal/personal-site"

######## PHPStorm ########
# Start PHPStorm
alias storm="~/PhpStorm-193.5233.101/bin/./phpstorm.sh >/dev/null 2>&1 < /dev/null &"
