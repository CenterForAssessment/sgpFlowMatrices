#' Package Load and Attach Functions
#'
#' @description Internal functions for package loading and attaching
#' @param libname Library name
#' @param pkgname Package name
#' @keywords internal
#' @noRd
`.onLoad` <-
function(libname, pkgname) {
}

#' Package Attach Function
#'
#' @description Internal function for package attaching with version checking
#' @param libname Library name
#' @param pkgname Package name
#' @keywords internal
#' @noRd
`.onAttach` <- function(libname, pkgname) {
    if (interactive()) {
		# Utility function with timeout
        get_dev_version <- function(package, timeout = 2) {
            url <- paste0("https://raw.githubusercontent.com/CenterForAssessment/", package, "/refs/heads/main/DESCRIPTION")
            tryCatch({
                # Use curl with timeout
                response <- curl::curl_fetch_memory(url, handle = curl::new_handle(timeout = timeout))
                if (response$status_code == 200) {
                    lines <- strsplit(rawToChar(response$content), "\n")[[1]]
                    version_line <- grep("^Version:", lines, value = TRUE)
                    if (length(version_line) > 0) {
                        return(crayon::cyan("v", strsplit(version_line, ": ")[[1]][2], sep=""))
                    }
                }
                return(crayon::red("Not Available"))
            }, error = function(e) {
                return(crayon::red("Not Available"))
            }, warning = function(w) {
                return(crayon::red("Not Available"))
            })
        }

        # Extract version information
        installed.version <- utils::packageDescription("sgpFlowMatrices")[['Version']]
        cran.version <- tryCatch(
            crayon::green("v", pkgsearch::cran_package("sgpFlowMatrices")[['Version']], sep=""),
            error = function(e) crayon::red("Not Available"),
            warning = function(w) crayon::red("Not Available"))
        dev.version <- get_dev_version("sgpFlowMatrices")

        # Define a friendly startup message
		message_text <- paste0(
		    crayon::magenta(crayon::bold("\uD83C\uDF89 sgpFlowMatrices v", installed.version, sep="")), " - ", toOrdinal::toOrdinalDate("2025-5-5"), "\n",
			strrep("\u2501", 40), "\n",
    	    crayon::bold("\U1F4E6 CRAN: "), cran.version, "\n",
    	    crayon::bold("\U1F527 Dev: "), dev.version, "\n",
			strrep("\u2501", 40), "\n",
		    "\U1F4A1 Tip: ", crayon::magenta(crayon::bold("> help(package=\"sgpFlowMatrices\")")), "\n",
		    "\U1F310 Docs: ", crayon::magenta(crayon::bold("https://centerforassessment.github.io/sgpFlowMatrices")), "\n",
			strrep("\u2501", 40), "\n",
		    "\u2728 Happy sgpFlowing!", "\n")

        # Display the startup message
        packageStartupMessage(message_text)
    }
}
