
# สร้าง Test Class สำหรับการทดสอบ Class ใน API

1. สร้างคลาสทดสอบใหม่ชื่อ `TopicTest.cs`
2. ใน constructor, สร้าง Topic ใหม่
3. เขียน method ทดสอบชื่อ TopicProperties_ShouldGetAndSetCorrectly เพื่อทดสอบ getter และ setter ของคลาส Topic
4. ในเมธอดนี้, ตั้งค่า properties ของวัตถุ Topic แล้วตรวจสอบว่า properties ถูกตั้งค่าอย่างถูกต้อง
5. เขียน method ทดสอบชื่อ TopicMessages_ShouldInitializeAsEmptyList เพื่อทดสอบว่า property Messages ถูกสร้างขึ้นจริง และเป็น list ว่างๆ 
6. ในเมธอดนี้, ตรวจสอบว่า property Messages ไม่เป็น null และมีจำนวน 0

```csharp
using System;
using System.Linq;
using Xunit;
using ChatHistoryAPI.Models;

namespace ChatHistoryAPI.Tests
{
    public class TopicTest
    {
        private readonly Topic _topic;

        public TopicTest()
        {
            _topic = new Topic();
        }

        [Fact]
        public void TopicProperties_ShouldGetAndSetCorrectly()
        {
            // ในเมธอดนี้, ตั้งค่า properties ของวัตถุ Topic แล้วตรวจสอบว่า properties ถูกตั้งค่าอย่างถูกต้อง

            // Arrange
            var id = Guid.NewGuid();
            var name = "Test Topic";
            var userId = "Test User";

            // Act
            _topic.Id = id;
            _topic.Name = name;
            _topic.UserID = userId;

            // Assert
            Assert.Equal(id, _topic.Id);
            Assert.Equal(name, _topic.Name);
            Assert.Equal(userId, _topic.UserID);
        }

        [Fact]
        public void TopicMessages_ShouldInitializeAsEmptyList()
        {
            // Assert
            // ในเมธอดนี้, ตรวจสอบว่า property Messages ไม่เป็น null และมีจำนวน 0
            Assert.NotNull(_topic.Messages);
            Assert.Empty(_topic.Messages);
        }
    }
}
```

7. บันทึกไฟล์
8. สั่ง build Solution
9. รัน Test ด้วย .NET Test Explorer
10. ทดสอบผล