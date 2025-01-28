select categoryid, uid, name from dataelementcategory 
where categoryid not in (
  select categoryid from categorycombos_categories);
