<cfcomponent hint="I test the tracks service." extends="mxunit.framework.testcase" output="false">

	<cffunction name="beforeTests" access="public" hint="I run once before running any tests." returntype="void">
		<cfset myTestTracksService = CreateObject("component", "freevent_tacfug.admin.services.tracks")>
	</cffunction>

	<cffunction name="test01_1_doesListReturnQuery" access="public" returntype="void">

	</cffunction>

</cfcomponent>