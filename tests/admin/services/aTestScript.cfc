<cfscript>
/**
*  @mxunit:decorators mxunit.framework.decorators.OrderedTestDecorator
*/

component extends="mxunit.framework.testcase"{

	/***@order 1*/
	function someTestOne()
	{
		fail("Test not implemented yet.");
	}
}
</cfscript>