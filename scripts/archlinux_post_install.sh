NC='\033[0m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'

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
sudo pacman -S base-devel bash-completion bashtop bat discord docker docker-compose dust fd firefox neofetch neovim noto-fonts noto-fonts-emoji ripgrep starship tar tokei ttf-fira-code unrar unzip zip wget

echo -e "${YELLOW}Installing AUR helper...${NC}"
sudo pacman -S git
cd $HOME && git clone https://aur.archlinux.org/paru-bin.git
cd $HOME/paru-bin && makepkg -si
cd $HOME && rm -rf paru-bin/

echo -e "${YELLOW}Installing AUR packages...${NC}"
paru -S brave-bin visual-studio-code-bin

echo -e "${YELLOW}Configuring Docker...${NC}"
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

echo -e "${GREEN}All done!${NC}"
