# foggly ![](https://travis-ci.org/fogglyorg/foggly.svg?branch=master)


## Developer Setup

### macOS requirements

#### Install Xcode command line tools

    xcode-select --install

#### Install Homebrew

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor

#### Install and start Postgres

    brew install postgresql
    ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

#### Install rbenv

    brew install rbenv
    rbenv init
    echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile


### Linux requirements

#### Install and start Postgres

    apt-get -y install postgresql postgresql-contrib libpq-dev

#### Install rbenv

    sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    mkdir -p ~/.rbenv/plugins
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bashrc
    source ~/.bashrc

### Project setup

#### Go to the project directory

    git clone git@github.com:fogglyorg/foggly.git
    cd foggly

#### Install the required version of Ruby

    rbenv install
    rbenv rehash

#### Install Bundler

    gem install bundler
    rbenv rehash

#### Install required gems

    bundle install
    rbenv rehash

#### Initial setup and start

    rails db:setup
    rails s

#### Browse to <http://localhost:3000>



## Git workflow

### Pull last changes from master

    git pull

### Create new local branch to work on the feature

    git checkout -b new_feature_branch

### During the development remember to commit from time to time

    git add file1 file2 # add files manually to git if needed
    git commit -am "my quick commit message"

### Once the work is done go back to the master branch

    git checkout master

### Pull last changes from master

    git pull

### Go back to your branch

    git checkout new_feature_branch

### Rebase on master and squash all commits

    git rebase master -i

### Push the local branch to Github

    git push -u origin new_feature_branch

### Go to the Github UI and open a Pull Request manually

<https://github.com/fogglyorg/foggly>



## Deployment instructions

Continuous Delivery based on Github Webhooks (push to master) and heroku.

Test the app: https://foggly.herokuapp.com

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
