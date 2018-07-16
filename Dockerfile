FROM alpine:3.6

RUN apk update \
    && apk add \
	python \
	python-dev \
	gcc \
	build-base \
	linux-headers \
	pcre-dev \
	musl-dev \
	libxml2-dev \
	libxslt-dev \
	curl \
    lapack-dev \
    gfortran \
	&&  python -m ensurepip \
	&&  rm -r /usr/lib/python*/ensurepip \
    &&  pip install --upgrade pip setuptools \
    &&  rm -r /root/.cache \
    &&  pip install --upgrade pip setuptools \
    &&  rm -r /root/.cache

COPY requirements.txt /requirements.txt
RUN pip install -r requirements.txt

CMD sh
