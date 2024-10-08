`.onLoad` <-
function(libname, pkgname) {
}


`.onAttach` <-
function(libname, pkgname) {
	if (interactive()) {
		packageStartupMessage('sgpFlowMatrices ', paste(paste0(unlist(strsplit(as.character(packageVersion("sgpFlowMatrices")), "[.]")), c(".", "-", ".", "")), collapse=""),' (10-8-2024). For help: >help("sgpFlowMatrices") or visit https://centerforassessment.github.io/sgpFlowMatrices')
	}
}
