# Purpose
 Working directly with a DB and creating Windows Form Application in C#.
# What does it do?
For the moment the following:
 ### The master branch contains:
   - a one to many relationship table which display the connection between the parent and the child table using two separate grids
   - when selecting a row from the parent all the linked instances of the child table appear in the second grid
   - create(insert), read(select), update, delete operations available
 ### The feature1 branch
  -  making the app suitable for more than one specific scenario
  -  using App.config to write XML settings to change the tables with any other ones
  -  modifying the code to be generic
