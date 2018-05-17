-- Problem 4
select OrdNo, OrdDate, OrdName
from OrderTbl
where OrdCity = 'Denver' OR OrdCity = 'Englewood';

-- Problem 5
select CustNo, CustFirstName, CustLastName, CustCity, CustBal
from Customer
where (CustCity = 'Denver' AND CustBal > 150) OR (CustCity = 'Seattle' AND CustBal > 300);

-- Problem 9
select *
from Product 
where ProdName like '%Ink Jet%';

-- Problem 11
select o.OrdNo, o.OrdDate, c.CustNo, c.CustFirstName, c.CustLastName
from OrderTbl o, Customer c
where   o.CustNo = c.CustNo
        AND to_char(OrdDate, 'MM/YYYY') = '01/2013'
        AND CustState = OrdState
        AND CustState = 'CO';
        
-- Problem 22
select ot.OrdNo, sum(ol.Qty * ProdPrice) as TotalAmt 
from Product p inner join OrderLine ol on ol.ProdNo = p.ProdNo 
inner join OrderTbl ot on ot.OrdNo = ol.OrdNo
where   to_char(OrdDate, 'MM/DD/YYYY') = '01/23/2013' 
        group by ot.OrdNo
        order by ot.OrdNo asc;

-- Problem 24 
select c.CustNo, c.CustFirstName, c.CustLastName, sum(ol.Qty) as ProdQty, sum(ol.Qty * p.ProdPrice) as TotalAmt
from OrderLine ol inner join OrderTbl ot on ol.OrdNo = ot.OrdNo
inner join Customer c on c.CustNo = ot.CustNo
inner join Product p on ol.ProdNo = p.ProdNo
where   to_char(ot.OrdDate, 'MM/YYYY') = '01/2013'
        AND (p.ProdName like '%Ink Jet%' OR p.ProdName like '%Laser%') 
        group by c.CustNo, c.CustFirstName, c.CustLastName
        having count(*) > 2;
        
-- Problem 35
select c.CustNo, c.CustLastName, count(distinct ot.OrdDate) as NumOrders
from OrderLine ol inner join OrderTbl ot on ol.OrdNo = ot.OrdNo
inner join Customer c on c.CustNo = ot.CustNo
where c.CustState = 'CO'
        AND to_char(ot.OrdDate, 'MM/YYYY') = '01/2013' 
        group by c.CustNo, c.CustLastName;
