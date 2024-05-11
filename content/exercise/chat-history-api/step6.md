
# สร้าง Model class สำหรับข้อมูล Chat history

## 1. สร้าง Model class สำหรับข้อมูล Chat Topic

สร้างไฟล์ `Models/Topics.cs` ในโฟลเดอร์ `ChatHistoryAPI` และเขียนโค้ดดังนี้:

```csharp
using System.ComponentModel.DataAnnotations;


namespace ChatHistoryAPI.Models
{
    public class Topic
    {
        // `[Key]` คือ Data Annotation ที่บอกว่า Property Id ของ Class นี้ เป็น Primary Key
        [Key]
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string UserID { get; set; }

        // สร้าง Navigation Property สำหรับการเชื่อมต่อกับ Message Model
        public ICollection<Message> Messages { get; set; } = new List<Message>();
    }
}
```

> หมายเหตุ: Entity Framework Core จะสร้างตารางใหม่ในฐานข้อมูล โดยใช้ชื่อของ Class นี้ และชื่อของ Property ของ Class นี้ ในกรณีนี้คือ `Topics` และ `Id`, `Name`, `UserID` และ `Messages` 
> ในโค้ดด้านบนเราใช้ `ICollection<Message>` และ `List<Message>()` ในการสร้าง Navigation Property สำหรับการเชื่อมต่อกับ Message Model ซึ่งจะถูกสร้างในขั้นตอนถัดไป

## 2. สร้าง Model class สำหรับข้อมูล Message ของ Topic

สร้างไฟล์ `Models/Messages.cs` ในโฟลเดอร์ `ChatHistoryAPI` และเขียนโค้ดดังนี้:

```csharp

using System.ComponentModel.DataAnnotations;

namespace ChatHistoryAPI.Models
{
    public class Message
    {
        [Key]
        public Guid Id { get; set; }

        public Guid? TopicId { get; set; }
        public string Sender { get; set; }
        public string Content { get; set; }
        public DateTime Timestamp { get; set; }


        public Topic? Topic { get; set; }
    }
}
```

> หมายเหตุ: ใน Class `Message` เราใช้ `Guid?` ในการประกาศ Property `TopicId` เพื่อบอกว่า Property นี้สามารถเป็น `null` ได้ และใช้ `DateTime` ในการประกาศ Property `Timestamp` สำหรับเก็บเวลาของข้อความ

> ตัว Entity Framework ใช้หลักการ Naming convention ในการสร้าง relationship ระหว่าง table ใน database โดยใช้ชื่อของ Navigation Property และ Primary Key ของตารางที่เชื่อมโยงกัน ในกรณีนี้คือ `Topic` และ `Id` และ `TopicId`