
# โหลด DbContext มาใช้งานใน Controller

ในขั้นตอนนี้เราจะเริ่มต้นใช้งาน DbContext ใน Controller ของเรา โดยการเรียกใช้งาน DbContext ผ่าน Dependency Injection ที่เราได้กำหนดไว้ในขั้นตอนก่อนหน้านี้

เราจะทำการเปิดไฟล์ `Controllers/ChatHistory.cs` และเพิ่ม Constructor สำหรับรับ DbContext มาใช้งานใน Controller ดังนี้:

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
        // สร้าง Constructor สำหรับรับ DbContext มาใช้งานใน Controller
        private readonly ChatAppContext _context;

        public ChatHistory(ChatAppContext context)
        {
            // กำหนดค่า DbContext ที่ได้รับมาจาก builder (Program.cs) ให้กับตัวแปร _context
            _context = context;
        }

        [HttpPost("histories")]
        public async Task<IActionResult> SaveChatHistory()
        {
            return Ok();
        }

        [HttpGet("histories/{userID}/topics")]
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {   
            return Ok(new { userId = userID });
        }
    }
}
```