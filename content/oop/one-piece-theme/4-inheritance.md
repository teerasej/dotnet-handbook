
# Inheritance

1. กฎการสืบทอด (Inheritance) ทำให้เราสามารถสร้าง class ใหม่โดยที่ยังมีคุณสมบัติของ class ที่ถูกสืบทอดเดิมทั้งหมด
2. อาจจะมีการเรียก Class ที่สืบทอดคุณสมบัติของอีก Class ว่า **child class** หรือ **sub class**
3. อาจจะมีการเรียก Class ถูกสืบทอด ว่า **parent class** หรือ **super class**

ให้เราทำการสร้างไฟล์ `model/StrawHatShip.cs`

```cs
// model/StrawHatShip.cs

namespace pirateShipManagement.model
{
    // คลาส StrawHatShip ที่สืบทอดคุณสมบัติจากคลาส PirateShip และ implements interface ชื่อ ITreasureMapHolder
    // การสืบทอดจะทำให้ StrawHatShip มีคุณสมบัติที่ PirateShip มีทั้งหมด และมีคุณสมบัติของ ITreasureMapHolder ด้วย
    public class StrawHatShip : PirateShip, ITreasureMapHolder
    {
        public string SpecialFeature { get; set; }

        public void DisplayMap()
        {
            Console.WriteLine("Showing the map to One Piece treasure!");
        }
    }   


}
```