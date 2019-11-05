# Docker Definition for ElasticSearch Curator

FROM python:2.7.8-slim
MAINTAINER Christian R. Vozar <christian@rogueethic.com>

WORKDIR /code
COPY . /code
RUN pip install -r requirements.txt
RUN python ./setup.py install 

ENTRYPOINT [ "/usr/local/bin/curator" ]
