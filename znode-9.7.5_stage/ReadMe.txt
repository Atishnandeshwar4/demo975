============================[********* ReadMe File: Znode Multifront 9.7.5.0 *********]================================

Updated January 20, 2023
---------------------------

CONTENTS OF README
---------------------
   
 1. Introduction
 2. amlacommerce/znode (Github Repository)
    2.1. PowerBIReport
    2.2. ZnodeMultifront
         2.2.1. Database
         2.2.2. Project
         2.2.3. SharedLibraries
    2.3. ZnodePayment
         2.3.1. Database
         2.3.2. PaymentApp
	2.4. Web.Config_Key_Information 
    2.5. ReadMe.txt



1. INTRODUCTION
---------------
This ReadMe file will help to understand the folder structure of Znode Multifront 9.7.5.0 along with the guidelines and instructions to do the manual setup of its contents. This includes:
	- Understanding of prerequisite softwares for Znode Multifront 9.7.5.0
	- How to set up the source code for the Znode Multifront 9.7.5.0
	- Upgrading the database.
	- How to make theme compatible with 9.7.5.0


2. amlacommerce/znode (Github Repository)
------------------------------------------
Repository file contains the following folders:

2.1. PowerBIReport
	- It includes a sample ZnodeRealTimeDashboard.pbix file which is useful for configuring the PowerBI report in project.
2.2. ZnodeMultifront
	- It includes all the folders and files which are required to run the Znode Multifront.
2.3. ZnodePayment
	- This folder will help to set up the Payment application.
2.4. Readme.txt
	- Provides the guideline and instructions on the folder structure of Znode Multifront 9.7.5.0
	- Steps to set up the Znode Multifront 9.7.5.0 source code in development environment along with the database creation.
	- Znode Multifront upgrade steps from 9.0.x to 9.7.5.0


2.2. ZNODE MULTIFRONT
---------------------
ZnodeMultifront folder has following folder structure:

2.2.1. Database
2.2.2. Project
2.2.3. SharedLibraries


IMPORTANT NOTE:
* Prior to launch the Znode Multifront 9.7.5.0 from the source code, it is mandatory to install all prerequisite softwares. Please follow the instructions in the Znode support site "(https://support.znode.com/support/solutions/articles/43000604165-installing-znode-dependencies).


=> a. .NET FrameWork 4.8
------------------------
--> To install .NET FrameWork follow below steps:

- For development environment install .NET FrameWork 4.8 with following steps:
	Step 1. Run the ndp48-devpack-enu.exe to install.
	Step 2. Keep the default selection and continue with the installation.

- For hosted environment install .NET FrameWork 4.8 with following steps:
	Step 1. Run the ndp48-web.exe to install.
	Step 2. Keep the default selection and continue with the installation.
	
=> b. jdk-17_windows-x64_bin
----------------------------
--> To install JDK follow below steps:
	Step 1. Run the jdk-17_windows-x64_bin.exe to install.
	Step 2. Keep the default selection and continue with the installation.

=> c. JAVA_HOME
---------------
--> To set the Java Variable follow the below steps:
	Step 1. Run the batch file JAVA_HOME.bat in administrative mode.
	Step 2. Press any key to continue.

=> d. elasticsearch-7.16.2 
-------------------------
--> To install Elasticsearch follow below steps:

- If an older version of Elasticsearch is installed already in the system then please uninstall it with following steps:
Step 1. Open Command Prompt in administrative mode and enter the following command lines:
        Step 1.1. C:\elasticsearch-7.16.2\bin>service.bat stop
        Step 1.2. C:\elasticsearch-7.16.2\bin>service.bat remove

- Following are the steps to install and start the Elasticsearch:
Step 1. Open Command Prompt in administrative mode and enter the following command lines:
        Step 1.1. C:\elasticsearch-7.16.2\bin>elasticsearch-service.bat install
        Step 1.2. C:\elasticsearch-7.16.2\bin>elasticsearch-service.bat start.
        Step 1.3. Go to services right click on Elasticsearch service click on Properties and set as Automatic.

NOTE: 
a) Make sure to provide the correct path of Elasticsearch in the command prompt.
   a.1. It is necessary to provide a proper path if the Elastic Search is located on the D: drive.	
b) Migrations from Znode 9.0.x to 9.7.5.0 requires deleting the old Elasticsearch index.
	1.Steps to delete the index:
	b.1. Stop the Elasticsearch service.
	b.2. Go to the indices folder where the Elasticsearch is installed.
	    E.g.: \elasticsearch-7.16.2\data\nodes\0\indices
	b.3. Delete the old index from this folder.
	b.4. Start the Elasticsearch service.
	b.5. Go to admin and create the new index for respective catalog.
	   
=> e. mongodb-win32-x86_64-2012plus-4.2.3-signed
----------------------------------------------------------

- For development environment, install MongoDB with following steps:
	Step 1. Run the "mongodb-win32-x86_64-2012plus-4.2.3-signed.exe" to install MongoDB.
	Step 2. In service configuration, enter the desired data and log directory.
	Step 3. Keep the default selection and continue with the installation.

- For hosted environment, install MongoDB with following steps:
	Step 1. Run the "mongodb-win32-x86_64-2012plus-4.2.3-signed.exe" to install MongoDB.
	Step 2. In service configuration, enter the desired data and log directory.
	Step 3. Keep the default selection and continue with the installation.
	Step 4. Open .\MongoDB\Server\4.2\bin\mongod.cfg file and change bindIP under network interfaces as follow:
			"bindIP: "127.0.0.1,w.z.y.z" where w.x.y.z is the ip address of the hosted environment.
	Step 5. Restart the "MongoDB server" service.

NOTE:
	a. Migrations from Znode 9.0.x to 9.7.5.0 recommend deleting the old mongo data and publish it with the new data.
	b. Uninstall previous version of MongoDB from add or remove programs.
---------------------------------------------------------

NOTE: From 9.7.4 onwards,   Visual Studio 2019 Extension ie. "Web Compiler" by Mads Kristensen with version 1.12.394 needs to be installed.


2.2.1. DATABASE
---------------

Following are its three folders:

a. Znode Multifront 9.7.5.0 Database Script (for the fresh installation).
b. Znode Multifront Upgrade Scripts.
	- b.1. Only if previous versions of Znode Multifront (9.0.0 and onwards) are installed.
c. Steps To Enable Mongo DB Authentication.
d. Delete Scripts (Znode Default or Old Data Delete).
	- d.1. This is optional.
	- d.2. Follow the below guidelines if needed:
		-d.2.1. Execute the delete scripts in the following order:
			- First, Delete All Products Script.sql.
			- Second, Delete All Category Script.sql.
			- Third, Delete All Catalog Script.sql.
			- Fourth, Delete All Orders Script.sql.
				- Note: No sequence is required to execute the delete order script.

	- NOTE: Executing all the above delete scripts will delete the complete data from respective database tables.

--> a. Znode Multifront 9.7.5.0 Database Script (Fresh Installation)

For Fresh installation, there are two choices in data scripts:
	 1. B2B Data Script(i.e. Data with Maxwell's Hardware Catalog)
		-  To create Znode Multifront 9.7.5.0 fresh database for B2B data, run the script "Znode_Multifront_975_B2B.sql" in SQL server management studio.	
	 
	2. Znode Multifront script without sample data(i.e. The script with no default or sample data or any catalogs - those who want to start with fresh catalog, categories, etc can refer this script.)
		-  To create Znode Multifront 9.7.5.0 without any Sample Data, run the script 	     "ZnodeMultifrontScriptWithoutSampleData.sql" in SQL server management studio.	


--> b. Znode Multifront Upgrade Scripts
       - Refer this folder to upgrade Znode Multifront either from 9.0.1 to 9.0.2 or from 9.0.2 to 9.0.3 or from 9.0.3 to 9.0.4 or from 9.0.4 to 9.0.5.1 or from 9.0.5.1 to 9.0.6.0 or from 9.0.6 to 9.1.0.0 or 9.1.0.0 to 9.1.1.0 or 9.1.1.0 to 9.2.0.0 or 9.2.0.0 to 9.2.1.0 or 9.2.1.0 to 9.3.0.0 or 9.3.0.0 to 9.3.1.0 or 9.3.1.0 to 9.3.2.0 or 9.3.2.0 to 9.4.0.0 or 9.4.0.0 to 9.5.0.0 or 9.5.0.0 to 9.6.0.0 or 9.6.0.0 to 9.6.1.0 or 9.6.1.0 to 9.6.2.0 or 9.6.2.0 to 9.6.3.0 or 9.6.3.0 to 9.6.4.0 or 9.6.4.0 to 9.6.5.0 or 9.6.5.0 to 9.7.0.0 or 9.6.6.0 to 9.7.1.0 or 9.7.0.0 to 9.7.1.0 or 9.7.1.0 to 9.7.2.0 or 9.7.2.0 to 9.7.3.0 or 9.7.3.0 to 9.7.4.0 or 9.7.4.0 to 9.7.5.0
       - In this folder below files are provided which are as follows:
		- RunUpgradeScript.bat
		- UpgradeScriptFrom901To902.sql
		- UpgradeScriptFrom902To903.sql
		- UpgradeScriptFrom903To904.sql
		- UpgradeScriptFrom904To9051.sql
		- UpgradeScriptFrom9051To906.sql
		- UpgradeScriptFrom906To910.sql
		- UpgradeScriptFrom910To911.sql
		- UpgradeScriptFrom911To920.sql
       	- UpgradeScriptFrom920To921.sql
        - UpgradeScriptFrom921To930.sql
        - UpgradeScriptFrom930To931.sql
		- UpgradeScriptFrom931To932.sql
		- UpgradeScriptFrom932To940.sql
		- UpgradeScriptFrom940To950.sql
        - UpgradeScriptFrom950To960.sql
		- UpgradeScriptFrom960To961.sql
		- UpgradeScriptFrom961To962.sql
		- UpgradeScriptFrom962To963.sql
		- UpgradeScriptFrom963To964.sql
		- UpgradeScriptFrom964To965.sql
		- UpgradeScriptFrom965To970.sql
		- UpgradeScriptFrom966To971.sql
		- UpgradeScriptFrom970To971.sql
		- UpgradeScriptFrom971To972.sql
		- UpgradeScriptFrom972To973.sql
		- UpgradeScriptFrom973To974.sql
		- UpgradeScriptFrom974To975.sql	

	- To upgrade the database please follow below instructions:

		Step 1. Execute Batch file "RunUpgradeScript.bat".
		Step 2. Follow the instructions:
			Step 2.1. Enter SQL Server instance name.(example : TestServer\sql2016)
			Step 2.2. Enter User Name.(example : znodeuser)
			Step 2.3. Enter Password
			Step 2.4. Enter Database name (example : ZnodeMultifront975 which is already available)
		Step 3. Select the folder that contain the upgrade scripts.(example: \\Znode Multifront 9.7.5.0\ZnodeMultifront\Database\Upgrade Scripts)
		Step 4. If required, save the log and press any key to continue on command prompt.
		Step 5. Once done, the command prompt will close automatically.

--> c. Steps To Enable Mongo DB Authentication
       - To achieve this, refer text file "Mongo Authentication Steps.txt" under the "Steps To Enable Mongo DB Authentication" folder. 



2.2.2. PROJECTS
---------------

Projects folder contains one solution file and following four folders:
a. Znode.Engine.Admin
b. Znode.Engine.API
c. Znode.Engine.Webstore
	c.1. Themes Folder
d. Libraries

NOTE:  If using the 9.0.x version of Znode Multifront and made any changes, customizations or added any new keys in web.configs then add those in the respective web.configs.
	
=> Follow below guidelines to launch the Znode Multifront 9.7.5.0:

--> a. Znode.Engine.Admin
       - Open Znode.Engine.Admin Folder
       - Open web.config and update the connection string with valid Database Credentials and Database name (Initial Catalog).

--> b. Znode.Engine.API
       - Open Znode.Engine.API folder.
       - Open web.config and update the connection string with valid Database Credentials and Database name (Initial Catalog).

--> c. Znode.Engine.Webstore
       - Open Znode.Engine.Webstore folder.
       - Open web.config and update the connection string with valid Database Credentials and Database name (Initial Catalog).

       --> c.1. Themes Folder
		 - Please follow the instructions in the Knowledge Base "(http://knowledgebase.znode.com)" to make the theme compatible with Znode Multifront 9.7.5.0, if using an older version of Znode Multifront (9.0.0 and onwards).

--> d. Libraries 
		Note => Deleted Connected Services folder from the Znode.Engine.ERPConnector project as this one should not be a part of SDK.

2.2.3. SHARED LIBRARIES
-----------------------
All the required DLLs/references for Znode source code are available in the shared libraries folder.


2.3. ZNODE PAYMENT
------------------
	
ZnodePayment folder contains following two folders:
1. Database
2. PaymentApp

2.3.1. DATABASE
---------------
a. Znode Multifront Payment 9.7.5.0 Database Script (Fresh Installation)
   - To create Znode Multifront Payment 9.7.5.0 a fresh database, run the script "Znode_Multifront_975_Payment.sql" in SQL server management studio.	

b. Upgrade Script
   - To upgrade Znode Multifront payment from 9.0.0 to 9.0.1, run the script "Znode_multifront_Payment_90TO901.sql" in SQL server management studio. 
   - To upgrade Znode Multifront payment from 9.0.1 or onwards to 9.0.5.1, run the script "Znode_multifront_Payment_901TO9051.sql" in SQL server management studio. 
   - To upgrade Znode Multifront payment from 9.0.5.1 or onwards to 9.0.6.0, run the script "Znode_multifront_Payment_9051TO906.sql" in SQL server management studio.
   - To upgrade Znode Multifront payment from 9.3.0.0 to 9.3.1.0, run the script "Znode_multifront_Payment_930To931.sql" in SQL server management studio.  
   - To upgrade Znode Multifront payment from 9.6.0.0 to 9.6.1.0, run the script "Znode_multifront_Payment_960To961.sql" in SQL server management studio. 
   - To upgrade Znode Multifront payment from 9.6.2.0 to 9.6.3.0, run the script "Payment_UpgradeScriptFrom962To963.sql" in SQL server management studio. 
   - To upgrade Znode Multifront payment from 9.6.5.0 to 9.7.0.0, run the script "Payment_UpgradeScriptFrom965To970.sql" in SQL server management studio.
   - To upgrade Znode Multifront payment from 9.6.6.0 to 9.7.1.0, run the script "Payment_UpgradeScriptFrom965To970.sql" in SQL server management studio. 
   - To upgrade Znode Multifront payment from 9.7.0.0 to 9.7.1.0, run the script "Payment_UpgradeScriptFrom970To971.sql" in SQL server management studio.
   - To upgrade Znode Multifront payment from 9.7.1.0 to 9.7.2.0, run the script "Payment_UpgradeScriptFrom971To972.sql" in SQL server management studio.
   - To upgrade Znode Multifront payment from 9.7.2.0 to 9.7.3.0, run the script "Payment_UpgradeScriptFrom972To973.sql" in SQL server management studio.
   - To upgrade Znode Multifront payment from 9.7.3.0 to 9.7.4.0, run the script "Payment_UpgradeScriptFrom973To974.sql" in SQL server management studio.
   - To upgrade Znode Multifront payment from 9.7.4.0 to 9.7.5.0, run the script "Payment_UpgradeScriptFrom974To975.sql" in SQL server management studio. 

2.3.2 PAYMENT APP
-----------------
 
PaymentApp folder has only one folder that is:		
  a. Znode.Multifront.PaymentApplication

NOTE: When using previous versions of Znode Multifront Payment (9.0.0 or onwards), If any modifications, customization, or addition of new keys in web.config are made, then  add all the changes in the Payment web.config.

=> Follow below guidelines to update the connections strings for the Znode Multifront Payment 9.7.5.0:
     - Go to Znode.Multifront.PaymentApplication.Api.
     - Open web.config and update the connection string with valid Database Credentials and Database name (Initial Catalog).


Important: 1. The port of localhost URLs of Admin, Web Store, API and payment app has been changed.
              Ex. The Web Store was previously at http://localhost:3288, but is now at https://localhost:44315
           2. In the local host URL of admin, the Web Store, API, and the payment app, SSL is enabled. It will be mandatory to install a valid SSL certificate manually when the SSL certificate is not present in the system.
		      Installation details are available in release notes.
	   3. Visual Studio 2019 is used as IDE for Znode v9.7.5 onwards and typescript version is also upgraded from 3.0 to 4.0.
-------------------
2.4 Web.Config_Key_Information
		- It includes the information about changes in config files.
2.4.1 Znode.Engine.Admin
        - <system.webServer>
			<staticContent>
			<remove fileExtension=".webp" />
			<mimeMap fileExtension=".webp" mimeType="image/webp" />
			</staticContent>
		  </system.webServer>
2.4.2 Znode.Engine.API	
1) <add key ="ZnodeImportExportChunkLimit" value="300"/>
2) <staticContent>
      <remove fileExtension=".webp" />
      <mimeMap fileExtension=".webp" mimeType="image/webp" />
   </staticContent>
2.4.3 Znode.Engine.Webstore
 This section has been added "Tradecentricconfiguration"
1) <TradeCentricConfigSection>
    <!-- Keyword to provide access to TradeCentric request -->
    <add key="TradeCentricAccessKeyword" value="TradeCentric" />
    <!-- Time span to expire accesstoken is in Minutes-->
    <add key="AccessTokenExpireTimeSpan" value="5" />
    <!-- Time span to expire refreshtoken is in Days -->
    <add key="RefreshTokenExpireTimeSpan" value="2" />
  </TradeCentricConfigSection>
  
  The following keys are updated
* IsGlobalAPIAuthorization
*  authentication -> forms
    sessionState

* customHeaders ->
 * X-Frame-Options 
 * Content-Security-Policy    
 * Referrer-Policy

2.4.4 Znode.Multifront.PaymentApplication.Api
   below keys are removed from Payment web.config file
    - <add key="PaypalClientId" value="" />
    - <add key="PaypalClientSecret" value="" />
	

  Note:- User need to set up the Web.Config as per their environment setup.

============================================================================================================================

Copyright 2023, Znode LLC, All Rights Reserved. www.znode.com