drop table Customer cascade constraints;
drop table Product cascade constraints;
drop table Employee cascade constraints;
drop table OrderTbl cascade constraints;
drop table OrderLine cascade constraints;

-- Customer
create table Customer(
CustNo char(8),
CustFirstName varchar2(20) constraint CustFirstNameRequired not null,
CustLastName varchar2(30) constraint CustLastNameRequired not null,
CustStreet varchar2(50),
CustCity varchar2(30),
CustState char(2),
CustZip char(10),
CustBal decimal(12, 2) default 0,
constraint PKCustomer primary key (CustNo) );

-- Product
create table Product(
ProdNo char(8), 
ProdName varchar2(50) constraint ProdNameRequired not null,
ProdMfg varchar2(20) constraint ProdMfgRequired not null,
ProdQoh integer default 0,
ProdPrice decimal(12, 2) default 0,
ProdNextShipDate date,
constraint PKProduct primary key (ProdNo) );

-- Employee
create table Employee(
EmpNo char(8),
EmpFirstName varchar2(20) constraint EmpFirstNameRequired not null,
EmpLastName varchar2(30) constraint EmpLastNameRequired not null,
EmpPhone char(15),
EmpEmail varchar2(50) constraint EmpEmailRequired not null,
SupEmpNo char(8),
EmpCommRate decimal(3, 3),
constraint PKEmployee primary key (EmpNo),
constraint UniqueEmail unique (EmpEmail),
constraint FKSupEmpNo foreign key(SupEmpNo) references Employee );

-- OrderTbl
create table OrderTbl(
OrdNo char(8),
OrdDate date constraint OrdDateRequired not null,
CustNo char(8) constraint CustNoRequired not null,
EmpNo char(8),
OrdName varchar2(50),
OrdStreet varchar2(50),
OrdCity varchar2(30),
OrdState char(2),
OrdZip char(10),
constraint PKOrderTbl primary key (OrdNo),
constraint FKCustNo foreign key (CustNo) references Customer,
constraint FKEmpNo foreign key (EmpNo) references Employee );

-- OrderLine
create table OrderLine(
OrdNo char(8),
ProdNo char(8),
Qty integer default 1,
constraint PKOrdLine primary key (OrdNo, ProdNo), 
constraint FKOrdNo foreign key (OrdNo) references OrderTbl,
constraint FKProdNo foreign key (ProdNo) references Product );


-- Customer values
insert into Customer 
values ('C0954327', 'Sheri', 'Gordon', '336 Hill St.', 'Littleton', 'CO', '80129-5543', 230.00);

insert into Customer 
values ('C1010398', 'Jim', 'Glussman', '1432 E. Ravenna', 'Denver', 'CO', '80111-0033', 200.00);

insert into Customer 
values ('C2388597', 'Beth', 'Taylor', '2396 Rafter Rd.', 'Seattle', 'WA', '98103-1121', 500.00);

insert into Customer 
values ('C3340959', 'Betty', 'Wise', '4434 153rd NW', 'Seattle', 'WA', '98178-3311', 200.00);

insert into Customer 
values ('C3499503', 'Bob', 'Mann', '1190 Lorraine Cir.', 'Monroe', 'WA', '98013-1121', 0.00);

insert into Customer 
values ('C8543321', 'Ron', 'Thompson', '789 122nd St.', 'Renton', 'WA', '98666-1289', 85.00);

insert into Customer 
values ('C8574932', 'Wally', 'Jones', '411 Webber Ave.', 'Seattle', 'WA', '98105-1093', 1500.00);

insert into Customer 
values ('C8654390', 'Candy', 'Kendall', '456 Pine St.', 'Seattle', 'WA', '98105-3345', 50.00);

insert into Customer 
values ('C9128574', 'Jerry', 'Wyatt', '16212 123rd Ct.', 'Denver', 'CO', '80222-0022', 100.00);

insert into Customer 
values ('C9403348', 'Mike', 'Boren', '642 Crest Ave.', 'Englewood', 'CO', '80113-5431', 0.00);

insert into Customer 
values ('C9432910', 'Larry', 'Styles', '9825 S. Crest Lane', 'Bellevue', 'WA', '98104-2211', 250.00);

insert into Customer 
values ('C9543029', 'Sharon', 'Johnson', '1223 Meyer Way', 'Fife', 'WA', '98222-1123', 856.00);

insert into Customer 
values ('C9549302', 'Todd', 'Hayes', '1400 NW 88th', 'Lynnwood', 'WA', '98036-2244', 0.00);

insert into Customer 
values ('C9857432', 'Homer', 'Wells', '123 Main St.', 'Seattle', 'WA', '98105-4322', 500.00);

insert into Customer 
values ('C9865874', 'Mary', 'Hill', '206 McCaffrey', 'Littleton', 'CO', '80129-5543', 150.00);

insert into Customer 
values ('C9943201', 'Harry', 'Sanders', '1280 S. Hill Rd.', 'Fife', 'WA', '98222-2258', 1000.00);

-- Product values
insert into Product
values ('P0036566', '17 inch color monitor', 'ColorMeg, Inc.', 12, 169.00, '02/20/2013');

insert into Product
values ('P0036577', '19 inch color monitor', 'ColorMeg, Inc.', 10, 319.00, '02/20/2013');

insert into Product
values ('P1114590', 'R3000 Color Laser Printer', 'Connex', 5, 699.00, '01/22/2013');

insert into Product
values ('P1412138', '10 Foot Printer Cable', 'Ethlite', 100, 12.00, null);

insert into Product
values ('P1445671', '8-Outlet Surge Protector', 'Intersafe', 33, 14.99, null);

insert into Product
values ('P1556678', 'CVP Ink Jet Color Printer', 'Connex', 8, 99.00, '01/22/2013');

insert into Product
values ('P3455443', 'Color Ink Jet Cartridge', 'Connex', 24, 38.00, '01/22/2013');

insert into Product
values ('P4200344', '32-Bit Color Scanner', 'UV Components', 16, 199.99, '01/29/2013');

insert into Product
values ('P6677900', 'Black Ink Jet Cartridge', 'Connex', 44, 25.69, null);

insert into Product
values ('P9995676', 'Battery Back-up System', 'Cyberex', 12, 89.00, '02/01/2013');

-- Employee values
insert into Employee
values('E9884325', 'Thomas', 'Johnson', '(303)556-9987', 'TJohnson@bigco.com', null, 0.05);

insert into Employee
values('E9943211', 'Amy', 'Tang', '(303)556-4321', 'ATang@bigco.com', 'E9884325', 0.04);

insert into Employee
values('E1329594', 'Landi', 'Santos', '(303)789-1234', 'LSantos@bigco.com', 'E9943211', 0.02);

insert into Employee
values('E8544399', 'Joe', 'Jenkins', '(303)221-9875', 'JJenkins@bigco.com', 'E9943211', 0.02);

insert into Employee
values('E9345771', 'Colin', 'White', '(303)221-4453', 'CWhite@bigco.com', 'E9884325', 0.04);

insert into Employee
values('E9954302', 'Mary', 'Hill', '(303)556-9871', 'MHill@bigco.com', 'E9943211', 0.02);

insert into Employee
values('E9973110', 'Theresa', 'Beck', '(720)320-2234', 'TBeck@bigco.com', 'E9884325', null);

-- OrderTbl values
insert into OrderTbl
values ('O1116324', '01/23/2013', 'C0954327', 'E8544399', 'Sheri Gordon', '336 Hill St.', 'Littleton', 'CO', '80129-5543');

insert into OrderTbl
values ('O1231231', '01/23/2013', 'C9432910', 'E9954302', 'Larry Styles', '9825 S. Crest Lane', 'Bellevue', 'WA', '98104-2211');

insert into OrderTbl
values ('O1241518', '02/10/2013', 'C9549302', null,'Todd Hayes', '1400 NW 88th', 'Lynnwood', 'WA', '98036-2244');

insert into OrderTbl
values ('O1455122', '01/09/2013', 'C8574932', 'E9345771', 'Wally Jones', '411 Webber Ave.', 'Seattle', 'WA', '98105-1093');

insert into OrderTbl
values ('O1579999', '01/05/2013', 'C9543029', 'E8544399', 'Tom Johnson', '1632 Ocean Dr.', 'Des Moines', 'WA', '98222-1123');

insert into OrderTbl
values ('O1615141', '01/23/2013', 'C8654390', 'E8544399' ,'Candy Kendall', '456 Pine St.', 'Seattle', 'WA', '98105-3345');

insert into OrderTbl
values ('O1656777', '02/11/2013', 'C8543321', null, 'Ron Thompson', '789 122nd St.', 'Renton', 'WA', '98666-1289');

insert into OrderTbl
values ('O2223457', '01/12/2013', 'C2388597', 'E9884325', 'Beth Taylor', '2396 Rafter Rd.', 'Seattle', 'WA', '98103-1121');

insert into OrderTbl
values ('O2334661', '01/14/2013', 'C0954327', 'E1329594', 'Mrs. Ruth Gordon', '233 S. 166th', 'Seattle', 'WA', '98011');

insert into OrderTbl
values ('O3252629', '01/23/2013', 'C9403348', 'E9954302', 'Mike Boren', '642 Crest Ave.', 'Englewood', 'CO', '80113-5431');

insert into OrderTbl
values ('O3331222', '01/13/2013', 'C1010398', null,'Jim Glussman', '1432 E. Ravenna', 'Denver', 'CO', '80111-0033');

insert into OrderTbl
values ('O3377543', '01/15/2013', 'C9128574', 'E9943211', 'Jerry Wyatt', '16212 123rd Ct.', 'Denver', 'CO', '80222-0022');

insert into OrderTbl
values ('O4714645', '01/11/2013', 'C2388597', 'E1329594', 'Beth Taylor', '2396 Rafter Rd.', 'Seattle', 'WA', '98103-1121');

insert into OrderTbl
values ('O5511365', '01/22/2013', 'C3340959', 'E9884325', 'Betty Wise', '4434 153rd NW', 'Seattle', 'WA', '98178-3311');

insert into OrderTbl
values ('O6565656', '01/20/2013', 'C9865874', 'E9943211', 'Mr. Jack Sibley', '166 E. 344th', 'Renton', 'WA', '98666-1289');

insert into OrderTbl
values ('O7847172', '01/23/2013', 'C9943201', null, 'Harry Sanders', '1280 S. Hill Rd.', 'Fife', 'WA', '98222-2258');

insert into OrderTbl
values ('O7959898', '02/19/2013', 'C8543321', 'E8544399', 'Ron Thompson', '789 122nd St.', 'Renton', 'WA', '98666-1289');

insert into OrderTbl
values ('O7989497', '01/16/2013', 'C3499503', 'E9345771', 'Bob Mann', '1190 Lorraine Cir.', 'Monroe', 'WA', '98013-1121');

insert into OrderTbl
values ('O8979495', '01/23/2013', 'C9865874', null, 'Helen Sibley', '206 McCaffrey', 'Renton', 'WA', '98006-5543');

insert into OrderTbl
values ('O9919699', '02/11/2013', 'C9857432', 'E9954302', 'Homer Wells', '123 Main St.', 'Seattle', 'WA', '98105-4322');

-- OrderLine values
insert into OrderLine
values ('O1116324', 'P1445671', 1);

insert into OrderLine
values ('O1231231', 'P0036566', 1);

insert into OrderLine
values ('O1231231', 'P1445671', 1);

insert into OrderLine
values ('O1241518', 'P0036577', 1);

insert into OrderLine
values ('O1455122', 'P4200344', 1);

insert into OrderLine
values ('O1579999', 'P1556678', 1);

insert into OrderLine
values ('O1579999', 'P6677900', 1);

insert into OrderLine
values ('O1579999', 'P9995676', 1);

insert into OrderLine
values ('O1615141', 'P0036566', 1);

insert into OrderLine
values ('O1615141', 'P1445671', 1);

insert into OrderLine
values ('O1615141', 'P4200344', 1);

insert into OrderLine
values ('O1656777', 'P1445671', 1);

insert into OrderLine
values ('O1656777', 'P1556678', 1);

insert into OrderLine
values ('O2223457', 'P0036577', 1);

insert into OrderLine
values ('O2223457', 'P1445671', 1);

insert into OrderLine
values ('O2334661', 'P0036566', 1);

insert into OrderLine
values ('O2334661', 'P1412138', 1);

insert into OrderLine
values ('O2334661', 'P1556678', 1);

insert into OrderLine
values ('O3252629', 'P4200344', 1);

insert into OrderLine
values ('O3252629', 'P9995676', 1);

insert into OrderLine
values ('O3331222', 'P1412138', 1);

insert into OrderLine
values ('O3331222', 'P1556678', 1);

insert into OrderLine
values ('O3331222', 'P3455443', 1);

insert into OrderLine
values ('O3377543', 'P1445671', 1);

insert into OrderLine
values ('O3377543', 'P9995676', 1);

insert into OrderLine
values ('O4714645', 'P0036566', 1);

insert into OrderLine
values ('O4714645', 'P9995676', 1);

insert into OrderLine
values ('O5511365', 'P1412138', 1);

insert into OrderLine
values ('O5511365', 'P1445671', 1);

insert into OrderLine
values ('O5511365', 'P1556678', 1);

insert into OrderLine
values ('O5511365', 'P3455443', 1);

insert into OrderLine
values ('O5511365', 'P6677900', 1);

insert into OrderLine
values ('O6565656', 'P0036566', 10);

insert into OrderLine
values ('O7847172', 'P1556678', 1);

insert into OrderLine
values ('O7847172', 'P6677900', 1);

insert into OrderLine
values ('O7959898', 'P1412138', 5);

insert into OrderLine
values ('O7959898', 'P1556678', 5);

insert into OrderLine
values ('O7959898', 'P3455443', 5);

insert into OrderLine
values ('O7959898', 'P6677900', 5);

insert into OrderLine
values ('O7989497', 'P1114590', 2);

insert into OrderLine
values ('O7989497', 'P1412138', 3);

insert into OrderLine
values ('O7989497', 'P1445671', 1);

insert into OrderLine
values ('O8979495', 'P1114590', 1);

insert into OrderLine
values ('O8979495', 'P1412138', 1);

insert into OrderLine
values ('O8979495', 'P1445671', 1);

insert into OrderLine
values ('O9919699', 'P0036577', 1);

insert into OrderLine
values ('O9919699', 'P1114590', 1);

insert into OrderLine
values ('O9919699', 'P4200344', 1);
