
# การใช้งานคลาสที่สร้างขึ้น

```cs
using shopii_project.model;


Product regularProduct = new() { Name = "Book", Price = 20 };
SaleProduct saleProduct = new() { Name = "Shirt", Price = 50, DiscountPercentage = 10 };

DisplayProductPrice(regularProduct);
DisplayProductPrice(saleProduct);

ShoppingCart cart = new();
cart.AddProduct(regularProduct);
cart.AddProduct(saleProduct);

Console.WriteLine($"Total Cart Price: {cart.CalculateTotal()}");


static void DisplayProductPrice(Product product)
{
    if (product is IDiscount discountProduct)
    {
        Console.WriteLine($"{product.Name} - Discounted Price: {discountProduct.ApplyDiscount(product.Price)}");
    }
    else
    {
        Console.WriteLine($"{product.Name} - Price: {product.Price}");
    }
}


```