
# ทดสอบรัน Test ด้วย .NET Test Explorer

ในที่นี้เราจะใช้ .NET Test Explorer ในการรัน Test ของโปรเจค Test ที่เราสร้างขึ้นมาใหม่

## 1. Build Solution 

1. คลิกขวาที่ไฟล์ **.sln** ของโปรเจค (เช่นในที่นี้คือ** dotnet_lab.sln**)
2. เลือกคำสั่ง Build .NET Core Project
3. จะมีการรันคำสั่ง build project ทั้งหมดใน solution

วิธีนี้จะทำให้ .NET Test Explorer สามารถเห็น และรัน Test ได้

## 2. รัน Test ด้วย .NET Test Explorer

1. เปิด .NET Test Explorer จาก Tab รูปขวดทดลองที่อยู่ด้านข้าง 
2. จะเห็น Test ทั้งหมดที่เราได้จากการ build ครั้งล่าสุด 
3. ให้เปรียบเทียบกับ UnitTest1.cs ถึงโครงสร้างของ Test ที่เราสร้างขึ้นมาใหม่
4. กดปุ่ม run test เพื่อทดสอบ
5. จะเห็นผลลัพธ์ของการรัน Test ทั้งหมด (ซึ่งมีอันเดียวแหละ) ว่าผ่านฉลุย
   
<img width="919" alt="2024-05-11_15-41-13" src="https://github.com/teerasej/dotnet-handbook/assets/85179/b96f5759-95cc-442e-b25d-2dcac85765f4">
