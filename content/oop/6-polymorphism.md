
# Polymorphism


- Polymorphism เป็นแนวคิดในการทำให้ object ของ Class ต่างๆ สามารถมองเป็น object ของ Class หลักที่มีการสืบทอดมาได้ 
- โดยเราสามารถเรียกใช้ method ของ Class ต้นแบบได้โดยตรง โดยไม่ต้องรู้ว่า object ที่เราใช้นั้นเป็น object ของ Class ต้นแบบหรือ Class ลูก
- ในการเขียนโปรแกรมแนว OOP เราสามารถใช้ Polymorphism ได้โดยการสร้าง Interface ขึ้นมา แล้วให้ Class ต้นแบบและ Class ลูกที่สืบทอดมา มีการ implement Interface นั้นๆ ที่เราสร้างขึ้นมา

ให้เราปรับปรุงไฟล์ `model/ShoppingCart.cs`

```cs
// model/ShoppingCart.cs

namespace shopii_project.model
{
    // คลาส ShoppingCart ที่มี property ชื่อ products ซึ่งเป็น  รายการของสินค้าในตระกร้า ใช้ List เป็น data type

    // และมี method ชื่อ AddProduct ที่รับ parameter เป็น Product เพื่อนำสินค้าใส่เพิ่มในรายการ
    
    // method ชื่อ CalculateTotal ที่ไล่รวมราคาสินค้าในรายการทั้งหมดแล้วคืนค่าเป็นราคารวม
    public class ShoppingCart
    {
        private List<Product> products = new();

       
        public void AddProduct(Product product)
        {
            products.Add(product);
        }

        public decimal CalculateTotal()
        {
            decimal total = 0;

            // เป็น loop ที่วน loop ผ่านทุกๆ Product ใน List ของสินค้าในตะกร้าสินค้า โดยใช้ foreach และใช้ตัวแปร product เก็บค่า Product แต่ละตัว 
            
            // จากนั้นจะทำการตรวจสอบว่า Product นั้น implement interface ชื่อ IDiscount หรือไม่ โดยใช้ keyword is ในการตรวจสอบ 
            
            // ถ้า Product นั้น implement interface ชื่อ IDiscount แล้ว จะทำการ cast เป็น IDiscount และเรียกใช้เมทอด ApplyDiscount เพื่อคำนวณหาส่วนลดของราคาสินค้า และนำค่าที่ได้ไปบวกกับตัวแปร total 
            
            // ถ้า Product นั้นไม่ implement interface ชื่อ IDiscount ก็จะนำราคาของ Product มาบวกกับตัวแปร total โดยตรง จากนั้น loop จะวนต่อไปเรื่อยๆ จนกว่าจะวน loop ผ่านทุกๆ Product ใน List 
            
            // แล้วจึงคืนค่าตัวแปร total กลับไปให้โปรแกรมที่เรียกใช้งาน loop นี้
            foreach (var product in products)
            {
                if (product is IDiscount discountProduct)
                {
                    total += discountProduct.ApplyDiscount(product.Price);
                }
                else
                {
                    total += product.Price;
                }
            }

            return total;
        }
    }

}
```