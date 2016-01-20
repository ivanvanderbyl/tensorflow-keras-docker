# Docker image for running Keras with a Tensorflow backend

This [Dockerfile](/Dockerfile) builds an image containing both Tensorflow and Theano, but
enables TF as a backend for Keras.

You can add any files you like to this project and rebuild the image to
experiment with them.

# Usage

On OSX, you will need to install [Docker Machine](https://docs.docker.com/machine/)
or boot2docker before running this image.

### Building the image:

```bash
docker build -f Dockerfile -t keras-1 .
```

### Running:

```bash
docker run -it keras-1
```

This will drop you to a bash shell in `/root`. From here you can launch any of
the Keras examples in `./keras/examples`.

### Example `imdb_cnn.py`:

```bash
cd ./keras/examples
python imdb_cnn.py
```
