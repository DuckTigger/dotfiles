pkill zotero
pkill firefox
APP_SUPPORT="/Users/andrew/Library/Application Support/"
FIREFOX_DIR="${APP_SUPPORT}Firefox/Profiles/eum85le8.default-release/chrome/"
ZOTERO_DIR="${APP_SUPPORT}Zotero/Profiles/tez2oydq.default/chrome/"
DARK_MODE=$(osascript -e 'tell app "System Events" to tell appearance preferences to return dark mode')
if [[ "$DARK_MODE" == "true" ]]
then
	MODE="lightmode"
else
	MODE="darkmode"
fi
cat ~/dotfiles/$MODE.vim > ~/dotfiles/currentmode
cat ~/dotfiles/zathura/$MODE > ~/dotfiles/zathura/zathurarc
cat ~/Documents/Obsidian_notes/.obsidian/$MODE > ~/Documents/Obsidian_notes/.obsidian/appearance.json
cat "${FIREFOX_DIR}${MODE}.css" > "${FIREFOX_DIR}userContent.css"
cat "${ZOTERO_DIR}${MODE}.css" > "${ZOTERO_DIR}userChrome.css"

open /Applications/Firefox.app
open /Applications/Zotero.app
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
