
# สร้าง Test Project ใน Solution เดียวกันกับโปรเจค Web API

1. เปิด Visual Studio Code มาที่ directory **dotnet_lab** ที่เราสร้างขึ้นมาในขั้นตอนแรก
2. เปิดเมนู View > Command Palette 
3. เรียกใช้คำสั่ง .NET: New Project...

<img width="575" alt="2024-05-11_14-53-16" src="https://github.com/teerasej/dotnet-handbook/assets/85179/74a8d24f-e18d-465e-a10a-830e7852bcc8">


4. ทำการค้นหา template **Test** ในช่องค้นหา
5. เลือก **xUnit Test Project** 
6. ตั้งชื่อโปรเจคว่า **ChatHistoryApi.Tests**
7. เลือก **Default Directory**
8. เลือก **Create Project**
9. จะได้โปรเจค Test ที่สร้างขึ้นมาใหม่ มาอยู่ในโฟลเดอร์เดียวกันกับโปรเจค Web API ที่เราสร้างไว้แล้ว

<img width="406" alt="2024-05-11_15-12-55" src="https://github.com/teerasej/dotnet-handbook/assets/85179/76898706-b5f3-4c5b-b45c-62b03ef7b46a">

10. ให้เปิด Terminal ขึ้นมาที่ directory **dotnet_lab** (มีไฟล์ `.sln` อยู่) และทดสอบรันคำสั่ง 

```bash
dotnet build
```

11. จะเห็นว่าโปรเจค Test ที่เราสร้างขึ้นมาใหม่ จะถูก build ไปกับโปรเจค Web API ที่เราสร้างไว้แล้วด้วย

```bash
MSBuild version 17.8.3+195e7f5a3 for .NET
  Determining projects to restore...
  All projects are up-to-date for restore.
  
  ChatHistoryAPI -> /Users/teerasej/Desktop/dotnet lab/ChatHistoryAPI/bin/Debug/net8.0/ChatHistoryAPI.dll
  
  ChatHistoryAPI.Tests -> /Users/teerasej/Desktop/dotnet lab/ChatHistoryAPI.Tests/bin/Debug/net8.0/ChatHistoryAPI.Tests.dll
```


