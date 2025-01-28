select cc.categorycomboid, cc.uid, cc.name, datadimensiontype
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
