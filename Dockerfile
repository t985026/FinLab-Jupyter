FROM jupyter/datascience-notebook
#Version 1.2
#master
#change by Justin

ARG TEST_ONLY_BUILD

USER root

RUN apt-get update && \
apt-get install -y --no-install-recommends \
language-pack-zh-han* \
sqlite \
sqlite3

#pip install package
RUN pip install --upgrade pip && \
pip install \
pandas \
BeautifulSoup4 \
pymysql \
tqdm \
lxml \
plotly \
twstock \
youtube_dl
# pip install plotly --upgrade

#ta-lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
tar xvfz ta-lib-0.4.0-src.tar.gz && \
rm -rf ta-lib-0.4.0-src.tar.gz && \
cd ta-lib && \
./configure --prefix=/usr &&\
make && \
make install && \
pip install TA-Lib && \
cd ../ \
rm -rf ta-lib

USER $NB_UID
#conda install package2
RUN conda install --quiet --yes \
'dash==0.21.1' \
'dash-renderer==0.13.0' \
'dash-html-components==0.11.0' \
'dash-core-components==0.23.0' && \
conda clean -tipsy && \
fix-permissions $CONDA_DIR && \
fix-permissions /home/$NB_USER

RUN julia -e 'Pkg.init()' && \
    julia -e 'Pkg.update()' && \
    (test $TEST_ONLY_BUILD || julia -e 'Pkg.add("HDF5")') && \
    julia -e 'Pkg.add("Gadfly")' && \
    julia -e 'Pkg.add("RDatasets")' && \
    julia -e 'Pkg.add("IJulia")' && \
    # Precompile Julia packages \
    julia -e 'using IJulia' && \
    # move kernelspec out of home \
    mv $HOME/.local/share/jupyter/kernels/julia* $CONDA_DIR/share/jupyter/kernels/ && \
    chmod -R go+rx $CONDA_DIR/share/jupyter && \
    rm -rf $HOME/.local && \
    fix-permissions $JULIA_PKGDIR $CONDA_DIR/share/jupyter
#重新指定語言
ENV LC_ALL=zh_TW.utf8
ENV LANG=zh_TW.utf8
ENV LANGUAGE=zh_TW.utf8
ENV TZ=Asia/Taipei
