
# สร้าง Controller เพื่อจัดการ Route ของ API

ในขั้นตอนนี้เราจะสร้าง Controller ที่จะจัดการ Route ของ API ที่เราสร้างขึ้นในขั้นตอนก่อนหน้านี้

1. สร้างโฟลเดอร์ `Controllers` ไว้ในโปรเจค
2. จาก Visual Studio Code คลิกขวาในส่วนของ Explorer View > เลือก New C# > เลือก Api Controller สร้างไฟล์ใหม่ที่ชื่อว่า `ChatHistory.cs` ในโฟลเดอร์ `Controllers`

<img width="645" alt="2024-05-10_15-05-19" src="https://github.com/teerasej/dotnet-handbook/assets/85179/48bb9e62-157b-4c8b-a15d-e6de914efbee">


3. ในไฟล์ `ChatHistory.cs` ใหม่ที่สร้างขึ้นมา ให้เพิ่มโค้ดดังนี้:

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace ChatHistoryAPI
{   
    // ใช้ annotation ApiController เพื่อระบุว่าเป็น Controller ของ API
    [ApiController]

    // ใช้ annotation Route เพื่อระบุว่า API นี้จะใช้ Route URL อะไร
    [Route("api/chat")]
    public class ChatHistory : ControllerBase
    {

        // สร้าง Route สำหรับ API นี้ โดยใช้ annotation HttpPost และระบุ URL ว่า /histories
        [HttpPost("histories")]
        public async Task<IActionResult> SaveChatHistory()
        {
            // ส่ง response กลับไปว่า API ทำงานสำเร็จ
            return Ok();
        }

    }
}
```
4. บันทึกไฟล์ 
5. ทดสอบรัน API ด้วยคำสั่ง `dotnet run` และใช้ Swagger ในการทดสอบส่ง request ไปที่ `https://localhost:5001/api/chat/histories` ดูว่า API ทำงานได้ถูกต้องหรือไม่

> end
