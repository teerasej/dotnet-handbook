
# สร้าง Class Model สำหรับรับข้อมูลจาก database

สร้างไฟล์ `model/HealthCheckUpPackage.cs`

```cs
// model/HealthCheckUpPackage.cs

using System.ComponentModel.DataAnnotations;

namespace AIPackageAdvice.models
{
    public class HealthCheckUpPackage
    {
        public int Id { get; set; }
        
        // Attribute Required ใน C# ใช้เพื่อระบุว่าต้องมีการกำหนดค่าให้กับ property ของคลาส ถ้า property นั้นเป็น null หรือ empty string จะเกิดข้อผิดพลาดในขั้นตอน data validation 
        [Required]
        public string Name { get; set; }

        [Required]
        public decimal Price { get; set; }

        [Required]
        public string BestForAgeLength { get; set; }

        [Required]
        public string BestForGender { get; set; }

        public string ShortDescriptionThai { get; set; }
    }
}
```