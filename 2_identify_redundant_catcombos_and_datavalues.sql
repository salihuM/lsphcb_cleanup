select cc.categorycomboid as cc_id, cc.uid as cc_uid, substring(cc.name,0,50) as cc_name, (
  select count(*)
  from datavalue dv
  inner join categorycombos_optioncombos ccoc on dv.categoryoptioncomboid = ccoc.categoryoptioncomboid 
  where ccoc.categorycomboid = cc.categorycomboid) as dv_count
from categorycombo cc
where not exists (
  select 1
  from dataelement de
  where de.categorycomboid = cc.categorycomboid)
and not exists (
  select 1
  from dataset ds
  where ds.categorycomboid = cc.categorycomboid)
and not exists (
  select 1
  from program p
  where p.categorycomboid = cc.categorycomboid);
  
