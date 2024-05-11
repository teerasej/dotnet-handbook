
# โหลด DbContext ใช้งานใน Web API ผ่าน Builder

ในขั้นตอนนี้เราจะเริ่มต้นใช้งาน DbContext ใน Web API ของเรา โดยการเรียกใช้งาน DbContext ผ่าน Builder ที่เราได้กำหนดไว้ในขั้นตอนก่อนหน้านี้

 ในไฟล์ `Program.cs` เพิ่มโค้ดดังนี้:

```csharp
using System.Buffers;
using ChatHistoryAPI.Models;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// ทำการเพิ่ม DbContext ใน Web API ผ่าน Builder
builder.Services.AddDbContext<ChatAppContext>(options =>
    // ใช้งาน Connection String จาก appsettings.json สำหรับใช้งานกับ SqlServer
    options.UseSqlServer(builder.Configuration.GetConnectionString("AZURE_SQL_CONNECTIONSTRING"))
);

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();


app.MapControllers();

app.Run();


```