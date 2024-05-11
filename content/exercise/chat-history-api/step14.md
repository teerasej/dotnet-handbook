
# เพิ่ม Reference โปรเจค Web API ใน Test Project

ในที่นี้ test project ต้องมีการเรียกใช้งานโค้ดจากโปรเจค Web API ดังนั้นเราจำเป็นต้องเพิ่ม reference ของโปรเจค Web API ไปยัง Test Project ด้วย

> ส่วนนี้ทำได้ง่ายๆ ด้วย VSCode Extension ที่ชื่อ **[.NET Core Add Reference](https://marketplace.visualstudio.com/items?itemName=adrianwilczynski.add-reference)** ที่เราได้ติดตั้งไว้แล้ว

1. เปิด Visual Studio Code มาที่ directory **dotnet_lab** ที่เราสร้างขึ้นมาในขั้นตอนแรก
2. เปิดดูไฟล์ในโปรเจค Test ที่เราสร้างขึ้นมาใหม่ 
3. คลิกขวาที่ไฟล์ `ChatHistoryAPI.Tests.csproj`    
4. เลือก Add Reference

<img width="742" alt="2024-05-11_15-28-20" src="https://github.com/teerasej/dotnet-handbook/assets/85179/65df4c8c-b99d-4809-a541-e5bfc47828ef">

5. คลิกเลือกรายการของโปรเจคที่ต้องการ Add Reference เข้ามาในโปรเจค Test ในทีนี้คือ `ChatHistoryAPI` และกดปุ่ม OK ด้านขวา

<img width="754" alt="2024-05-10_19-24-06" src="https://github.com/teerasej/dotnet-handbook/assets/85179/d1f0af68-046b-4f90-af64-57cb743c1c38">

