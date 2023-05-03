FROM python:3.9.16


# Install python module needed for gdal and rasterio
RUN apt-get update; \
    apt-get -y upgrade;


# fancy prompt
RUN echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> /root/.bashrc


# copy and install python dependencies
RUN pip3 install --upgrade pip
COPY ./requirements.txt /tmp/
RUN python -m venv /root/env \
    && . /root/env/bin/activate \
    && pip3 install --upgrade pip \
    && pip3 install -r /tmp/requirements.txt


# # copy aws credentials
# COPY ./.aws /root/.aws


# create directory project
RUN mkdir -p /app
WORKDIR /app


# # copy and assign permissions docker-entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod u+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]