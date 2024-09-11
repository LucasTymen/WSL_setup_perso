#!/bin/bash

# Section 1: Pré-requis WSL (si sous Windows)
if grep -q Microsoft /proc/version; then
    # Activer WSL et la virtualisation sous Windows (uniquement si applicable)
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    wsl --install
fi

# Update system
sudo apt update && sudo apt upgrade -y

# Section 2: Installation de base (Zsh et Oh My Zsh)
sudo apt install -y zsh curl git
chsh -s $(which zsh)
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installer les plugins Zsh (Autosuggestions et Syntax Highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configuration du fichier .zshrc
cat <<EOT >> ~/.zshrc

# Oh My Zsh plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Améliorations Zsh
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=46;34:cd=46;34:su=41;33:sg=30;43:tw=42;30:ow=42;30"
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Autosuggestions settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Historique partagé entre plusieurs sessions
setopt SHARE_HISTORY

# Activer la complétion des commandes
autoload -U compinit && compinit

# Historique
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Ajout de la coloration syntaxique
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ajout des suggestions automatiques
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

EOT

# Recharger Zsh pour appliquer les changements
source ~/.zshrc

echo "Zsh est maintenant configuré avec autosuggestions, coloration syntaxique, et autres améliorations !"

# Section 3: Java & Spring/Angular Setup
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.302.hs-adpt
sdk install java 17.0.1.hs-adpt
sdk install java 21.0.1.hs-adpt
sudo apt install maven -y
sdk install gradle

# Section 4: Python & Django/Flask Setup
sudo apt install python3 python3-pip -y
pip3 install django flask djangorestframework psycopg2
pip3 install jupyterlab

# Section 5: Node.js & Frontend Setup
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
npm install --global yarn
npm install -g @angular/cli

# Section 6: Ruby & Rails Setup
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
exec zsh
rbenv install 3.1.2
rbenv global 3.1.2
gem install rails

# Section 7: Bases de Données (MySQL, PostgreSQL, MongoDB)
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo apt install postgresql postgresql-contrib libpq-dev -y
sudo systemctl start postgresql
sudo apt install -y mongodb-org
sudo systemctl start mongod

# Section 8: Serveurs (Nginx, Apache, Tomcat)
sudo apt install nginx apache2 tomcat9 -y
sudo systemctl start nginx
sudo systemctl start apache2
sudo systemctl start tomcat9

# Section 9: Docker, Podman, Docker Hub & GitLab
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo apt install podman -y

# Docker Hub (Connexion)
sudo docker login

# GitLab (Setup SSH)
sudo apt install git -y
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Section 10: GitHub CLI
sudo apt install gh -y
gh auth login

# Section 11: VS Code & Extensions
sudo snap install --classic code
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-python.python
code --install-extension redhat.java
code --install-extension vscjava.vscode-spring-initializr
code --install-extension dbaeumer.vscode-eslint

# Finalisation
echo 'alias code="code-insiders"' >> ~/.zshrc
echo 'alias ll="ls -la"' >> ~/.zshrc
source ~/.zshrc

# Vérification des versions
java -version
python3 --version
node -v
ruby -v
rails -v
