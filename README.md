[![](https://images.microbadger.com/badges/image/t985026/finlab-jupyter.svg)](https://microbadger.com/images/t985026/finlab-jupyter "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/t985026/finlab-jupyter.svg)](https://microbadger.com/images/t985026/finlab-jupyter "Get your own version badge on microbadger.com")

# 自製FinLab課程環境
[[課程網址](https://hahow.in/cr/python-finance)]
## package
* requests
* BeautifulSoup4
* youtube_dl
* pandas
* pymysql
* sqlite
* numpy
* lxml
* dash
* talib
* twstock


啟動方式(Linux):  
```shell
docker run -d --name=ds-jupyter --restart=always \
-p 8888:8888 \
-v /your/python/path:/home/jovyan/work \
t985026/finlab-jupyter start-notebook.sh \
--NotebookApp.ip='*' \
--NotebookApp.token=''
```
啟動方式(Windows Use Linux Core):
* 請使用PowerShell

假如要對應Windows的`D:/Jupyter`，要先開啟Docker設定中的分享
![圖片](.\img\share_storage.png)

command：
```shell
docker run -id --name=jupyter --restart=always `
-p 8888:8888 `
-v D:\Jupyter:/home/jovyan/work `
t985026/finlab-jupyter start-notebook.sh `
--NotebookApp.token=''
```

可添增參數
`--notebookApp.password='密碼'`

其他相關教學請參考
http://jupyter-docker-stacks.readthedocs.io/en/latest/index.html
