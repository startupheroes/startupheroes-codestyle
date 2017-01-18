#!/bin/bash
# Installs StartupHeroes's IntelliJ configs into your user configs.

echo "Installing StartupHeroes code style configs..."

CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/Library/Preferences/WebStorm*      \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.WebStorm*/config                  \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    # Install codestyles
    mkdir -p $i/codestyles
    cp -frv "$CONFIGS/codestyles"/* $i/codestyles

    # Install inspections
    mkdir -p $i/inspection
    cp -frv "$CONFIGS/inspection"/* $i/inspection

    # Install options ("Exclude from Import and Completion")
    mkdir -p $i/options
    cp -frv "$CONFIGS/options"/* $i/options
  fi
done

echo "Done."
echo ""
echo "Restart IntelliJ and/or WebStorm and/or AndroidStudio, go to preferences, and apply 'startupheroes'."
