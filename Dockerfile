FROM jupyter/scipy-notebook
#Version v2.00-Alpha
#change by Justin

ARG TEST_ONLY_BUILD

USER root

RUN apt-get update && \
apt-get install -y --no-install-recommends \
language-pack-zh-han* \
python-pip \
gcc \
sqlite \
sqlite3

#pip install package
RUN sudo pip install --upgrade pip && \
pip install \
pandas \
lxml \
pyquery \
BeautifulSoup4 \
pymysql \
tqdm \
twstock \
youtube_dl

#pip install package2
RUN conda install --quiet --yes \
'dash==0.21.1' \
'dash-renderer==0.13.0' \
'dash-html-components==0.11.0' \
'dash-core-components==0.23.0' \
Scrapy

#ta-lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
tar xvfz ta-lib-0.4.0-src.tar.gz && \
rm -rf ta-lib-*.tar.gz && \
cd ta-lib && \
./configure --prefix=/usr &&\
make && \
make install && \
pip install TA-Lib && \
cd ../ \
rm -rf ~/ta-lib

COPY ./ttf/* /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/fonts/ttf/
COPY ./matplotlibrc /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/matplotlibrc

RUN rm -rf /root/.cache/matplotlib/* \
rm -rf /home/jovyan/.cache/matplotlib/fontList.json

ENV LC_ALL=zh_TW.utf8
ENV LANG=zh_TW.utf8
ENV LANGUAGE=zh_TW.utf8
