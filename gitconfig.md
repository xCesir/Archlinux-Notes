`git config --global user.email "78450857+xCesir@users.noreply.github.com"`

`git config --global user.name "xCesir"`

`git config --global core.editor "code-oss --wait"`

`git config --global init.defaultBranch main`

`git config --list`

`git config --global --unset gpg.format`

`gpg --list-secret-keys --keyid-format=long`

output: `ed25519/ABCDEF0123456789`

`git config --global user.signingkey ABCDEF0123456789`

`git config --global commit.gpgsign true`

`git config --global tag.gpgSign true`

`[ -f ~/.zshrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zshrc`
