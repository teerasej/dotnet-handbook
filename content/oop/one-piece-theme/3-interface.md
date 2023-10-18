
## การสร้าง Interface

1. Interfaces กำหนดกฎและรูปแบบ **ที่เราต้องการให้ Class หนึงต้องมี**
2. มีได้แค่รูปแบบของ method แต่ไม่อนุญาตให้เขียนตัว method

ให้เราทำการสร้างไฟล์ `model/IDiscount.cs`

```cs
// model/IDiscount.cs

namespace pirateShipManagement.model
{
    // สร้าง interface ชื่อ IDiscount ซึ่งมีเมทอดชื่อ ApplyDiscount ที่รับ parameter เป็น decimal และคืนค่าเป็น decimal ด้วย
    public interface IDiscount
    {
        // ถูกใช้เพื่อคำนวณส่วนลดของราคาสินค้าในโปรแกรมที่เกี่ยวข้องกับการขายสินค้าออนไลน์ โดยจะรับราคาเดิมของสินค้าเข้ามาแล้วคำนวณหาส่วนลดแล้วคืนค่าราคาสุทธิของสินค้า
        decimal ApplyDiscount(decimal originalPrice);
    }

}
```



