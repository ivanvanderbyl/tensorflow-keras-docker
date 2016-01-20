FROM ubuntu:14.04

MAINTAINER Ivan Vanderbyl <ivan@flood.io>

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python-numpy \
        python-pip \
        python-scipy \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        && \
    python -m ipykernel.kernelspec

# Install TensorFlow CPU version.
ENV TENSORFLOW_VERSION 0.6.0
RUN pip --no-cache-dir install \
    https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-${TENSORFLOW_VERSION}-cp27-none-linux_x86_64.whl

# Set up our notebook config.
# COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
# COPY run_jupyter.sh /

RUN pip install git+git://github.com/Theano/Theano.git
RUN pip install keras

WORKDIR "/root"

# Copy some examples
RUN git clone git://github.com/fchollet/keras.git

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

COPY keras.json /root/.keras/keras.json
COPY . /root

CMD ["/bin/bash"]
