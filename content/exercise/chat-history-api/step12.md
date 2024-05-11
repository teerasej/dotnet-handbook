
# custom error message

ในกรณีที่เกิด exception เราสามารถกำหนด custom error message ให้กับ API ได้โดยการสร้าง class สำหรับเก็บ error message และส่งกลับไปให้ Client ได้

เปิดไฟล์ `ChatHistory.cs` และปรับปรุงโค้ดดังนี้

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ChatHistoryAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
            // ใช้ try catch ในการจับ exception ที่เกิดขึ้น และส่ง Server response กลับไปให้ Client ด้วย custom error message

            // กรณีที่ไม่มี exception ให้ส่งข้อมูลกลับไปให้ Client ด้วย status code 200
            try
            {
                if (ModelState.IsValid == false)
                {
                    return BadRequest(ModelState);
                }

                _context.Topics.Add(topic);
                await _context.SaveChangesAsync();

                return Ok(new { topicID = topic.Id, userID = topic.UserID });
            }
            catch (Exception ex)
            {
                // กรณีที่เกิด exception ให้ส่งข้อมูลกลับไปให้ Client ด้วย status code 500 และ custom error message
                return StatusCode(500, $"error in inserting topic. : {ex.Message}");
            }
        }

        [HttpGet("histories/{userID}/topics")]
        public async Task<IActionResult> GetTopicsByUserID([FromRoute] string userID)
        {
                // ทำแบบเดียวกันกับ route ด้านบน
                try
                {
                    var topics = await _context.Topics
                        .Include(t => t.Messages)
                        .Where(t => t.UserID == userID)
                        .ToListAsync();

                    return Ok(topics);
                }
                catch (Exception ex)
                {
                    // ทำแบบเดียวกันกับ route ด้านบน
                    return StatusCode(500, $"error in getting topic with UserID.: {ex.Message}");
                }
        }
    }
}
```
