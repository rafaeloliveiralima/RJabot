# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}

getOccurrence <-
  function(pTaxon){
    library(rjson)
    pTaxon = gsub(' ', '_', pTaxon)
    json_file <- paste ("http://aplicacoes.jbrj.gov.br/jabot/v2/ws/server.php?coordenada=S&taxon=",pTaxon,sep="")
    json_data <- fromJSON(file=json_file,method="C")
    final_data <-do.call(rbind,json_data)
    write.csv(final_data,"final_data.csv")
    y2 <- final_data[,c("taxoncompleto","longitude","latitude")]
    y2 <- cbind(as.numeric(y2[,2]),
               as.numeric(y2[,3])
    )
    colnames(y2) <- c("Longitude","Latitude")
    y2 <- data.frame(y2)
    return(y2)
  }

