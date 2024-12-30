select count(crash_id) from fact_crash  where source_system = 'Austin'
select count(crash_id) from fact_crash  where source_system = 'Chicago'




select l.latitude, l.longitude ,count(*)
from fact_crash fc 
left join location_dim l on fc.loc_id = l.loc_id
group by l.latitude, l.longitude having l.latitude != 0
order by count(*) desc LIMIT 3

####### question 3
select Just_Injured_Fl, count(*) from fact_crash group by Just_Injured_Fl

select source_system, Just_Injured_Fl , count(*) from fact_crash group by source_system,Just_Injured_Fl

####### question 4
select PEDESTRIAN_INVOLVED, count(*) from vehicle_int.fact_crash group by  PEDESTRIAN_INVOLVED 

select source_system, PEDESTRIAN_INVOLVED , count(*) from vehicle_int.after_int_stg group by source_system, PEDESTRIAN_INVOLVED

## question 5 

select t.Time_Of_Day,count(CRASH_ID) from fact_crash fc INNER JOIN time_dim t on fc.time_id = t.time_id group by t.Time_Of_Day 




###question 6


select count(*) from fact_crash order by Count_of_Motorist_involved desc 

select source_system,count(crash_id) from fact_crash group by crash_id, source_system order by  count(Count_of_Motorist_involved) desc


#question 7 


select ld.latitude, ld.longitude ,count(fc.Total_death) from fact_crash fc INNER JOIN location_dim ld ON ld.loc_id = ld.loc_id group by ld.latitude, ld.longitude order by count(fc.Total_death) desc




#Question 8


select d.Season, count(CRASH_ID) from fact_crash fc INNER JOIN date_dim d on fc.date_id = d.date_id group by d.Season

select  d.Weekday_Or_Weekend, count(CRASH_ID) from fact_crash fc INNER JOIN date_dim d on fc.date_id = d.date_id group by d.Weekday_Or_Weekend

select  d.Day_of_Week,count(CRASH_ID) from fact_crash fc INNER JOIN date_dim d on fc.date_id = d.date_id group by d.Day_of_Week



##question 9
select source_system,PEDESTRIAN_KILLED_MOST, count(*)  from fact_crash group by source_system,PEDESTRIAN_KILLED_MOST 





##question 10 
select s.Description, count(s.Description) from vehicle_curation.fact_contribution fco INNER JOIN vehicle_curation.scd_contribution_dim s on fco.SK_Contri = s.SK_Contri group by s.Description order by count(s.Description) desc


#### question11
select v.vehicle_type, count(v.vehicle_type) from fact_vehicle fv INNER JOIN vehicle_dim v on fv.vehicle_id = v.vehicle_id group by v.vehicle_type 


Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ' desc' at line 1
