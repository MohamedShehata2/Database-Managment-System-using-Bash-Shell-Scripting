# DBMS_by_BashScripting

### Database Management System (DBMS) using Bash Shell Script:

The Project is a simulation of DBMS in small scale, that will enable user to store and retrieve the data from Hard-disk.

The Project Features: The Application will be CLI Menu based app, that will provide to user multiple functionalities on two levels:
 
#### Database level:

  - Create Database
  - List Databases
  - Connect To Databases
  - Drop Database
  - Rename Database

#### Table level:

  - Create Table
  - List Tables
  - Update Table
  - Drop Table
  - Insert into Table
  - Select From Table
  - Delete From Table

## More info about the Project:

- The Database will be store as Directory on current script file
- For each Database, there are two directories: 
    - Tables Directory: contain tables created on this database.
    - MetaData Directory: contain info about each table created in the database like:
        - No. of Colunms
        - Colunms name
        - Datatype of each Colunm [Integer/String]
- The Tables stored in CSV file format.
- There is assumption that First Column is the Primary Key of the table, which used for Select, Update and Delete Rows.
- There is a validation for every input from user.
- There is a validation for the data type on each column.

### Hint:
- The project code is devided in two directories:
    - DB Scripts: contain all Database functions
    - Table Scripts: contain all Tables funtions 

