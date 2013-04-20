<cfscript>
/**
*  @mxunit:decorators mxunit.framework.decorators.OrderedTestDecorator
*/

component extends="mxunit.framework.testcase"{

	//This function will run ONCE before ALL of the tests are run.  I like to preserve the existing data.
	function beforeTests()
	{
		//Create the local test object
		testTracksService = CreateObject("component", "freevent_tacfug.admin.services.tracks");
	}

	//This function will run ONCE after ALL of the tests are run.
	function afterTests(){}

	//This function runs before EACH and EVERY test.
	function setup(){}

	//This function runs after EACH and EVERY test.
	function teardown(){

		//Recreate the original tbltracks data.
		var qryRecreateExistingData = new Query();
		qryRecreateExistingData.setSql("
      		DROP TABLE IF EXISTS tbltracks;
			CREATE TABLE tbltracks (
			  trackId int NOT NULL AUTO_INCREMENT,
			  trackName varchar(50) NOT NULL,
			  primaryBG varchar(25) DEFAULT NULL,
			  primaryColor varchar(25) DEFAULT NULL,
			  secondaryBG varchar(25) DEFAULT NULL,
			  secondaryColor varchar(25) DEFAULT NULL,
			  createDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (trackId),
			  UNIQUE KEY uniqTblTrack (trackName)
			) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
			INSERT INTO tbltracks VALUES ('3', 'COLDFUSION', '##2a3b96', '##FFFFFF', '##EEEEEE', '##000000', '2013-01-01 00:00:00');
			INSERT INTO tbltracks VALUES ('4', 'GENERAL', '##f71313', '##FFFFFF', '##EEEEEE', '##000000', '2013-01-01 00:00:00');
			INSERT INTO tbltracks VALUES ('5', 'HANDS-ON', '##10eb19', '##FFFFFF', '##EEEEEE', '##000000', '2013-01-01 00:00:00');
			INSERT INTO tbltracks VALUES ('6', 'WEB', '##f21cc3', '##FFFFFF', '##EEEEEE', '##000000', '2013-01-01 00:00:00');
			INSERT INTO tbltracks VALUES ('7', 'MOBILE', '##12eded', '##FFFFFF', '##EEEEEE', '##000000', '2013-01-01 00:00:00');
		");

		qryRecreateExistingData.execute();
	}

	//--------- BEGIN THE TESTING - TESTS RUN IN ALPHABETICAL ORDER WITHIN THE ECLIPSE PLUG-IN----------///

	//The services/tracks list function should return a query result set.

	/***@order 1*/
	function listIsQuery()
	{
		assertIsQuery(testTracksService.list());
	}

	/***@order 2*/
	function listReturnsCorrectOrder()
	{
		var qryResult = testTracksService.list();
		var expectedList = "COLDFUSION,GENERAL,HANDS-ON,MOBILE,WEB";
		var actualList = ValueList(qryResult.trackname);

		debug(qryResult);

		assertEquals(expectedList, actualList, "The query output does not match the expected output.");
	}

	/***@order 3*/
	function listEmptyTable()
	{
		//We have to empty the table to run this test.
		var qryTruncateExistingData = new Query();

		//Drop the existing data table.
		qryTruncateExistingData.setSql("TRUNCATE TABLE tbltracks;");

		//Empty the table.
		qryTruncateExistingData.execute();

		//Run the test on the empty table.
		assertIsQuery(testTracksService.list());

	}

	/***@order 4*/
	function getIsQuery()
	{
		var qryResult = testTracksService.get(3);
		assertIsQuery(testTracksService.get(3));
	}

	/***@order 5*/
	function getGoodData()
	{
		var qryActual = "";
		var qryActualList = "";
		var qryExpected = "3, COLDFUSION, ##2a3b96, ##FFFFFF, ##EEEEEE, ##000000";
		qryActual = testTracksService.get(3);
		debug(qryActual);
		qryActualList = "#qryActual.trackId#,#qryActual.trackname#,#qryActual.primaryBG#,#qryActual.primaryColor#,#qryActual.secondaryBG#,#qryActual.secondaryColor#";
		assertEquals(qryExpected, qryActualList, "The data returned does not match the expected output.");
	}

	/***@order 6*/
	function getNoTrackId()
	{
		assertIsEmptyQuery(testTracksService.get(27), "This isn't an empty query object.'");
	}

	/***@order 7*/
	function insertMissingArgument()
	{
		fail("Test not implemented yet.");
	}

	/***@order 8*/
	function insertInvalidColor()
	{
		fail("Test not implemented yet.");
	}


	/***@order 9*/
	function insertLongTrackName()
	{
		fail("Test not implemented yet.");
	}
}
</cfscript>