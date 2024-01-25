select customerdetails.customerID, customerdetails.fullName, orders.orderID, orders.totalCost, menuitems.name, menuitems.type, menu.cuisine
from customerdetails
join orders on customerdetails.customerID = orders.customerID
join menu on menu.menuID=orders.menuID
join menuitems on menu.itemID=menuitems.itemID
WHERE orders.totalCost >18
order by totalCost;
