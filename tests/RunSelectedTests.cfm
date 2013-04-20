<cfsetting requesttimeout="500" showDebugOutput = "no" />

<cfscript>
	testSuite = createObject("component", "mxunit.framework.TestSuite").TestSuite();
	testSuite.Add("freevent_tacfug.tests.admin.services.testTracksWithScript", "listIsQuery,listReturnsCorrectOrder");
	//Can use this feature to run tests that don't begin or end with string "test"
	testSuite.Add("freevent_tacfug.tests.admin.services.aTestScript", "someTestOne");
	results = testSuite.run();
	writeOutput(results.getResultsOutput('html'));
</cfscript>