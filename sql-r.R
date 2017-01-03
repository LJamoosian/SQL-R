library(RODBC)
#Conncect SQL server "myServerName" and database "myDatabasename" 
cn<- odbcDriverConnect(connection="driver={SQL Server Native Client 11.0};
                       server=myServerName ;database=myDatabaseName ;trusted_connection=yes;")

#Sample of calling table from DB server "dbo.fc"
fc <- sqlFetch(cn, 'dbo.fc', colnames=FALSE,rows_at_time=1000)
#or
fc=sqlQuery(cn, "select * from dbo.fc")

#See table of data
View(fc)          

#Counting the number of female students 
genFcount=sqlQuery(cn, "select count(distinct STC_PERSON_ID ) from dbo.fc Where GENDER='F' ")
gen=genFcount$GENDER

## Including Plots of gender
plot(gen,col=c("darkblue","red"))
