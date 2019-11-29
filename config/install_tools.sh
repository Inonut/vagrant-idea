sudo pacman --noconfirm -Sy \
	python-pip python \
	gradle \
	yarn nodejs \
	android-tools

yarn global add @angular/cli
$(yarn global bin)/ng config -g cli.packageManager yarn

FLUTTER_VERSION=v1.9.1+hotfix.6-stable
wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_$FLUTTER_VERSION.tar.xz
tar -xf flutter_linux_$FLUTTER_VERSION.tar.xz
rm flutter_linux_$FLUTTER_VERSION.tar.xz
