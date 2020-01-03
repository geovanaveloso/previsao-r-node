###### INSTALAÇÃO PACOTES #######
library(devtools)
to_install <- c("arules","catboost","caTools","data.table","doParallel","xgboost",
                "foreach","forecast","fpp","ggplot2","gridExtra","h2o","itertools","lubridate",
                "magick","Matrix", "MLmetrics","monreg","nortest","RColorBrewer","recommenderlab","ROCR","zoo",
                "pROC","scatterplot3d","stringr","sde","timeDate","tm","tsoutliers","wordcloud","Rcpp")
for (i in to_install) {
  message(paste("looking for ", i))
  if(i == "catboost" & !requireNamespace(i)) {
    # CURRENT VERSIONS ARE FAILING WITH MultiClass: devtools::install_github('catboost/catboost', subdir = 'catboost/R-package')
    # Use the below instead as it is the latest release that doesn't fail
    remotes::install_url('https://github.com/catboost/catboost/releases/download/v0.17.5/catboost-R-Windows-0.17.5.tgz', build_opts = c("--no-multiarch"))
  } else if(i == "h2o" & !requireNamespace(i)) {
    if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
    if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
    pkgs <- c("RCurl","jsonlite")
    for (pkg in pkgs) {
      if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
    }
    install.packages("h2o")
  } else if (!requireNamespace(i)) {
    message(paste("     installing", i))
    install.packages(i)
  }
}
# Install RemixAutoML:
devtools::install_github('AdrianAntico/RemixAutoML', upgrade = FALSE, dependencies = FALSE, force = TRUE)
###### INSTALAÇÃO PACOTES #######
