FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt-get -y install vim
RUN apt install libopenmpi-dev -y
RUN pip install mpi4py
RUN apt install pkg-config
# RUN apt-get install -y libopencv-dev


RUN pip install -U pip setuptools wheel
RUN pip install -U diffusers==0.9.0 transformers==4.25.1
RUN pip install -U accelerate ftfy tensorboard modelcards
RUN pip install jupyterlab ipywidgets

WORKDIR /app
EXPOSE 9999
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=9999 --NotebookApp.token='' --NotebookApp.password=''