# Docker image for running Keras with a Tensorflow backend

This `Dockerfile` builds an image containing both Tensorflow and Theano, but
enables TF as a backend for Keras.

# Usage

On OSX, you will need to install [Docker Machine](https://docs.docker.com/machine/) or boot2docker,

Building the image:
```bash
docker build . -t keras-1
```

Running:

```bash
docker run -it -p 8888:8888
```
