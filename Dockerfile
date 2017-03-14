FROM google/debian:jessie

RUN apt-get update
RUN apt-get install -y wget

# Python 2.7
RUN apt-get install -y python-dev

# pip
RUN apt-get install -y python-pip

# Thumbor dependencies
RUN apt-get install -y ffmpeg libjpeg-dev libpng-dev libtiff-dev libjasper-dev libgtk2.0-dev python-numpy python-pycurl webp python-opencv

# Thumbor
RUN pip install thumbor==4.8.5

EXPOSE 8888

CMD ["thumbor"]
