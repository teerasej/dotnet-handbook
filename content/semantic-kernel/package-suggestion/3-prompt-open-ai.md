
# สร้างกลไกการ prompt กับ OpenAI service

แก้ไขไฟล์ Program.cs ให้เป็นดังนี้

```cs
// Program.cs

using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Orchestration;


// นำ Apikey ที่ได้จาก OpenAI มาใส่ไว้ในโปรเจค
var apiKey = "<api-key>";

// เขียนคำสั่งรับข้อความจาก console แล้วแสดงผลออกมา
Console.WriteLine("Enter your message:");
var input = Console.ReadLine();
Console.WriteLine($"Message: {input}");

// สร้าง KernelBuilder ขึ้นมา
var builder = new KernelBuilder();

// ตั้งค่าการใช้งาน completion API ของ OpenAI ขึ้นมา 
// โดยกำหนดชื่อ model โดยใช้ apikey ที่ได้จาก OpenAI
builder.WithOpenAIChatCompletionService("gpt-3.5-turbo",apiKey);

// สร้าง kernel ขึ้นมาจาก builder
var kernel = builder.Build();

// สร้าง prompt ขึ้นมา โดยกำหนดให้ AI ช่วยวิเคราะห์ข้อความ และมีการใช้งานตัวแปร $input ใน prompt 
var prompt = @"
which is sentiment from the following message, positive or negative?:
{{$input}}
";

// นำ prompt มาสร้างเป็นฟังก์ชัน เพื่อให้เรียกใช้งานได้โดยง่าย
var sentimentAnalyzeFunction = kernel.CreateSemanticFunction(prompt);

Console.WriteLine("Generating...");

// ส่งข้อความที่ต้องการวิเคราะห์ไปยังฟังก์ชัน และรอรับผลลัพธ์
var result = await sentimentAnalyzeFunction.InvokeAsync("I hate this product", kernel);
Console.WriteLine("Done.\n");

// แสดงผลลัพธ์ที่ได้จากการวิเคราะห์
Console.WriteLine(result);

```

จากนั้นทดสอบการทำงานโดยการรันโปรแกรม

```bash
dotnet run
``` 