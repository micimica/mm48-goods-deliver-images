# mm48 goods images generator

This is a generator for images to make "Mici-mica version 48" goods by pixivFACTORY.

- The Amulet "Mici-mica" for Energy Works
  - https://micimica-distribution.tumblr.com/
- pixivFACTORY
  - https://factory.pixiv.net/
- micimica shop
  - https://micimica.booth.pm/

## Requirement

- docker
  - https://docs.docker.com/docker-for-windows/
  - https://docs.docker.com/docker-for-mac/

## Usage

### Prepare

```sh
# If you use Docker Toolbox for Windows, you can mount the "c:\Users\" subdirectories to docker by default. 
cd /c/Users/$USERNAME/

git clone https://github.com/micimica/mm48-goods-deliver-images.git
cd mm48-goods-deliver-images
docker build -t micimica/imagemagick:latest .
```

### Generate
```sh
cd /c/Users/$USERNAME/mm48-goods-deliver-images

docker run --rm -it --name micimica-imagemagick -v `pwd`:/usr/local/ micimica/imagemagick

cd /usr/local/

./pixivfactory_poster_b1.sh
./pixivfactory_poster_b2.sh

./common_a3.sh
./common_a4.sh

exit

docker stop micimica-imagemagick
```

### Clean Up

```sh
docker image rm -f $(docker image ls -q -f reference=micimica/imagemagick)
# docker image rm -f $(docker image ls -q -f reference=alpine:latest)
# docker container prune -f
```

## Reference of Goods / Image
| Goods Variation | Image File | Example |
|:---|:---|:---|
| [[pixivFactory] Poster - B1 size](https://factory.pixiv.net/products/fast_poster) | images-dist/mm48-1_pixivfactory_poster_b1.png | TODO |
| [[pixivFactory] Poster - B2 size](https://factory.pixiv.net/products/fast_poster) | images-dist/mm48-1_pixivfactory_poster_b2.png | TODO |
| Common Use - A3 size | images-dist/mm48-1_common_a3.png | |
| Common Use - A4 size | images-dist/mm48-1_common_a4.png | |

## License

### Source Code
MIT License

### Image File
Public Domain (CC0)
