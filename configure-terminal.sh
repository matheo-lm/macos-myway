#!/bin/bash

# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install iTerm2 (if not already installed)
brew install --cask iterm2

# Install Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme for Oh My Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Set the iTerm2 preferences
# First, set up the "Basic" tab
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Then, set up the "Profiles" tab
defaults write com.googlecode.iterm2.plist 'New Bookmarks' -array \
    '{ "Name" = "MyProfile"; "Guid" = "xxxx"; "Custom Directory" = "$HOME"; "Custom Command" = ""; "Initial Text" = ""; "Tags" = ("MyTag"); "Silence Bell" = true; "Use Non-ASCII Font" = true; "Non-ASCII Font" = "MesloLGS NF"; "Use Bold Font" = false; "Font Size" = 12; "Cursor Type" = 0; "Cursor Guide Color" = "#FFFFFF"; "Use Bright Bold" = false; "Use Bright Colors" = true; "Use Italic Font" = false; "Background Color" = "#1c1c1c"; "Foreground Color" = "#cccccc"; "Ansi 0 Color" = "#1c1c1c"; "Ansi 1 Color" = "#f92672"; "Ansi 2 Color" = "#a6e22e"; "Ansi 3 Color" = "#f4bf75"; "Ansi 4 Color" = "#66d9ef"; "Ansi 5 Color" = "#ae81ff"; "Ansi 6 Color" = "#a1efe4"; "Ansi 7 Color" = "#cccccc"; "Ansi 8 Color" = "#767676"; "Ansi 9 Color" = "#f92672"; "Ansi 10 Color" = "#a6e22e"; "Ansi 11 Color" = "#f4bf75"; "Ansi 12 Color" = "#66d9ef"; "Ansi 13 Color" = "#ae81ff"; "Ansi 14 Color" = "#a1efe4"; "Ansi 15 Color" = "#f8f8f8"; }'

# Set the Zsh theme to Powerlevel10k and enable additional features
sed -i -e 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)' >> ~/.zshrc
echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)' >> ~/.zshrc
echo 'POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"' >> ~/.zshrc
echo 'POWERLEVEL9K_SHORTEN_DIR_LENGTH=2' >> ~/.zshrc
echo 'POWERLEVEL9K_SHORTEN_DELIMITER=".." ' >> ~/.zshrc
echo 'POWERLEVEL9K_STATUS_VERBOSE=false' >> ~/.zshrc
echo 'POWERLEVEL9K_PROMPT_ADD_NEWLINE=true' >> ~/.zshrc
echo 'POWERLEVEL9K_DISABLE_RPROMPT=true' >> ~/.zshrc
echo 'POWERLEVEL9K_SHOW_CHANGESET=true' >> ~/.zshrc
echo 'POWERLEVEL9K_CHANGESET_HASH_LENGTH=8' >> ~/.zshrc
echo 'POWERLEVEL9K_VCS_SHORTENED_STATUS_LENGTH=4' >> ~/.zshrc
echo 'POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_to_3"' >> ~/.zshrc
echo 'POWERLEVEL9K_SHOW_TIME=true' >> ~/.zshrc
echo 'POWERLEVEL9K_TIME_FORMAT="%D{%I:%M %p}"' >> ~/.zshrc
echo 'POWERLEVEL9K_TIME_BACKGROUND="black"' >> ~/.zshrc
echo 'POWERLEVEL9K_TIME_FOREGROUND="white"' >> ~/.zshrc
echo 'POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0' >> ~/.zshrc
echo 'POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="black"' >> ~/.zshrc
echo 'POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="yellow"' >> ~/.zshrc

# Enable syntax highlighting in the terminal
brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Add aliases and functions to .zshrc
echo "alias ll='ls -alF'" >> ~/.zshrc
echo "alias la='ls -A'" >> ~/.zshrc
echo "alias l='ls -lh'" >> ~/.zshrc
echo "alias c='clear'" >> ~/.zshrc
echo "alias e='exit'" >> ~/.zshrc
echo "alias o='open .'" >> ~/.zshrc

echo "# Create a new directory and enter it" >> ~/.zshrc
echo "mkd() {" >> ~/.zshrc
echo " mkdir -p "$"" >> ~/.zshrc
echo " cd "$"" >> ~/.zshrc
echo "}" >> ~/.zshrc

echo "# Print the path of the current working directory with line numbers" >> ~/.zshrc
echo "p() {" >> ~/.zshrc
echo " pwd | sed "s|^.∗/[/]{1,}/.∗/[/]{1,}/|\1\n|g"" >> ~/.zshrc
echo "}" >> ~/.zshrc

#Reload the .zshrc file
source ~/.zshrc
echo "Terminal configuration complete. Please restart your terminal or run 'source ~/.zshrc' to apply the changes."
