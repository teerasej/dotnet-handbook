# Exception ใน Controller

1. ทดสอบแก้ไข route `[HttpGet("topics/{userID}")]` ใน ChatHistory Controller

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

        [HttpGet("histories/{userID}/topics")]
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {   
            // จงใจให้ userID มีค่าเป็น null เพื่อทดสอบ Exception Handling
            userID = null;

            // ทดสอบเช็คว่าถ้า userID เป็น null ให้ throw ArgumentNullException
            if (string.IsNullOrEmpty(userID))
            {
                throw new ArgumentNullException(nameof(userID), "User ID cannot be null or empty");
            }

            return Ok(new { userId = userID });
        }
    }
}
```

2. บันทึกไฟล์ 
3. ทดสอบรัน API ด้วยคำสั่ง `dotnet run` และใช้ Swagger ในการทดสอบส่ง request ไปที่ `https://localhost:5001/api/chat/topics/1234` ดูว่า API ทำงานได้ถูกต้องหรือไม่
4. ถ้าทำงานอย่างที่ควรจะเป็น จะเห็น Server response ด้วยข้อมูลประมาณด้านล่าง 

- Status Code: 500 Internal Server Error
```bash
System.ArgumentNullException: User ID cannot be null or empty (Parameter 'userID')
   at ChatHistoryAPI.ChatHistory.GetTopicsByUserID(String userID) in /Users/teerasej/Desktop/dotnet lab/ChatHistoryAPI/Controllers/ChatHistory.cs:line 26
   at lambda_method4(Closure, Object, Object[])
```

5. เสร็จแล้วให้ทำการแก้ไขโค้ดให้กับเป็นตามเดิม และบันทึกไฟล์

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

        [HttpGet("topics/{userID}")]
        public IActionResult GetTopicsByUserID([FromRoute] string userID)
        {   
            return Ok(new { userId = userID });
        }
    }
}
```

> end