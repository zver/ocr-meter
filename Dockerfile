FROM debian:bullseye

WORKDIR /ocr-meter

RUN mkdir -p ./log ./image_tmp
COPY code/wasseruhr.py .
COPY code/lib ./lib
COPY code/config ./config
COPY code/config_default ./config_default
COPY code/requirements.txt .
RUN apt-get update && apt-get -y install python3 python3-pip ninja-build python3-opencv
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r ./requirements.txt

EXPOSE 3000

CMD ["python3", "./wasseruhr.py"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
