% Image de base pour la compilation de projets C/C++ sous alpine  
% Didier Richard  
% 2018/09/15

---

revision:
    - 1.0.0 : 2018/09/15  

---

# Building #

```bash
$ docker build -t dgricci/alpine-dev:$(< VERSION) .
$ docker tag dgricci/alpine-dev:$(< VERSION) dgricci/alpine-dev:latest
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/alpine-dev:$(< VERSION) .
$ docker tag dgricci/alpine-dev:$(< VERSION) dgricci/alpine-dev:latest
```     

# Use #

See `dgricci/alpine` README for handling permissions with dockers volumes.

The image only contains two scripts :

* `/usr/local/bin/01-install.sh` : update the apt cache and install the C/C++
compilation tools ; one can pass an argument (default `n`) to clean the apt
cache after the installation ;
* `/usr/local/bin/01-uninstall.sh` : uninstall the C/C++ compilation tools ;
  one can pass an argument (default `n`) to clean the apt cache.

This is used to build pieces of software and libraries by first install the
compilation environment, build and uninstall the compilation environment in
`Dockerfile`s (thus reducing the number of layers).

_Information_ : it is worth to note that the `libtool` package depends upon
`bash` ... The later has then installed in the base image !

## Tests ##

```bash
$ docker run -t --rm dgricci/alpine-dev:$(< VERSION) bash -c "/usr/local/bin/01-install.sh && gcc --version"
Installing g++, gcc and co ...
...
gcc (Alpine 6.4.0) 6.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

__Et voilà !__


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o dev.pdf README.md`{.bash}

