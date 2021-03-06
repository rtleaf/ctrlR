#' dec.curve
#'
#' This function find and order a series of intermediate points
#' @param mat_input numeric matrix
#' @param mag numeric: how many times will be divided by the number of initial points
#' @param plot logical: if TRUE will be plotted the starting and final point matrices
#' @return matt numeric: a kxd matrix with landmark coordinates 
#' @author Antonio Profico, Alessio Veneziano
#' @export
dec.curve=function(mat_input,mag,plot=TRUE){
matt=mat_input
for(j in 1:mag){
magn_j=NULL
for(i in 1:((dim(matt)[1])-1)){
magn_j=c((as.numeric(matt[i,])+as.numeric(matt[i+1,]))/2,magn_j)
}
matt_1_junk=matrix(magn_j,ncol=3,byrow=T)
matt_1_mat=rbind(matt,matt_1_junk)
orig=1:dim(matt)[1]
deri=(dim(matt)[1]*2-1):(dim(matt)[1]+1)
reordered=NULL
for(i in 1:dim(matt)[1]){
reordered=c(reordered,orig[i],deri[i])
}
reordered=reordered[-length(reordered)]
matt=matt_1_mat[reordered,]
}
if(plot=="TRUE"){
plot3D(mat_input,cex=1,col=2) 
plot3D(matt,cex=0.5,col=3,add=TRUE)}
return(matt)}
