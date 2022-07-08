NC='\033[0m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'

# Basic setup
echo "Are you using vanilla Arch? [y/n]"
read -r IS_VANILLA

if [ $IS_VANILLA = y ]; then
    echo -e "${YELLOW}Updating mirrors...${NC}"
    sudo pacman -S reflector
    sudo reflector -f 30 -l 30 --number 10 -p https --verbose --save /etc/pacman.d/mirrorlist
fi

echo -e "${YELLOW}Updating system...${NC}"
sudo pacman -Syyu

echo -e "${YELLOW}Installing packages...${NC}"
sudo pacman -S base-devel bash-completion bashtop discord docker docker-compose firefox neofetch neovim noto-fonts noto-fonts-emoji tar ttf-fira-code unrar unzip zip wget

# AUR
echo -e "${YELLOW}Installing AUR helper...${NC}"
sudo pacman -S git
cd $HOME && git clone https://aur.archlinux.org/paru-bin.git
cd $HOME/paru-bin && makepkg -si
cd $HOME && rm -rf paru-bin/

echo -e "${YELLOW}Installing AUR packages...${NC}"
paru -S brave-bin visual-studio-code-bin

# Plugins
echo -e "${YELLOW}Installing vim-plug...${NC}"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo -e "${YELLOW}Installing VSCode extensions...${NC}"
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension golang.go
code --install-extension Gruntfuggly.todo-tree
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension PKief.material-icon-theme
code --install-extension rangav.vscode-thunder-client
code --install-extension rust-lang.rust-analyzer
code --install-extension tamasfe.even-better-toml
code --install-extension vadimcn.vscode-lldb
code --install-extension yzhang.markdown-all-in-one
code --install-extension zhuangtongfa.material-theme

echo -e "${GREEN}All done!${NC}"
