SELECT * FROM rfm_clusters limit 100;

/*View Top Customers(High Frequency and High Monetary)*/
Select *
From rfm_clusters
where Frequency>10 and Monetary >5000
ORDER BY Monetary Desc;

/*Churned Customers(Low Frequency,High Recency)*/

SELECT*
FROM rfm_clusters
WHERE Frequency<=1 and Recency >200
ORDER BY Recency DESC;

/*Segment-wise Customer Count*/

SELECT cluster ,count(*) As customer_count
FROM rfm_clusters
GROUP BY cluster
ORDER BY customer_count DESC;

/*Average RFM Values per Cluster*/
SELECT cluster,
   AVG(Recency)AS avg_recency,
   AVG(Frequency)AS avg_frequency,
   AVG(Monetary)AS avg_monetary
FROM rfm_clusters
GROUP BY cluster;

/*Recently Active High Spenders*/

SELECT *
FROM rfm_clusters
where Recency<30 and Monetary>3000
ORDER BY Frequency
