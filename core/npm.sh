#!/data/data/com.termux/files/usr/bin/zsh

npm install -g vtop
npm install -g serve
npm install -g hicat # command-line syntax highlighter — https://www.npmjs.com/package/hicat
npm install -g speed-test
npm install -g diff-so-fancy # Good-lookin' diffs. Actually… nah… The best-lookin' diffs. — https://github.com/so-fancy/diff-so-fancy
npm install -g fkill-cli # Fabulously kill processes. — https://github.com/sindresorhus/fkill-cli
npm install -g ntl # Npm Task List: Interactive cli menu to list/run npm tasks - https://github.com/ruyadorno/ntl
npm install -g kmdr # Learn CLI commands with kmdr explain - https://kmdr.sh
npm install -g git-branch-select
npm install -g fx # https://github.com/antonmedv/fx
npm install -g zx

# config
npm config set save-exact true
npm config set tag-version-prefix ""
npm config set progress false
npm config set fetch-retries 3
npm config set fetch-retry-mintimeout 15000
npm config set fetch-retry-maxtimeout 90000
