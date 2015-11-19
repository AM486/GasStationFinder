# GasStationFinder

##Simple Mysql Web App

####Working on localhost
* Create DB on phpMyAdmin on localhost
* Connect Netbeans with the DB
* ...Write the project...
* Edit web pages project folder web page>META_INF>context.xlm
* Create Deployment Descriptor
* Add jdbc driver jar int0 $catalina_base/lib
* Add jstl library into project
* Add jstl tagline
* Add jsp queries
       
_______________________________________________________________________________
        
####Working on remote server
* Throw .war into webapps
* Download and add jdbc driver jar int0 $catalina_base/lib
* Change context.xml  (mysql login info and DB url)
* Add the jstl tagline  sql:dataSource and the DB info into
the .jsp file in order to connect to the DB



Useful links:
http://www.tutorialspoint.com/jsp/jsp_database_access.htm
http://www.tutorialspoint.com/jsp/jstl_sql_query_tag.htm
http://www.9lessons.info/2008/09/jsp-login-page-to-connect-mysql-atabase.html
