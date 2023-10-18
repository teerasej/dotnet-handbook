
# สร้างโปรเจคใหม่ C#.NET console 

## 1. สร้างโปรเจคใหม่ โดยใช้คำสั่ง 

```bash
dotnet new console -n AIPackageAdvice
```

## 2. ติดตั้ง package 

เปิด Terminal มาที่โฟลเดอร์โปรเจค แล้วใช้คำสั่งด้านล่าง [เพื่อติดตั้ง Entity Framework](https://www.nuget.org/packages/Microsoft.SemanticKernel.Core/)

```bash
dotnet add package Microsoft.SemanticKernel --version 1.0.0-beta2
```

และ [Entity Framework Core](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.SqlServer/) ด้วยคำสั่ง

```bash
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 7.0.12
```

และ [XUnit](https://www.nuget.org/packages/xunit) ด้วยคำสั่ง

```bash
dotnet add package xunit --version 2.5.3
```

