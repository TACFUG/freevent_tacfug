<cfcomponent extends="framework">
<cfscript>

	this.name = "freevent_event_manager";
	this.datasource = "freevent_demo";

	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.applicationTimeout = createTimeSpan(0,8,0,0);

	variables.framework = {
		defaultItem = 'home'
		,reloadApplicationOnEveryRequest = true
	};

	function setupApplication(){
		application.eventTitle = "NCDevCon 2013";
		application.errorEmail = "sipacate@gmail.com";

		return true;
	}

</cfscript>
</cfcomponent>