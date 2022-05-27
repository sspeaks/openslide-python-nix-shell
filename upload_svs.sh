#! /usr/bin/env nix-shell
#! nix-shell -i bash shell.nix


python3 deepzoom_tile.py test.svs
mkdir "$HOME/static"
mv test_files "$HOME/static"
mv test.dzi "$HOME/static"

az storage blob upload-batch --account-name svsdemo --source "$HOME/static" --destination '$web' --overwrite

rm -rf "$HOME/static"
