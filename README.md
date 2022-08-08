# Little Esty Shop Merchant Bulk Discounts

## Bulk Discounts User Stories

```
Merchant Bulk Discounts Index

As a merchant
When I visit my merchant dashboard
Then I see a link to view all my discounts
When I click this link
Then I am taken to my bulk discounts index page
Where I see all of my bulk discounts including their
percentage discount and quantity thresholds
And each bulk discount listed includes a link to its show page
Merchant Bulk Discount Create
```

```
As a merchant
When I visit my bulk discounts index
Then I see a link to create a new discount
When I click this link
Then I am taken to a new page where I see a form to add a new bulk discount
When I fill in the form with valid data
Then I am redirected back to the bulk discount index
And I see my new bulk discount listed
Merchant Bulk Discount Delete
```

```
As a merchant
When I visit my bulk discounts index
Then next to each bulk discount I see a link to delete it
When I click this link
Then I am redirected back to the bulk discounts index page
And I no longer see the discount listed
Merchant Bulk Discount Show
```

```
As a merchant
When I visit my bulk discount show page
Then I see the bulk discount's quantity threshold and percentage discount
Merchant Bulk Discount Edit
```

```
As a merchant
When I visit my bulk discount show page
Then I see a link to edit the bulk discount
When I click this link
Then I am taken to a new page with a form to edit the discount
And I see that the discounts current attributes are pre-poluated in the form
When I change any/all of the information and click submit
Then I am redirected to the bulk discount's show page
And I see that the discount's attributes have been updated
Merchant Invoice Show Page: Total Revenue and Discounted Revenue
```

```
As a merchant
When I visit my merchant invoice show page
Then I see the total revenue for my merchant from this invoice (not including discounts)
And I see the total discounted revenue for my merchant from this invoice which includes bulk discounts in the calculation
Merchant Invoice Show Page: Link to applied discounts
```

```
As a merchant
When I visit my merchant invoice show page
Next to each invoice item I see a link to the show page for the bulk discount that was applied (if any)
Admin Invoice Show Page: Total Revenue and Discounted Revenue
```

```
As an admin
When I visit an admin invoice show page
Then I see the total revenue from this invoice (not including discounts)
And I see the total discounted revenue from this invoice which includes bulk discounts in the calculation
As a merchant
When I visit the discounts index page
I see a section with a header of "Upcoming Holidays"
In this section the name and date of the next 3 upcoming US holidays are listed.

Use the Next Public Holidays Endpoint in the [Nager.Date API](https://date.nager.at/swagger/index.html)
```


# Welcome to Your Little Esty Shop!

Here you will be able to manage your inventory and fulfill your customer invoices with our proprietary e-commerce platform of cutting edge technology!(*see disclaimer 1*) This document highlights the features included with our Standard Package and Enterprise Package.

## Merchant Dashboard

This is the hub of your bustling business! Features of your dashboard are:
- Items Ready To Ship:  All of your items ready to be sent off to your customers, in one place!
- Favorite Customers: Your top five customers by revenue at a glance!
- Navigate to My Items or My Invoices to stay on top of these essensial e-commerce assets!

### Merchant: My Items
Whether you sell just a few or thousands of items, here you can manage your inventory as well as
see key statistics that will help launch your sales to the moon!
- See the top 5 hottest items, and when sales are on fire for those items!
- Enable or Disable your items to drive sales your way!
- Add new items to continue to enhance your scalability!

### Merchant: My Invoices
From here you can see ALL of your invoices, as well as navigate to the details for each invoice!

## Admin Dashboard
For our Enterprise clients, you can manage all of your merchants and invoices in one place! See mission critical information at a glance to help you streamline your own bottom-line! Features of your Dashboard include:
- Incomplete Invoices: See all your pending invoices at a glance to project future revenue stream!
- Top Customers: These are your customers who shop the most across all of your merchants. Don't let this resource go to waste!
- Navigate to your Merchants and Invoices pages to stay on top of these essensial e-commerce assets!

### Admin: Merchants
See those KPIs in action!  Add new Merchants to boost your bottom line, or get rid of underperforming merchants dragging it down.  Features of your Admin:Merchants view:
* Enable/Disable Merchant: For whatever reason you may need to disable a merchant:
  * Non-payment
  * Low performing
  * Bad Reviews
* Top Merchants: These are the merchants that drive profits, all day every day!
* Add New Merchants: Keep your platform fresh by bringing new merchants with new items

### Admin: Invoices
See every invoice of every merchant of every kind at ANY TIME.  The POOOOWWEEEER!