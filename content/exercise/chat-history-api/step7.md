
# สร้าง DbContext class สำหรับเชื่อมต่อกับฐานข้อมูล

1. สร้างไฟล์ `Models/ChatAppContext.cs` ในโฟลเดอร์ `ChatHistoryAPI` และเขียนโค้ดดังนี้:

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ChatHistoryAPI.Models
{
    public class ChatAppContext : DbContext
    {
        // สร้าง Constructor สำหรับรับ DbContextOptions มาจาก ไฟล์ Program.cs 
        public ChatAppContext(DbContextOptions<ChatAppContext> options) : base(options) { }

        // สร้าง DbSet สำหรับ Topic Model
        public DbSet<Topic> Topics { get; set; }

        // สร้าง DbSet สำหรับ Message Model
        public DbSet<Message> Messages { get; set; }
    }
}
```

> หมายเหตุ: ใน Class `ChatAppContext` เราใช้ `DbSet<Topic>` และ `DbSet<Message>` ในการสร้าง section ของข้อมูลที่ Entity Framework ต้องทำงานด้วย สำหรับ Topic Model และ Message Model ตามลำดับ

