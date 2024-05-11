
# เรียกใช้งาน DbContext สำหรับการ select

ในขั้นตอนนี้เราจะเริ่มเขียนโค้ดสำหรับการ query ข้อมูลจากฐานข้อมูล โดยใช้ DbContext ที่เราได้สร้างไว้ในขั้นตอนก่อนหน้านี้

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

        public async Task<IActionResult> SaveChatHistory([FromBody] Topic topic)
        {
            _context.Topics.Add(topic);

            await _context.SaveChangesAsync();

            return Ok(new { topicID = topic.Id, userID = topic.UserID });
        }

        [HttpGet("histories/{userID}/topics")]
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {   
            // ใช้ DbContext ในการ query ข้อมูลจากฐานข้อมูล ด้วยการเรียกใช้ DbSet ที่เราได้สร้างไว้ใน ChatAppContext
            var topics = await _context.Topics
                .Include(t => t.Messages)
                .Where(t => t.UserID == userID)
                .ToListAsync();

            return Ok(topics);
        }
    }
}
```

2. บันทึกไฟล์
3. ทดสอบรัน Web API ด้วยคำสั่ง `dotnet run` 
4. เข้าไปที่ Swagger และลองใส่ข้อมูลเพื่อทดสอบการ select ข้อมูลจากฐานข้อมูล โดยกำหนดชื่อ user จากขั้นตอนแรกลงไปใน URL เช่น

```
http://localhost:5035/api/chat/histories/User1/topics
```

> หมายเหตุ: อย่าลืม เปลี่ยนเลข port ของ server และชื่อ username ใน URL ให้สอดคล้องกัน ในตัวอย่าง URL ข้างต้น ชื่อ username คือ `User1`

5. ถ้าการทำงานถูกต้อง เราจะได้ข้อมูล topic ที่อิงกับ UserID ที่เราส่งเข้าไป กลับมาในรูปแบบ JSON รวมถึงข้อมูลของ Message ที่อยู่ใน Topic นั้นๆ ด้วย


## ไฟล์สมบูรณ์ของ `Controllers/ChatHistory.cs`

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

        public async Task<IActionResult> SaveChatHistory([FromBody] Topic topic)
        {
            _context.Topics.Add(topic);

            await _context.SaveChangesAsync();

            return Ok(new { topicID = topic.Id, userID = topic.UserID });
        }

        [HttpGet("topics/{userID}")]
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {   
            var topics = await _context.Topics
                .Include(t => t.Messages)
                .Where(t => t.UserID == userID)
                .ToListAsync();

            return Ok(topics);
        }
    }
}
```