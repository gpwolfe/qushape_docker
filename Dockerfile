FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
RUN apt-get update \
&& apt-get install -y xorg \
&& apt install -y python2.7 \
&& apt install -y python-pip \
&& apt-get install -y --no-install-recommends xauth x11-apps
RUN apt-get install -y wget unzip dialog apt-utils \
&& apt install -y software-properties-common \
&& apt install -y qt4-dev-tools libqt4-dev libqtcore4 libqtgui4 \
# && wget https://download.qt.io/archive/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.zip \
# && unzip qt-everywhere-opensource-src-4.8.7.zip \
&& wget https://www.riverbankcomputing.com/static/Downloads/sip/4.19.25/sip-4.19.25.zip \
&& unzip sip-4.19.25.zip 
RUN cd sip-4.19.25 \
&& yes | python configure.py --sip-module PyQt4.sip \
&& make \
&& make install \
&& cd .. 
RUN wget https://www.riverbankcomputing.com/static/Downloads/PyQt4/4.12.3/PyQt4_gpl_x11-4.12.3.tar.gz \
&& tar -xzf PyQt4_gpl_x11-4.12.3.tar.gz \
&& cd PyQt4_gpl_x11-4.12.3 \
&& yes yes | python configure.py \
&& make \
&& make install \
&& cd ..
RUN pip install numpy matplotlib scipy
RUN echo 'export PYTHONPATH="${PYTHONPATH}:/usr/lib/python2.7/dist-packages/PyQt4"' >> /root/.bashrc
RUN wget https://github.com/Weeks-UNC/QuShape/archive/refs/heads/master.zip\
&& unzip master.zip
RUN source /root/.bashrc
ENV DISPLAY=:0
RUN /bin/bash

ENV QT_X11_NO_MITSHM=1 
RUN touch /root/.Xauthority


