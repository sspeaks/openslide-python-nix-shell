# How to install
You need to convert the test.svs file into a deepzoom format

First, install python 3.8 or greater, then run the script below

### For example, on Ubuntu (Or WSL Ubuntu, in my case)
```bash
sudo apt update
sudo apt install python3-openslide
python3 deepzoom_tile.py test.svs
```
This allows for the index.html to fetch the appropriate files.


Then, all you need to do is start your own http server in this folder

```bash
python3 -m http.server
```