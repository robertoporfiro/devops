
#!/bin/bash
# Autor: brunocampos01	
# Script install poweline-shell
# ----------------------------------- #

echo -e "Install powerline-shell (PIP) \n"
pip install powerline-shell
echo
echo -e "======================================== \n"


echo -e "Insert function in bashrc \n"
vim ~./bashrc
echo
echo
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
echo
echo
echo -e "======================================== \n"


echo -e "Create file config \n"
mkdir -p ~/.config/powerline-shell && powerline-shell --generate-config > ~/.config/powerline-shell/config.json
echo
echo -e "======================================== \n"

echo -e "install fonts-powerline \n"
sudo apt install fonts-powerline
echo
echo -e "======================================== \n"


echo -e " Visit: \n"
echo
echo -e "https://github.com/b-ryan/powerline-shell#bash"

