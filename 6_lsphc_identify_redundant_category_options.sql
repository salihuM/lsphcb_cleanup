select * from dataelementcategoryoption 
where categoryoptionid not in (
  select categoryoptionid from categories_categoryoptions);
