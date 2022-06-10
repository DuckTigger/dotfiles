cat ~/dotfiles/lightmode.vim > ~/dotfiles/currentmode
cat ~/dotfiles/zathura/lightmode > ~/dotfiles/zathura/zathurarc
(mv /Users/andrew/Library/Application\ Support/Firefox/Profiles/eum85le8.default-release/chrome/userContent.css /Users/andrew/Library/Application\ Support/Firefox/Profiles/eum85le8.default-release/chrome/darkOff.css)
(mv /Users/andrew/Library/Application\ Support/Zotero/Profiles/tez2oydq.default/chrome/userChrome.css /Users/andrew/Library/Application\ Support/Zotero/Profiles/tez2oydq.default/chrome/darkOff.css)
(osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false")
# pkill firefox
# open /Applications/Firefox.app
# pkill zotero
# open /Applications/Zotero.app
