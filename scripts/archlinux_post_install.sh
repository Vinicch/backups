YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Updating mirrors...${NC}"

# If using Manjaro
#sudo pacman-mirrors --geoip

# If using other Arch distros
sudo pacman -S reflector
sudo reflector -f 30 -l 30 --number 10 -p http -p https --verbose --save /etc/pacman.d/mirrorlist

echo -e "${YELLOW}Installing base dev tools...${NC}"

sudo pacman -S base-devel bash-completion bashtop docker docker-compose vim git wget ttf-fira-code tar unrar zip unzip

echo -e "${YELLOW}Installing Pacman helper...${NC}"

cd $HOME && git clone https://aur.archlinux.org/paru-bin.git
cd $HOME/paru-bin && makepkg -si
cd $HOME && rm -rf paru-bin

echo -e "${YELLOW}Updating system...${NC}"

paru
