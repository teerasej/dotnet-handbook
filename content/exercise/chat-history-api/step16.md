
# ลองเขียน Test

ในที่นี้เราจะลองเขียน Test โดยการใช้

## 3 แนวคิดหลักของการเขียน Test

การเขียน test นั้น เป้าหมายสูงสุด ก็เพื่อให้แน่ใจว่า 

> ในขณะที่เราทำการเปลี่ยนแปลงโค้ด โปรแกรม, refactor โค้ด และเพิ่ม feature ใหม่ ๆ ลงไป โปรแกรมของเรายังคงทำงานได้ตามที่เราต้องการ โดยไม่ทำให้เกิด side effect กับ feature อื่น ๆ ที่เราเคยทำไว้แล้ว

มีแนวคิดหลัก 3 ข้อ ที่เราจะต้องคำนึงถึงเมื่อเราจะเขียน Test คือ

1. **Arrange** - จัดเตรียมข้อมูลที่จำเป็นสำหรับการทดสอบ
2. **Act** - ทำการเรียกใช้งาน Method ที่เราต้องการทดสอบ
3. **Assert** - ตรวจสอบผลลัพธ์ว่าตรงตามที่เราคาดหวังหรือไม่

## ตัวอย่างการเขียน Test

1. เริ่มแรกเราจะลองสร้างไฟล์ใหม่ลงไปในโปรเจค Web API โดยตั้งชื่อไฟล์ว่า `Calculator.cs`

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChatHistoryAPI
{
    public class Calculator
    {
        public int Add(int a, int b)
        {
            return a + b;
        }
    }
}
```

2. เสร็จแล้วสั่ง build Solution ใหม่ เพื่อให้ Test Project สามารถนำไฟล์นี้ไปใช้ได้
3. เป้าหมายของเราคือ การทดสอบ Method `Add` ใน class `Calculator ที่ไม่ว่ายังไง การใส่ค่า parameter 2 ค่าเข้าไป ก็จะทำให้ได้ผลลัพธ์เป็นผลบวกของ 2 ค่านั้น **ไม่อย่างนั้นคือว่าไม่ผ่าน**
4. กลับมาที่โปรเจค `ChatHistoryAPI.Tests` และสร้างไฟล์ `CalculatorTest.cs` ขึ้นมา โดยการคลิกขวาตามภาพ 

> การใช้เมนู vscode แบบนี้ ต้องเปิดหน้าต่างแยกโปรเจคต่างหากขึ้นมา ไม่งั้นจะไม่มีการสร้างไฟล์นะ 

<img width="781" alt="2024-05-11_15-53-19" src="https://github.com/teerasej/dotnet-handbook/assets/85179/11c4e448-ed86-425d-871e-eff10f7533e5">

5. จะได้ไฟล์มาแบบนี้

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace ChatHistoryAPI.Tests
{
    public class CalculatorTest
    {
        [Fact]
        public void Test1()
        {
            Assert.True(true);
        }
    }
}
```

- `Assert` คือ method ที่ใช้ในการตรวจสอบผลลัพธ์ว่าตรงตามที่เราคาดหวังหรือไม่ มี method ให้เรียกใช้ตรวจเทียบค่า หลากหลายแบบ อย่างเช่น `Assert.True`, `Assert.False`, `Assert.Equal` และอื่น ๆ อีกมากมาย

6. ลองเขียน Test ในไฟล์นี้ โดยเราจะทดสอบว่า Method `Add` ใน class `Calculator`

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ChatHistoryAPI;

namespace ChatHistoryAPITests
{
    public class CalculatorTests
    {

        // เรียกใช้งาน Calculator ที่เราจะทดสอบ
        private readonly Calculator _calculator;

        // กำหนดค่าให้ _calculator ใน Constructor โดยเราจะสร้าง instance ของ Calculator ขึ้นมาใหม่ทุกครั้งก่อนทดสอบ
        public CalculatorTests()
        {
            _calculator = new Calculator();
        }
        
        // ทดสอบว่า Method Add ทำงานถูกต้องหรือไม่
        [Fact]
        public void Add_ReturnsCorrectSum()
        {
            // Arrange
            int a = 5;
            int b = 7;

            // Act
            int result = _calculator.Add(a, b);

            // Assert
            Assert.Equal(12, result);
        }
    }
}
```

7. เสร็จแล้วทดสอบ build Test project หรือ Solution ใหม่ และรัน Test ด้วย .NET Test Explorer เพื่อดูผลลัพธ์
8. ทดสอบปรับการทำงานใน Method `Add` ใน class `Calculator` แล้วรัน Test อีกครั้ง จะเห็นว่า Test ที่เราเขียนไว้ จะทำการตรวจสอบว่า Method `Add` ทำงานถูกต้องหรือไม่ และจะแจ้งเตือนเราว่ามีการเปลี่ยนแปลงที่ทำให้ Test ไม่ผ่าน
