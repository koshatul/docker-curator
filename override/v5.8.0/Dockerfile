FROM python:3.6-alpine3.6 as builder

RUN apk --no-cache upgrade && apk --no-cache add build-base tar musl-utils openssl-dev
RUN pip3 install setuptools cx_Freeze==6.0

WORKDIR /code
COPY . /code
RUN ln -s /lib/libc.musl-x86_64.so.1 ldd
RUN ln -s /lib /lib64
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt --upgrade
RUN python3 setup.py build_exe

FROM alpine:3.6
RUN apk --no-cache upgrade && apk --no-cache add ca-certificates && update-ca-certificates && apk --no-cache add wget
COPY --from=builder /code/build/exe.linux-x86_64-3.6 /curator/
USER nobody:nobody
ENV LD_LIBRARY_PATH=/curator/lib
ENTRYPOINT ["/curator/curator"]
