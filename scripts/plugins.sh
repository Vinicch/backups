NC='\033[0m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'

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
