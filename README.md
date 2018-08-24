[![](https://images.microbadger.com/badges/image/jupyter/datascience-notebook.svg)](https://microbadger.com/images/jupyter/datascience-notebook "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/jupyter/datascience-notebook.svg)](https://microbadger.com/images/jupyter/datascience-notebook "Get your own version badge on microbadger.com")

#自製FinLab課程環境

##package

requests
BeautifulSoup4
pandas
youtube_dl
pymysql
sqlite
numpy
lxml
dash
dash_core_components as dcc
dash_html_components as html
talib
twstock


啟動方式(Linux):
docker run -d --name=ds-jupyter --restart=always \
-p 8888:8888 \
-v /your/python/path:/home/jovyan/work \
t985026/fin-jupeter start-notebook.sh \
--NotebookApp.ip='*' \
--NotebookApp.token=''

啟動方式(Windows):
待補

可添增參數
--notebookApp.password='密碼'

其他相關教學請參考
http://jupyter-docker-stacks.readthedocs.io/en/latest/index.html
