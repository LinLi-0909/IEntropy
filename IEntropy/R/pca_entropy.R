#' Get-entropy function
#'
#' This function allows you to calculate the intrinsic entropy, extrinsic entropy and total entropy of genes based on date.
#' We assumed that the data follows Gauss distribition.
#'
#' @param data Enter the gene expression data, genes*cells
#' @param K Enter the number of PCs eg. 2, 1~5 are recommended.
#' @param min_exp Enter the minimum expression of genes,eg.0.05
#' @keywords Get_entropy
#' @export
#' @examples
#' Get_entropy(data,1,0.05)
#'
Get_entropy = function(data,K,min_exp=0.05){
  data <- as.matrix(data)
  data <- data[rowMeans(data)>=min_exp,]
  pca <- rpca(t(data), center=T, scale=T, retx=T, k=20)$x
  Y <- pca[,1:K]
  if (K==1){
    entropy_y <- sd(Y)^2
  }
  else{
    entropy_y <- det(cov(Y))
  }
  entropy_xy <- apply(data,1,function(x)Joint_entropy(x,Y))
  entropy_int <- 1/2*(log(2*pi+1))+1/2*log(entropy_xy/entropy_y+0.001)
  sigma <- apply(data,1,var)
  entropy_tot <- 1/2*(log(2*pi*sigma)+1)
  entropy_ext = entropy_tot - entropy_int
  int_res <- data.frame(Gene = names(entropy_int),entropy_int = as.numeric(entropy_int),entropy_ext =entropy_ext,entropy_tot=entropy_tot)
  int_res <- int_res[order(int_res$entropy_int,decreasing = T),]
  return(int_res)
}

Joint_entropy = function(x,Y)
{
  xY <- cbind(x,Y)
  sigma_xy <- det(cov(xY))
}
