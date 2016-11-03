SELECT 
    resumeId,
    SUM(views) totalViews,
    SUM(downloads) totalDownloads
FROM
    (SELECT 
        resumeid resumeId, 0 AS views, 1 AS downloads
    FROM
        tblresume_download_tracking
    WHERE
        resumeid = 3246013 UNION ALL SELECT 
        resume_id resumeId, 0 AS views, 1 AS downloads
    FROM
        track_resume_download
    WHERE
        resume_id = 3246013 UNION ALL SELECT 
        resume_id resumeId, noofviewed AS views, 0 AS downloads
    FROM
        track_resume_view
    WHERE
        resume_id = 3246013) f
GROUP BY resumeId;



select year(downloadtracking_createddate),month(downloadtracking_createddate) ,count(*)
from tblresume_download_tracking
where year(downloadtracking_createddate) >= 2015
group by year(downloadtracking_createddate), month(downloadtracking_createddate);

