<cfsetting requesttimeout="500" showDebugOutput = "no" />
<cfinvoke component="mxunit.runner.DirectoryTestSuite"
	componentPath="freevent_tacfug.tests"
	directory="#expandPath('./')#"
	method="run"
	recurse="true"
	returnvariable="results"/>
<cfoutput>#results.getResultsOutput('html')#</cfoutput>