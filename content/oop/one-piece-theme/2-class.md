
# Class

1. Class เป็นแบบแปลนของการสร้างวัตถุ (object) ในโปรแกรม เช่นถ้าเราจะทำระบบขายสินค้า ก็ควรมี Class ที่เป็นตัวแทนของ สินค้า ในระบบ
2. Class สามารถกำหนดให้เก็บตัวแปรได้ เราเรียกว่า **member variable** หรือ **property**
3. Class สามารถกำหนดให้มีการทำงานเฉพาะได้ เราเรียกว่า **member function** หรือ **method**
4. การสร้างตัวแปรจาก Class เราเรียกว่าการสร้างวัตถุ (object) หรือตัวตนของ class นั้นๆ ขึ้นมาในระบบ เรียกอีกชื่อว่าการทำ **instantiation**

ให้เราทำการสร้างไฟล์ `model/Product.cs`

```cs
// model/Product.cs

namespace pirateShipManagement.model
{
    // สร้างคลาส Product ที่มีสมาชิกตัวแปร Id, Name, และ Price 
    public class Product
    {
        // Id เป็นตัวแปรชนิด int ที่ใช้เก็บรหัสสินค้า
        public int Id { get; set; }

        // Name เป็นตัวแปรชนิด string ที่ใช้เก็บชื่อสินค้า
        public string Name { get; set; }

        // Price เป็นตัวแปรชนิด decimal ที่ใช้เก็บราคาสินค้า
        public decimal Price { get; set; }
    }

}
```

การทำ instantation ของ class นั้น สามารถทำได้โดยการเรียกใช้งาน constructor ของ class นั้นๆ โดยการใช้ keyword `new` ตามด้วยชื่อ class และ parameter ที่ต้องการส่งไปให้ constructor

```cs
var iphone = new Product();
```