`.onLoad` <-
function(libname, pkgname) {
}

`.onAttach` <- function(libname, pkgname) {
    if (interactive()) {
        # Extract version information
        version <- utils::packageVersion("sgpFlowMatrices")

        # Define a friendly startup message
	message_text <- paste0(
	    magenta(bold("\uD83C\uDF89 sgpFlowMatrices v", version)), " - ", toOrdinal::toOrdinalDate("2024-12-3"), "\n",
	    "\U1F4A1 Tip: ", magenta(bold("> help(\"sgpFlowMatrices\")")), "\n",
	    "\U1F310 Docs: ", magenta(bold("https://centerforassessment.github.io/sgpFlowMatrices")), "\n",
	    "\u2728 Happy sgpFlowing!"
	)

        # Display the startup message
        packageStartupMessage(message_text)
    }
}
