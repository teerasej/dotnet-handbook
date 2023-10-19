
# ปรับให้ใช้ Completion AI เพื่อให้ระบบสร้างคำตอบให้เรา

## 1. ปรับใช้ Completion AI ของ OpenAI

ปรับแก้โค้ดใน Program.cs ให้เป็นดังนี้

```csharp
// Program.cs

// See https://aka.ms/new-console-template for more information
using AIPackageAdvice.models;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Connectors.AI.OpenAI;

var apiKey = "<api-key>";

// เขียนคำสั่งรับข้อความจาก console แล้วแสดงผลออกมา
Console.WriteLine("Enter your message:");
var input = Console.ReadLine();
Console.WriteLine($"Message: {input}");

Console.WriteLine("Generating...");

// สร้าง KernelBuilder ขึ้นมา
var builder = new KernelBuilder();

// ตั้งค่าการใช้งาน completion API ของ OpenAI ขึ้นมา โดยการกำหนด model ที่ใช้งาน
builder.WithOpenAITextCompletionService("text-davinci-003", apiKey);
var kernel = builder.Build();
```

## 2. ปรับให้ระบบเรียกใช้ข้อมูลใน Database ด้วย Entity Framework

เพิ่มเติมโค้ดไฟล์ Program.cs ให้เป็นดังนี้ และทดสอบรันโปรแกรมโดยใช้คำสั่ง `dotnet run`


```csharp
using AIPackageAdvice.models;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Connectors.AI.OpenAI;

var apiKey = "<api-key>";


Console.WriteLine("Enter your message:");
var input = Console.ReadLine();
Console.WriteLine($"Message: {input}");

Console.WriteLine("Generating...");


var builder = new KernelBuilder();

builder.WithOpenAITextCompletionService("text-davinci-003", apiKey);
var kernel = builder.Build();

// สร้างตัวเชื่อมต่อ Database ด้วย Entity Framework
using var dbContext = new HealthCheckUpDbContext();

// ดึงข้อมูลแพ็คเกจตรวจสุขภาพทั้งหมดจาก database
var packages = dbContext.HealthCheckUpPackages.ToList();

// สร้างข้อความที่มีข้อมูลของ package ทั้งหมด โดยใช้ข้อมูลจาก database
var packageInfo = "";

foreach (var package in packages)
{
    packageInfo += $"ID: {package.Id}\n";
    packageInfo += $"Name: {package.Name}\n";
    packageInfo += $"Price: {package.Price}\n";
    packageInfo += $"Age: {package.BestForAgeLength}\n";
    packageInfo += $"Gender: {package.BestForGender}\n";
    packageInfo += $"Description: {package.ShortDescriptionThai}\n";
}

packageInfo += "";

Console.WriteLine(packageInfo);
```

## 3. 

```csharp
using AIPackageAdvice.models;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Connectors.AI.OpenAI;

var apiKey = "<api-key>";


Console.WriteLine("Enter your message:");
var input = Console.ReadLine();
Console.WriteLine($"Message: {input}");

Console.WriteLine("Generating...");


var builder = new KernelBuilder();

builder.WithOpenAITextCompletionService("text-davinci-003", apiKey);
var kernel = builder.Build();


using var dbContext = new HealthCheckUpDbContext();
var packages = dbContext.HealthCheckUpPackages.ToList();
var packageInfo = "";

foreach (var package in packages)
{
    packageInfo += $"ID: {package.Id}\n";
    packageInfo += $"Name: {package.Name}\n";
    packageInfo += $"Price: {package.Price}\n";
    packageInfo += $"Age: {package.BestForAgeLength}\n";
    packageInfo += $"Gender: {package.BestForGender}\n";
    packageInfo += $"Description: {package.ShortDescriptionThai}\n";
}

packageInfo += "";

// Console.WriteLine(packageInfo);

// สร้าง prompt ขึ้นมา โดยกำหนดให้ AI ช่วยวิเคราะห์ข้อความ และมีการใช้งานตัวแปร $input ใน prompt
var prompt = @$"
Give Advice about the health check-up packages in context for user who prompt input:
{input}

Condition:
- try to suggest to best package for user's prompt which relate to price, age, gender and package's description
- tell only package information
- price in dollar

Context (health check-up packages):
{packageInfo}

Output:
- answer in Thai
";

// นำ prompt มาสร้างเป็นฟังก์ชัน เพื่อให้เรียกใช้งานได้โดยง่าย
var healthAdviceFunction = kernel.CreateSemanticFunction(
    prompt, 
    // กำหนดค่าการทำงานของ AI โดยกำหนดให้ AI สร้างคำตอบที่มีความยาวไม่เกิน 1500 ตัวอักษร
    requestSettings: new OpenAIRequestSettings()
    {
        MaxTokens = 2000,
        Temperature = 0.2,
        TopP = 1,
        FrequencyPenalty = 0.1,
        PresencePenalty = 0.1
    }
);

// ส่งข้อความที่ต้องการวิเคราะห์ไปยังฟังก์ชัน และรอรับผลลัพธ์
var result = await healthAdviceFunction.InvokeAsync(input, kernel);

// 
Console.WriteLine("Done.");
Console.WriteLine(result);

```