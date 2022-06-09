cat ~/dotfiles/darkmode.vim > ~/dotfiles/currentmode
cat ~/dotfiles/zathura/darkmode > ~/dotfiles/zathura/zathurarc
(mv /Users/andrew/Library/Application\ Support/Firefox/Profiles/eum85le8.default-release/chrome/darkOff.css /Users/andrew/Library/Application\ Support/Firefox/Profiles/eum85le8.default-release/chrome/userContent.css)
(mv /Users/andrew/Library/Application\ Support/Zotero/Profiles/tez2oydq.default/chrome/darkOff.css /Users/andrew/Library/Application\ Support/Zotero/Profiles/tez2oydq.default/chrome/userChrome.css)
(osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true")
pkill firefox
pkill Zotero
open /Applications/Zotero.app
open /Applications/Firefox.app
