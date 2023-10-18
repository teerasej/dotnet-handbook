
# Inheritance

1. กฎการสืบทอด (Inheritance) ทำให้เราสามารถสร้าง class ใหม่โดยที่ยังมีคุณสมบัติของ class ที่ถูกสืบทอดเดิมทั้งหมด
2. อาจจะมีการเรียก Class ที่สืบทอดคุณสมบัติของอีก Class ว่า **child class** หรือ **sub class**
3. อาจจะมีการเรียก Class ถูกสืบทอด ว่า **parent class** หรือ **super class**

ให้เราทำการสร้างไฟล์ `model/ShoppingCart.cs`

```cs
// model/ShoppingCart.cs

namespace pirateShipManagement.model
{
    // คลาส SaleProduct ที่สืบทอดคุณสมบัติจากคลาส Product และ implements interface ชื่อ IDiscount
    // การสืบทอดจะทำให้ SaleProduct มีคุณสมบัติที่ Product มีทั้งหมด และมีคุณสมบัติของ IDiscount ด้วย
    public class SaleProduct : Product, IDiscount
    {
        // ส่วนนี้เป็น property ที่สืบทอดมาจากคลาส Product
        public decimal DiscountPercentage { get; set; }

        // ส่วนนีี้เป็น method ที่ต้องมีการเขียนใน class SaleProduct ตามที่ interface IDiscount กำหนด
        // จะถูกเรียกใช้เพื่อคำนวณส่วนลดของราคาสินค้าในโปรแกรมที่เกี่ยวข้องกับการขายสินค้าออนไลน์ 
        public decimal ApplyDiscount(decimal originalPrice)
        {
            return originalPrice * (1 - (DiscountPercentage / 100));
        }
    }

}
```