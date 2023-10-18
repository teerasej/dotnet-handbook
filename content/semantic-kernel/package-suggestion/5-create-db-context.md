
# สร้างตัวเชื่อมต่อ Database ด้วย Entity Framework

สร้างไฟล์ `model/HealthCheckUpDbContext.cs`

```cs
// model/HealthCheckUpDbContext.cs

using Microsoft.EntityFrameworkCore;

namespace AIPackageAdvice.models
{

    public class HealthCheckUpDbContext : DbContext
    {
        private const string connectionString = "<YourConnectionString>";

        // HealthCheckUpPackages เป็น DbSet ของ HealthCheckUpPackage ซึ่งเป็น entity class ที่ใช้เก็บข้อมูลของแพ็คเกจตรวจสุขภา
        public DbSet<HealthCheckUpPackage> HealthCheckUpPackages { get; set; }

        // ใน method OnConfiguring มีการกำหนดให้ optionsBuilder ใช้ UseSqlServer เพื่อกำหนดให้ Entity Framework Core ใช้ SQL Server เป็น database provider 
        // และใช้ connection string ที่กำหนดไว้ใน constructor ของคลาสนี้เป็น connection string ของ database ที่ใช้เก็บข้อมูลของแพ็คเกจตรวจสุขภาพ
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // Replace 'YourConnectionString' with your Azure SQL Database connection string
            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}
```

## Connection String 

ไว้ใช้ชั่วคราวเท่านั้น

```bash
Server=tcp:nextflow-thaigl-server.database.windows.net,1433;Initial Catalog=productDB;Persist Security Info=False;User ID=nextflowSuperAdmin;Password=JUF6r7-8wJgXup;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
```