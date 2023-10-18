
# การใช้งาน .NET CLI

[ดาวน์โหลด .NET SDK และ .NET CLI มาติดตั้งได้จากที่นี่](https://dotnet.microsoft.com/en-us/download)

## 1. การแสดงข้อมูลของ .NET SDK

รันคำสั่งด้านล่างใน terminal (Windows Terminal หรือ Terminal ใน MacOS) เพื่อแสดง version ของ

```bash
dotnet --version
```

## 2. การแสดงรายการของ .NET Template

รันคำสั่งด้านล่างใน terminal เพื่อแสดงรายการของ template โปรเจคทั้งหมดในเครื่อง

```bash
dotnet new --list
```

## 3. การโปรเจค .NET console

สร้าง directory ใหม่ และรันคำสั่งด้านล่างใน terminal เพื่อสร้างโปรเจค

```bash
dotnet new console
```

## 4. การ compile โปรเจค

จากภายใน directory ของโปรเจค รันคำสั่ง 

```bash
dotnet build 
```

## 5. การรันโค้ดโปรเจค

จากภายใน directory ของโปรเจค รันคำสั่ง 

```bash
dotnet run
```



