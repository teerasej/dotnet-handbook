
# สร้าง Route GET request สำหรับการดึงข้อมูลของ Chat history จาก UserID


1. สร้าง route URL เพิ่ม ใน ChatHistory Controller

```csharp
// Controllers/ChatHistory.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace ChatHistoryAPI
{
    [ApiController]
    [Route("api/chat")]
    public class ChatHistory : ControllerBase
    {
        [HttpPost("histories")]
        public async Task<IActionResult> SaveChatHistory()
        {
            return Ok();
        }

        // สร้าง Route สำหรับ API นี้ โดยใช้ annotation HttpGet และระบุ URL ว่า /topics/{userID} เพื่อให้ Web API สามารถดึงส่วนที่กำหนดไว้ใน {} มาใช้งานได้
        [HttpGet("topics/{userID}")]

        // สร้าง method สำหรับการดึงข้อมูลของ Chat history จาก UserID โดยรับค่า userID ผ่าน parameter ของ method และใช้ [FromRoute] annotation เพื่อระบุว่าค่านี้มาจาก Route URL
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {
            return Ok(new { userId = userID });
        }
    }
}
```

2. บันทึกไฟล์ 
3. ทดสอบรัน API ด้วยคำสั่ง `dotnet run` และใช้ Swagger ในการทดสอบส่ง request ไปที่ `https://localhost:5001/api/chat/topics/1234` ดูว่า API ทำงานได้ถูกต้องหรือไม่

> end