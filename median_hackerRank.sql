

--A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION
--and round your answer to 4 decimal places.

SELECT DISTINCT FORMAT(
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LAT_N) OVER (), 
    'N4') AS Median
FROM STATION;

--PERCENTILE_CONT(0.5):
--This calculates the 50th percentile, which represents the median value of the column LAT_N.
--The median separates the higher half of the data from the lower half.

--WITHIN GROUP (ORDER BY LAT_N):
--This ensures that the LAT_N values are sorted in ascending order before calculating the median.
--Sorting is essential because the median depends on the order of the data.

--OVER ():
--The OVER() function specifies that the calculation is performed across the entire dataset without dividing it into groups.
--This means the median is calculated for all rows in the STATION table.


