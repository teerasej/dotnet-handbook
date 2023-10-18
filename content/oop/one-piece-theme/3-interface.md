
## การสร้าง Interface

1. Interfaces กำหนดกฎและรูปแบบ **ที่เราต้องการให้ Class หนึงต้องมี**
2. มีได้แค่รูปแบบของ method แต่ไม่อนุญาตให้เขียนตัว method

ให้เราทำการสร้างไฟล์ `model/ITreasureMapHolder.cs`

```cs
// model/ITreasureMapHolder.cs

namespace pirateShipManagement.model
{
    // สร้าง interface ชื่อ ITreasureMapHolder ซึ่งมีเมทอดชื่อ DisplayMap เป็นตัวแทนของต้นหน
    public interface ITreasureMapHolder
    {
        void DisplayMap();
    }


}
```



