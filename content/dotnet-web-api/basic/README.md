
# การสร้างและใช้งาน ASP.NET Web API 

## 1. สร้างโปรเจค

1. สร้าง directory ชื่อว่า **WeatherForecast** 
2. เปิด Terminal ขึ้นมาใน directory และใช้คำสั่ง

```bash
dotnet new webapi
```

3. สำรวจดูส่วนประกอบของโปรเจค
   1. `Program.cs`
   2. `.csproj`
   3. `.json`
   4. `Weather`
4. 

## 2. ทดสอบใช้งาน Web API และ Swagger 

1. จากภายใน directory ของโปรเจค รันคำสั่ง 

```bash
dotnet run
```


2. เปิด Web browser ขึ้นมาที่ URL ที่แสดงใน Terminal เช่น

> สังเกตว่าเลข port ด้านหลังจะไม่เหมือนกัน ในการทำ exercise ให้ใช้ของเครื่องตัวเองเป็นหลักนะ

```bash
info: Microsoft.Hosting.Lifetime[14]
      Now listening on: http://localhost:5035
```

จะสังเกตว่าไม่สามารถเรียกหน้าเว็บขึ้นมาได้ ให้เราเติม URL ท้ายเข้าไปด้วย `/swagger/index.html`

เช่น

```bash
http://localhost:5299/swagger/index.html
```

3. จะเห็นหน้าเว็บ เพื่อทดสอบการใช้งาน Web API

## 3. ใช้งาน Swagger ในการทดสอบ Web API 

1. จากหน้าเว็บให้กดเปิด route ชื่อ `/weatherforecast` และกดปุ่ม **try it out**
<img width="1012" alt="2024-05-10_14-36-49" src="https://github.com/teerasej/dotnet-handbook/assets/85179/c107482e-b765-47a3-a298-fd07d8659733">

2. กดปุ่ม execute ที่ปรากฎขึ้นมา
<img width="596" alt="2024-05-10_14-37-49" src="https://github.com/teerasej/dotnet-handbook/assets/85179/0c4095b8-ee60-475a-8342-beecbce81ac2">

   
4. สังเกตผลลัพธ์ของ Response ที่ Web API ส่งกลับมาให้เว็บ Swagger
   - คำสั่ง curl และ URL ที่เว็บ swagger มีการส่ง request ไปหา Web API
   - JSON ที่ตอบกลับมาพร้อม HTTP Status Code
<img width="818" alt="2024-05-10_14-38-12" src="https://github.com/teerasej/dotnet-handbook/assets/85179/f6d60612-5ee9-4256-9221-f69ab9ffa208">


## 4. ทดสอบการ debug Web API


1. ให้ทำการวาง breakpoint ไว้ในไฟล์ดังต่อไปนี้ 


```c#
// Program.cs บรรทัดที่ 5 

builder.Services.AddControllers();
```
และ
```c#
// Program.cs บรรทัดที่ 34

app.MapGet("/weatherforecast", () =>
{
    var forecast =  Enumerable.Range(1, 5).Select(index =>
        new WeatherForecast
        (
            DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            Random.Shared.Next(-20, 55),
            summaries[Random.Shared.Next(summaries.Length)]
        ))
        .ToArray();
    return forecast; // วาง breakpoint ไว้ที่บรรทัดนี้
})
```
จะได้ดังภาพ

<img width="608" alt="2024-05-10_14-45-15" src="https://github.com/teerasej/dotnet-handbook/assets/85179/0c6b2870-4e77-4a7d-9fda-2fcffbba6ee9">

<img width="788" alt="2024-05-10_14-44-50" src="https://github.com/teerasej/dotnet-handbook/assets/85179/ae6d1755-5eef-47e1-9ac4-59ee514466d9">


2. ทดสอบรันโปรเจคเว็บแอพพลิเคชั่น [โดยอ้างอิงวิธีการ Debug โปรเจค](../../debugging/README.md)

3. ทดสอบการใช้งาน Web API ผ่านทาง Swagger ตามหัวข้อที่ 3

