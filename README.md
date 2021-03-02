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
- make (optional)
- git (optional)

## Usage

### Prepare

```sh
git clone https://github.com/micimica/mm48-goods-deliver-images.git
cd mm48-goods-deliver-images
make build
```

### Generate

```sh
make exec
```

or

```sh
make attach

./common_a3.sh
./common_a4.sh
./pixivfactory_poster_b1.sh
./pixivfactory_poster_b2.sh

exit
```

### Clean Up (dispose docker images for free disk)

```sh
make dispose
```

## Reference of Goods / Image
| Goods Variation | Image File | Example |
|:---|:---|:---|
| [[pixivFactory] Poster - B1 size](https://factory.pixiv.net/products/fast_poster) | images-dist/mm48-1_mono_pixivfactory_poster_b1.png<br>images-dist/mm48-1_koto_pixivfactory_poster_b1.png | TODO |
| [[pixivFactory] Poster - B2 size](https://factory.pixiv.net/products/fast_poster) | images-dist/mm48-1_mono_pixivfactory_poster_b2.png<br>images-dist/mm48-1_koto_pixivfactory_poster_b2.png | TODO |
| Common Use - A3 size | images-dist/mm48-1_mono_common_a3.png<br>images-dist/mm48-1_koto_common_a3.png | - |
| Common Use - A4 size | images-dist/mm48-1_mono_common_a4.png<br>images-dist/mm48-1_koto_common_a4.png | - |

## License

### Source Code
MIT License

### Image File
Public Domain (CC0)
