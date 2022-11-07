FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6 wget  -y
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt-get -y install vim
# RUN apt install pkg-config
# RUN apt-get install -y libopencv-dev

RUN pip install -U pip setuptools
RUN pip install tqdm jupyterlab ipywidgets ftfy regex
RUN pip install git+https://github.com/openai/CLIP.git
RUN pip install git+https://github.com/CompVis/taming-transformers.git

WORKDIR /app
COPY requirements.txt ./

RUN pip install -r requirements.txt


EXPOSE 8080
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=8080 --NotebookApp.token='' --NotebookApp.password=''