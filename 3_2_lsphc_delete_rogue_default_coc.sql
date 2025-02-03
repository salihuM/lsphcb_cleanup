BEGIN;

-- Initial situation check
select coc.categoryoptioncomboid, coc.name, coc.uid from categoryoptioncombo coc where categoryoptioncomboid in (select categoryoptioncomboid from categorycombos_optioncombos where categorycomboid = (select categorycomboid from categorycombo where uid = 'bjDvmb4bfuf'));


-- Create a temporary support table for data elements to be deleted
CREATE TEMP TABLE _bao_rogue_default_coc AS 
SELECT categoryoptioncomboid, uid 
FROM categoryoptioncombo 
WHERE uid IN ('cKf6Y3d6XxG','OSiqazly2Gf','UxYxduhZOMQ','P68rcU7ahzc','pLJb53AcTuj','UOncmG7eakp','VSa75IMnlKH','gmW8MmLRJM9','k1tblU2z2DR','nT4YcX1oqYa','W06NzdJ52q0','vlpLmuuM3af','twJft7xNxJF','Mml2zeHwNRf','qiPeu1fhUzc','zg4UEdnkjTe','nxOYlIH0fyC','YLnVx36kEoB','spJcVru5xm5','S1UIhPhfCJu','WeChkhdxd0J','eTW0ydGTe78','WSz0ikY7Yy6','Agj0kWQNVcb','BGiySNUZJ6L','JDSQGLCxXZD');


-- Verify count of rogue COCs
SELECT COUNT(*) AS remaining_count_rogue_coc 
FROM categoryoptioncombo
WHERE uid IN (SELECT uid FROM _bao_rogue_default_coc);


-- Delete from dependent tables
DELETE FROM datavalue 
WHERE categoryoptioncomboid IN (SELECT categoryoptioncomboid FROM _bao_rogue_default_coc);

DELETE FROM datavalueaudit
WHERE categoryoptioncomboid IN (SELECT categoryoptioncomboid FROM _bao_rogue_default_coc);


DELETE FROM categorycombos_optioncombos 
WHERE categoryoptioncomboid IN (SELECT categoryoptioncomboid FROM _bao_rogue_default_coc);

DELETE FROM categoryoptioncombo 
WHERE categoryoptioncomboid IN (SELECT categoryoptioncomboid FROM _bao_rogue_default_coc);

-- Verify deletions
SELECT COUNT(*) AS remaining_count_rogue_coc 
FROM categoryoptioncombo
WHERE uid IN (SELECT uid FROM _bao_rogue_default_coc);

-- Final situation check
select coc.categoryoptioncomboid, coc.name, coc.uid from categoryoptioncombo coc where categoryoptioncomboid in (select categoryoptioncomboid from categorycombos_optioncombos where categorycomboid = (select categorycomboid from categorycombo where uid = 'bjDvmb4bfuf'));



COMMIT;
