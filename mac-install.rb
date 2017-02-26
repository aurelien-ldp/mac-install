puts "macinstall version 0.1"

USER_NAME = "Aurelien Louis Dit Picard"
USER_MAIL = "aurelien.ldp@gmail.com"

COMMANDS = {
  "Software Updates" => "sudo softwareupdate -ia",
  "Initial Key Repeat Time" => "defaults write -g InitialKeyRepeat -int 10",
  "Key Repeat Time" => "defaults write -g KeyRepeat -int 2",
  "Hide the dock" => "defaults write com.apple.Dock autohide-delay -float 0 && killall Dock",
  "XCode tools" => "xcode-select --install",
  "Oh my zsh" => "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"",
  "Homebrew" => "ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && echo 'export PATH=\"/usr/local/bin:$PATH\"' >> ~/.bash_profile && brew doctor",
  "Git" => "brew install git \
  && git config --global user.name \"#{USER_NAME}\" \
  && git config --global user.email \"#{USER_MAIL}\"\
  && git config --global credential.helper osxkeychain",
  "iTerm2" => "brew cask install iterm2",
  "Google Chrome" => "brew cask install google-chrome",
  "Neovim" => "brew install neovim/neovim/neovim",
  "RVM" => "curl -L https://get.rvm.io | bash -s stable --ruby",
}

RESET   = "\033[0m"
GREEN   = "\033[32m"
YELLOW  = "\033[33m"
BLUE    = "\033[34m"

def ok?(command)
  puts "Command: " + command
  print "Is that ok? [Yn] "
  ok = gets
  return ok =~ /^$/
end

def install_command(command)
  if (ok? command)
    print YELLOW
    system command
    print RESET
  else
    puts "Skipping..."
  end
end

COMMANDS.each do |k, v|
  puts
  puts BLUE + k + RESET
  k.length.times do print "-" end
  puts ; puts
  install_command v
end
