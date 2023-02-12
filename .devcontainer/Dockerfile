FROM python:3.9.11-slim-bullseye

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=user

ENV container docker

USER root

# Create non-root user
RUN groupadd $USER && useradd --gid $USER --shell /bin/bash --create-home $USER

RUN echo "Install dependencies..."\
 && apt-get update\
 && apt-get install\
  unixodbc-dev\
  build-essential\
  ca-certificates\
  curl\
  git-all\
  jq\
  htop\
  less\
  nano\
  vim\
  wget\
  zsh\
  -y --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*
 

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN echo "Install Conda..." && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

# Upgrade pip then install poetry and wheel
RUN pip3 install --no-cache-dir --upgrade pip \
 && pip3 install --no-cache-dir wheel poetry

COPY .devcontainer/config_devcontainer.sh /tmp
