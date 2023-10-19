
# สร้างโปรเจค Unit Test

1. สร้างโปรเจค Unit test ไว้ในที่เดียวกับโปรเจคหลัก โดยใช้คำสั่ง

```bash
dotnet new xunit -n AIPackageAdvice.Tests
```

2. เพิ่ม reference ของโปรเจคหลักไปยังโปรเจค Unit test ด้วยคำสั่ง

```bash
dotnet add reference ../AIPackageAdvice/AIPackageAdvice.csproj
```

จะทำให้เราเห็น การเพิ่ม tag `ProjectReference` ในไฟล์ `AIPackageAdvice.Tests.csproj` ดังนี้

```xml
<Project Sdk="Microsoft.NET.Sdk">

    ... ข้อมูลอื่น ๆ ...

  <ItemGroup>
    <ProjectReference Include="..\AIPackageAdvice\AIPackageAdvice.csproj" />
  </ItemGroup>

</Project>
```

3. แก้ไขไฟล์ UnitTest1.cs ให้เป็นดังนี้

```cs
using AIPackageAdvice.models;
using Xunit;

namespace AIPackageAdvice.Tests;

public class UnitTest1
{
    [Fact]
    public void packageShouldNotNull()
    {
       var package = new HealthCheckUpPackage();
       Assert.NotNull(package);
    }

    [Fact]
    public void packageNameShouldNotNull()
    {
       var package = new HealthCheckUpPackage(){
              Name = "Test Package"
       };
       Assert.True(package.Name == "Test Package");
    }
}
```

4. เราจะสามารถรัน Unit Test ได้โดยใช้คำสั่งใน terminal 

```bash
dotnet test
```

5. หรือจะใช้ .NET Core Test Explorer 

<img width="528" alt="2023-10-18_23-37-34" src="https://github.com/microsoft/semantic-kernel/assets/85179/7d7f3e3e-acd5-43d1-a61f-6adc77e215ef">

> หากไม่มี .NET Core Test Explorer ให้ติดตั้งจาก [ลิงค์นี้](https://marketplace.visualstudio.com/items?itemName=formulahendry.dotnet-test-explorer)

> หากไม่พบ test unit หรือรันแล้วเกิด error จำนวน "Fact not found" ให้ลองปิด และเปิด Visual Studio Code ใหม่ 
