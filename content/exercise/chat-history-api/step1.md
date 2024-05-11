# 1. สร้าง ASP.NET Core Web API โปรเจคใหม่

เพื่อติดตั้งโปรเจค ASP.NET Core Web API ใหม่ ทำตามขั้นตอนเหล่านี้:

1. สร้าง directory ชื่อ `dotnetLab` จากนั้นเปิด Visual Studio Code ที่ directory นี้ และป้อนคำสั่งต่อไปนี้ใน terminal:

```bash
dotnet new webapi -n ChatHistoryAPI
```

> directory นี้สำคัญมาก เพราะนอกจากจะเป็น directory ที่เก็บโปรเจค Web API ของเราแล้ว ยังเป็น directory ที่เราจะใช้เก็บโปรเจคสำหรับทำ Test ด้วย

2. เสร็จเรียบร้อยแล้วเปิดโฟลเดอร์โปรเจคขึ้นมาใน Visual Studio Code
3. เปิดไฟล์ `.csproj` และแก้ไขค่าด้านล่าง จาก `true` ให้เป็น `false`

จาก
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    ...
    <InvariantGlobalization>true</InvariantGlobalization>
  </PropertyGroup>

  ...
</Project>

```
เป็น
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    ...
    <InvariantGlobalization>false</InvariantGlobalization>
  </PropertyGroup>

  ...
</Project>

```
4. รันคำสั่งด้านล่าง เพื่อรัน Web API

```bash
dotnet run
```

ตัวอย่างข้อความที่ได้จากการรันคำสั่งด้านบน

```bash
info: Microsoft.Hosting.Lifetime[14]
      Now listening on: http://localhost:5035
```

1. เปิด swagger โดยใช้ URL ตัวอย่างด้านล่าง (อย่าลืมสังเกต เลข port ของ Web server ที่รันอยู่ใน terminal) 

```
https://localhost:5001/swagger
```

4. กลับมาที่ Terminal ใน Visual Studio Code และกด `Ctrl + C` เพื่อหยุดการรัน Web API ที่กำลังทำงานอยู่  
5. เปิดไฟล์​ `Program.cs`
6. แทนที่โค้ดใน `Program.cs` ด้วยโค้ดด้านล่าง และบันทึกไฟล์

```csharp
var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();


app.Run();
```

7. ทดสอบรัน Web API อีกครั้ง โดยใช้คำสั่ง `dotnet run` และเปิด swagger อีกครั้ง
8. ตรวจสอบว่า Web API ทำงานได้ถูกต้องหรือไม่ โดยใช้ swagger 

> end