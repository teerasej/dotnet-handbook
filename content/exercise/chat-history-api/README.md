# Chat History API

This guide will walk you through the steps to create a web API that can save chat data as JSON using a POST request and retrieve chat history based on a user ID.

## Part 1: The Controller & Route API

1. [สร้าง ASP.NET Core Web API โปรเจคใหม่](/content/exercise/chat-history-api/step1.md)
2. [สร้าง Controller เพื่อจัดการ Route POST request ของ API](/content/exercise/chat-history-api/step2.md)
3. [สร้าง Route GET request สำหรับการดึงข้อมูลของ Chat history จาก UserID](/content/exercise/chat-history-api/step3.md)
4. [Exception ใน Controller](/content/exercise/chat-history-api/step4.md)


## Part 2: Database & Entity Framework

ติดตั้ง Package ก่อน

```bash
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
```

1. [กำหนด Connection string ใน appsettings.json](/content/exercise/chat-history-api/step5.md)
2. [สร้าง Model class สำหรับข้อมูล Chat history](/content/exercise/chat-history-api/step6.md)
3. [สร้าง DbContext class สำหรับเชื่อมต่อกับฐานข้อมูล](/content/exercise/chat-history-api/step7.md)
4. [Setup DbContext ใช้งานใน Web API ผ่าน Builder](/content/exercise/chat-history-api/step8.md)
5. [โหลด DbContext มาใช้งานใน Controller](/content/exercise/chat-history-api/step9.md)
6. [เรียกใช้งาน DbContext สำหรับการ insert](/content/exercise/chat-history-api/step10.md)
7.  [เรียกใช้งาน DbContext สำหรับการ select](/content/exercise/chat-history-api/step11.md)
8.  [custom error message](/content/exercise/chat-history-api/step12.md)


## Part 3: Testing

1. [สร้าง Test Project ใน Solution เดียวกันกับโปรเจค Web API](/content/exercise/chat-history-api/step13.md)
2. [เพิ่ม Reference โปรเจค Web API ใน Test Project](/content/exercise/chat-history-api/step14.md)
3. [ทดสอบรัน Test ด้วย .NET Test Explorer](/content/exercise/chat-history-api/step15.md)
4. [ลองเขียน Test](/content/exercise/chat-history-api/step16.md)
5. [สร้าง Test Class สำหรับการทดสอบ Class ใน API](/content/exercise/chat-history-api/step17.md)

