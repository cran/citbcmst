\name{cit.assignBcmst}
\alias{cit.assignBcmst}
\title{cit.assignBcmst}
\description{assign expression data sample(s) to CIT Breast Cancer Molecular Subtypes}
\usage{cit.assignBcmst(  data,data.annot,data.colId="Probe.Set.ID",data.colMap=c("Probe.Set.ID","Gene.Symbol","Ensembl","UniGene.ID")[1],citbcmst.annot=NULL,citbcmst.colId="Probe.Set.ID",citbcmst.colMap=c("Probe.Set.ID","Gene.Symbol","Ensembl","UniGene.ID")[1],dist.method="dlda",dist.difftopcentcutoff=NULL,dist.disttocentcutoff=NULL,dist.maxcutoff=NULL,plot=FALSE)}
\arguments{
\item{data}{a data.frame of expression data with id as rownames}
\item{data.annot}{a data.frame of data probes annotations}
\item{data.colId}{name of the column in data.annot containing data probes id}
\item{data.colMap}{name of the column in data.annot containing data probes names to map}
\item{citbcmst.annot}{affymetrix annotation data.frame, if NULL (default) takes the embeded annotation in object citbcmst$data.annot}
\item{citbcmst.colId}{name of the column in citbcmst.annot corresponding to rownames of citbcmst$data. Default "Probe.Set.ID"}
\item{citbcmst.colMap}{name of the column in citbcmst.annot containing the same annotation as in data.colMap}
\item{dist.method}{metric to compute distance to assign a sample to a subtype. Default for Affymetrix data "dlda". For other platforms "pearson".}
\item{dist.difftopcentcutoff}{cut-off on the differences between distances to centroids. If the distance is inferior to this cut-off for n centroids the sample is assigned to the n subtypes in the output variable citbcmst.mixed. If NULL, the cut-off is defined as the 1st decile of the difference between the top 2 closest centroids on data used to compute centroids.}
\item{dist.disttocentcutoff}{cut-off on the mad (median absolute deviation) of distances to the centroid to define a sample as outlier. If the distance to the centroid of the assigned subtype is superior to \code{sdisttocent}*mad(distances of centroids samples to this centroid)}
\item{dist.maxcutoff}{samples for which nearest centroid is above this threshold are discarted (used only if \code{dis.meth} = "pearson" or "spearman")}
\item{plot}{if TRUE plot an acp of citdata used to classify, and of the input data with subtype affectation and dist to centroid class}
}
\value{a data.frame with 4 columns : "citbcmst" classification to the closest of the 6 subtypes, "citbcmst.mixed" classification to the n closest subtypes depending on dist.difftopcentcutoff, "citbcmst.core" classification without outlier and mixed samples and citbcmst.confidence a confidence assignation annotation (CORE, MIXED or OUTLIER)
}
\author{Laetitia Marisa}
\keyword{methods}
\examples{data(exp.norm.bertheau07)
exp.annot.bertheau07 <- data.frame(id=rownames(exp.norm.bertheau07), stringsAsFactors=FALSE, row.names=rownames(exp.norm.bertheau07) )
citbcmst.bertheau07 <- cit.assignBcmst(    data=exp.norm.bertheau07,
                                           data.annot=exp.annot.bertheau07,
                                           data.colId="id",
                                           data.colMap="id" ,
                                           citbcmst.colMap="Probe.Set.ID",
                                           dist.method="dlda",
                                           plot=TRUE
                                 ) }
\note{This is a contribution from the Tumor Identity Cards (CIT) program founded by the 'Ligue Nationale Contre le Cancer' (France): \url{http://cit.ligue-cancer.net}. For any question please contact \url{CITR@ligue-cancer.net}}
