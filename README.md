macOS Terminal Configuration

This repository contains a script for configuring the Terminal on macOS, based on the steps described in this blog post. The script installs iTerm2, Oh My Zsh, and the Powerlevel10k theme, and sets up several useful aliases and functions.
Usage

To configure your Terminal using this script, follow these steps:

Clone this repository to your local machine:
        
    git clone https://github.com/your-username/macos-terminal-configuration.git

Navigate to the cloned repository:

    cd macos-terminal-configuration

Run the script:

    ./configure-terminal.sh

Restart your Terminal, or run the following command to reload the .zshrc file:

    source ~/.zshrc

Features

The script configures the Terminal with the following features:

    iTerm2 is installed using Homebrew
    Oh My Zsh is installed using the official installation script
    The Powerlevel10k theme is installed for Oh My Zsh
    The iTerm2 preferences are set to use a custom color scheme and a Powerlevel10k profile
    The Zsh theme is set to Powerlevel10k, and several additional features are enabled, including:
        Showing the context (user and hostname), directory, and VCS status in the left prompt
        Showing the current time and number of background jobs in the right prompt
        Shortening the directory name to two characters with a delimiter
        Truncating the VCS status to a maximum length of four characters
        Showing the current change set (commit hash) for the VCS
        Displaying the command execution time with a black background and yellow foreground if it exceeds a certain threshold
    Syntax highlighting is enabled in the terminal using the zsh-syntax-highlighting plugin
    Several useful aliases and functions are added to the .zshrc file, including:
        ll: list all files in the current directory in long format
        la: list all files in the current directory (including hidden files)
        l: list all files in the current directory in long format with human-readable file sizes
        c: clear the terminal screen
        e: exit the current shell session
        o: open the current directory in Finder
        mkd: create a new directory and enter it
        p: print the path of the current working directory with line numbers

License

This script is licensed under the MIT License.