
# เรียกใช้งาน DbContext สำหรับการ insert

ในขั้นตอนนี้เราจะเริ่มเขียนโค้ดสำหรับการ insert ข้อมูลลงในฐานข้อมูล โดยใช้ DbContext ที่เราได้สร้างไว้ในขั้นตอนก่อนหน้านี้

1. เปิดไฟล์ `Controllers/ChatHistory.cs` และเขียนโค้ดดังนี้:

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ChatHistoryAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace ChatHistoryAPI
{
    [ApiController]
    [Route("api/chat")]
    public class ChatHistory : ControllerBase
    {
        private readonly ChatAppContext _context;

        public ChatHistory(ChatAppContext context)
        {
            _context = context;
        }

        [HttpPost("histories")]

        // กำหนดให้ API รับข้อมูล JSON จาก Body ของ Request และเปลี่ยนเป็น Topic Model ด้วย [FromBody] Attribute ซึ่งเป็น data annotation ของ ASP.NET Core
        // และใช้ async Task<IActionResult> ในการระบุว่าเป็น Method ที่ return ข้อมูลแบบ Asynchronous
        public async Task<IActionResult> SaveChatHistory([FromBody] Topic topic)
        {
            // ใช้ DbContext ในการเพิ่มข้อมูลลงในฐานข้อมูล ด้วยการเรียกใช้ Add Method ของ DbSet ที่เราได้สร้างไว้ใน ChatAppContext
            _context.Topics.Add(topic);

            // ใช้ DbContext ในการบันทึกข้อมูลลงในฐานข้อมูล ด้วยการเรียกใช้ SaveChanges Method ของ DbContext
            await _context.SaveChangesAsync();

            // ส่งข้อมูล topicID และ userID กลับไปให้ Client ว่าข้อมูลถูกบันทึกเรียบร้อยแล้ว
            return Ok(new { topicID = topic.Id, userID = topic.UserID });
        }

        [HttpGet("topics/{userID}")]
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {   
            return Ok(new { userId = userID });
        }
    }
}
```

2. บันทึกไฟล์
3. ทดสอบรัน Web API ด้วยคำสั่ง `dotnet run` 
4. เข้าไปที่ Swagger และลองใส่ข้อมูลเพื่อทดสอบการ insert ข้อมูลลงในฐานข้อมูล


```json
{
  "Name": "Topic Name",
  "UserID": "User1",
  "Messages": [
    {
      "Sender": "User2",
      "Content": "Hello, this is the first message",
      "Timestamp": "2022-01-01T00:00:00"
    },
    {
      "Sender": "User3",
      "Content": "Hello, this is the second message",
      "Timestamp": "2022-01-01T01:00:00"
    }
  ]
}
```

5. ถ้าการ insert ข้อมูลถูกต้อง จะมีข้อความแสดงขึ้นมาว่า `200 OK` และข้อมูลจะถูกบันทึกลงในฐานข้อมูล