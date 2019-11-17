sudo cp /tmp/custom-config/mirrorlist /etc/pacman.d/mirrorlist
sudo cp /tmp/custom-config/.bashrc ~/.bashrc
sudo cp /tmp/custom-config/idea.sh ~/idea.sh
mkdir -p ~/.local/share/keyrings
sudo cp -r /tmp/custom-config/keyrings ~/.local/share/
sudo cp /tmp/custom-config/.gitconfig ~/.gitconfig
sudo cp /tmp/custom-config/.xinitrc ~/.xinitrc

sudo pacman --noconfirm -Sy \
	bash bash-completion coreutils file grep openssl openssh nano sudo tar xz procps wget pkgconf base-devel icu \
	libsecret gnome-keyring \
	noto-fonts \
	shadow \
	cmake gcc git linux-headers glibc make \
	python-pip python \
	gradle \
	yarn nodejs

yarn global add @angular/cli
$(yarn global bin)/ng config -g cli.packageManager yarn

IDEA_VERSION=2019.2.4-no-jbr
wget https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz
tar -xf ideaIU-$IDEA_VERSION.tar.gz
rm ideaIU-$IDEA_VERSION.tar.gz
mv idea-IU-* idea-IU

wget https://gitlab.com/GrantMoyer/lssecret/-/archive/master/lssecret-master.tar.gz
tar -xf lssecret-master.tar.gz
rm lssecret-master.tar.gz
sudo make -C lssecret-master install


printf "$GIT_USER@$GIT_TOKEN" | secret-tool store --label="IntelliJ Platform Settings Repository  github.com" account $GIT_USER service 'IntelliJ Platform Settings Repository  github.com' xdg:schema com.intellij.credentialStore.Credential
printf "89c7c84b-a4ce-4904-8ad8-5d404472c218@$GIT_TOKEN" | secret-tool store --label="IntelliJ Platform GitHub — 89c7c84b-a4ce-4904-8ad8-5d404472c218" account 89c7c84b-a4ce-4904-8ad8-5d404472c218 service 'IntelliJ Platform GitHub — 89c7c84b-a4ce-4904-8ad8-5d404472c218' xdg:schema com.intellij.credentialStore.Credential

git clone https://$GIT_TOKEN@github.com/$GIT_USER/$GIT_IDEA_SETTINGS.git
sudo mv ~/$GIT_IDEA_SETTINGS/ ~/.IntelliJIdea2019.2
sudo chmod -R ugo+rwx .IntelliJIdea2019.2