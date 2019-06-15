# https://docs.docker.com/engine/articles/dockerfile_best-practices/

FROM debian:jessie

# MAINTAINER is deprecated since Docker 1.13.0 
# MAINTAINER brunocampos "brunocampos01@gmail.com" 

RUN apt-get update && apt-get install -y --no-install-recommends python=3.6 \
                                                                 python3-pip \
                                                                 python-dev \
                                                                 build-essential \
                   && apt-get clean \
                   && rm -rf /var/lib/apt/lists/*

COPY . /part-1
WORKDIR /part-1
# requirements.txt primeiro é levado para o Docker cache
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["part-1.py"]