
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

```bash
http://localhost:5299
```

จะสังเกตว่าไม่สามารถเรียกหน้าเว็บขึ้นมาได้ ให้เราเติม URL ท้ายเข้าไปด้วย `/swagger/index.html`

เช่น

```bash
http://localhost:5299/swagger/index.html
```

3. จะเห็นหน้าเว็บ เพื่อทดสอบการใช้งาน Web API 

## 3. ทดสอบการ debug Web API


1. ให้ทำการวาง breakpoint ไว้ในไฟล์ดังต่อไปนี้ 


```c#
// Program.cs บรรทัดที่ 5 

>>>> builder.Services.AddControllers();
```

```c#
// Controllers/WeatherForecastController.cs บรรทัดที่ 24

public IEnumerable<WeatherForecast> Get()
    {
 >>>>>   return Enumerable.Range(1, 5).Select(index => new WeatherForecast
        {
            Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            TemperatureC = Random.Shared.Next(-20, 55),
            Summary = Summaries[Random.Shared.Next(Summaries.Length)]
        })
        .ToArray();
    }
```

2. ทดสอบรันโปรเจคเว็บแอพพลิเคชั่น [โดยอ้างอิงวิธีการ Debug โปรเจค](../../debugging/README.md)

3. ทดสอบการใช้งาน Web API ผ่านทาง Swagger ตามหัวข้อที่ 2