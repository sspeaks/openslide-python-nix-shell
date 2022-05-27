#! /usr/bin/env nix-shell
#! nix-shell -i bash shell.nix


python3 deepzoom_tile.py test.svs
mkdir "$HOME/static"
mv test_files "$HOME/static"
mv test.dzi "$HOME/static"

az storage blob delete-batch --account-name svsdemo -s '$web' --pattern 'test_files/*' --delete-snapshots include
az storage blob delete-batch --account-name svsdemo -s '$web' --pattern 'test.dzi' --delete-snapshots include

az storage blob upload-batch --account-name svsdemo --source "$HOME/static" --destination '$web' --overwrite

rm -rf "$HOME/static"
