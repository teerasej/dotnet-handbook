
# Encapsulation

- Encapsulation เป็นแนวคิดในการรวมข้อมูล และรูปแบบการทำงานไว้ในที่เดียว ซึ่งในการเขียนโปรแกรมแนว OOP เราเรียกส่วนนี้ว่า class 
- ถึงแม้ว่าจะเก็บข้อมูล และรูปแบบการทำงานเอาไว้ แต่ก็ไม่ได้หมายความว่าเราสามารถเรียกใช้ได้โดยตรงทุกครั้ง 
- การเรียกใช้ หรือเข้าถึงจึงถูกำหนดโดยผู้สร้าง class ว่าต้องการให้เรียกใช้โดยตรง หรือเรียกใช้ผ่าน Accessor หรือ function หรือ method 

ให้เราทำการสร้างไฟล์ `model/ShoppingCart.cs`

```cs
// model/ShoppingCart.cs

namespace pirateShipManagement.model
{
    // คลาส ShoppingCart ที่มี property ชื่อ products ซึ่งเป็น  รายการของสินค้าในตระกร้า ใช้ List เป็น data type

    // และมี method ชื่อ AddProduct ที่รับ parameter เป็น Product เพื่อนำสินค้าใส่เพิ่มในรายการ
    
    // method ชื่อ CalculateTotal ที่ไล่รวมราคาสินค้าในรายการทั้งหมดแล้วคืนค่าเป็นราคารวม
    public class OnePieceTreasure
    {
        private string SecretLocation = "Raftel";

        public void GiveHint()
        {
            Console.WriteLine("The treasure is located in the Grand Line!");
        }

        private void RevealSecret()
        {
            Console.WriteLine($"The real location is {SecretLocation}.");
        }
    }


}
```