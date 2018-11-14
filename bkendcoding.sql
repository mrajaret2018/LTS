
/* Login user */

select passwd from users where empid = :Supplied id

/* Dashboard Screen */

#count of Total Laptops
select count(*) from master
# count of all Laptops on stock
select count(*) from master where isout=0
# List of laptops on stock
select laptopid from master where isout = 0

#Laptops count that are already due
select count(*) from master  where isissued = 1 and eta <= curdate()
#Laptops list that are  due later
select laptopid from master  where isissued = 1 and eta > curdate() 

#Laptops list that are already due with staff and phone extension
select a.laptopid, a.eta as "due date", c.name,c.phoneext from master a, detail b, users c  
where a.isissued = 1 and a.eta < curdate() and
	  a.isreturned = 0 and a.laptopid = b.laptopid and b.requesterid = c.empid and
      b.requestdate is most recent


/* Request Laptop */
# List of laptops on stock
select laptopid from master where isout = 0
# on request completion
# insert a row in details table and then update master table'e eta and isrequested
insert into details (laptopid, requesterid, requestdate, reason, committedrtndate) values (??)
update master set eta = ??, isrequested = 1 where laptopid = ??

/* approve laptop */
# list of requests
select c.name, b.reason, b.committedrtndate, b.laptopid,b.requesterid,b.requestdate from master a, detail b, users c
where a.isrequested = 1 and
	  a.laptopid = b.laptopid and b.requesterid = c.empid 
      
# front end will do an update for each user request 
update details set approveid = ?? , approvedate = currdate()
where laptopid = ?? and requesterid = ?? and requestdate = ??

update master set isapproved = 1 where laptopid = ??


/* issue laptop */
# list of approvals
select c.name, b.reason, b.committedrtndate, b.laptopid,b.requesterid,b.requestdate from master a, detail b, users c
where a.isapproved = 1 and
	  a.laptopid = b.laptopid and b.requesterid = c.empid and b.requestdate is most recent
# front end will do an update for each user  approval
update details set issuedid = ?? , issueddate = currdate()
where laptopid = ?? and requesterid = ?? and requestdate = ??

update master set isissued = 1 where laptopid = ??

/* collect laptop */
# list of issued laptops
select c.name, b.reason, b.committedrtndate, b.laptopid,b.requesterid,b.requestdate from master a, detail b, users c
where a.isissued = 1 and
	  a.laptopid = b.laptopid and b.requesterid = c.empid and b.requestdate is most recent
# front end will do an update for each user  issue
update details set collectorid = ?? , collectiondate = currdate()
where laptopid = ?? and requesterid = ?? and requestdate = ??

update master set isreturned = 1 where laptopid = ??

