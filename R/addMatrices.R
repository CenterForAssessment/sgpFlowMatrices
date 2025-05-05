#' Add sgpFlow Matrices to SGPstateData
#'
#' @description The function addMatrices adds sgpFlow coefficient matrices contained in the sgpFlowMatrices package to the SGPstateData object embedded in the SGP package so baseline SGP analyses can be conducted.
#'
#' @param state A character string for the state/assessment abbreviation for the sgpFlow coefficient matrices to be used. Must match value to be used in SGPstateData.
#' @param year Year associated with the matrices.
#' @param type Type of matrices: Currently either 'Single-Cohort' (default) or 'Super-Cohort'.
#' @param add.matrices.to.which.state A character string for the state/assessment abbreviation where the baseline matrices will be placed in SGPstateData. If not argument is supplied the default is to use the state/assessment abbreviation supplied via the argument \code{state}.
#'
#' @return Returns an SGP object with matrices embedded in appropriate slot embedded in the position associated with the argument \code{add.matrices.to.state} (defaults to \code{state}).
#'
#' @author Damian W. Betebenner \email{dbetebenner@nciea.org}
#'
#' @export
`addMatrices` <-
function(state,
         year,
	 type="Single-Cohort",
         add.matrices.to.which.state=NULL) {

        SGPstateData <- SGP::SGPstateData ### Needed due to assignment of values to SGPstateData

        ### Utility function
        getMatrixLabel <- function(state, year, add.matrices.to.which.state) {
             if (!paste(state, "Baseline_Matrices", sep="_") %in% names(sgpFlowMatrices::sgpFlowMatrices)) {
                 stop(paste("\tNOTE: Baseline matrices for state:", state, "not in sgpFlowMatrices. Contact package maintainer to have sgpFlow matrices added to package."))
             }
             tmp.years <- names(sgpFlowMatrices::sgpFlowMatrices[[paste(state, "Baseline_Matrices", sep="_")]])
             if (year < sort(tmp.years)[1]) stop("NOTE: Supplied year precedes years associated with sgpFlow matrices in package. Contact package developer if you think this is in error.")
             if (!year %in% tmp.years) year <- tmp.years[which(year==sort(c(tmp.years, year)))-1L]
             matrix.label <- paste0("sgpFlowMatrices::sgpFlowMatrices[['", paste(state, "Baseline_Matrices", sep="_"), "']][['", year, "']]")
             message(paste0("\tNOTE: Adding ", SGP::getStateAbbreviation(state, type="Long"), " (", state, ") ", year, " sgpFlow matrices to SGPstateData for state ",
			add.matrices.to.which.state))
             return(matrix.label)
        }

	if (is.null(add.matrices.to.which.state)) add.matrices.to.which.state <- state

        SGPstateData[[add.matrices.to.which.state]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- eval(parse(text=getMatrixLabel(state, year, add.matrices.to.which.state)))
        return(SGPstateData)
} ### END addMatrices