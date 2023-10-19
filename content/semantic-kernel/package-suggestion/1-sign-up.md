
# สมัครใช้งาน platform.openai.com

1. [สมัครใช้งาน OpenAI Developer](https://platform.openai.com/signup)
   - สามารถสร้าง account ใหม่ โดยการใช้ Google Account หรือ Microsoft Account ได้ 
   - จะมีการกรอกเบอร์โทรศัพท์ และรับ SMS-OTP เพื่อยืนยันตัวตน

2. หลังจากได้ account และ login เข้าไปใน Dashboard ได้แล้ว ให้[เข้าไปสร้าง OpenAI API Key ขึ้นมา และ copy มาเตรียมใช้งาน](https://platform.openai.com/account/api-keys) 

> อย่าลืมเช็คปริมาณการใช้งานของ account เราได้ที่ [Dashboard](https://platform.openai.com/account/usage) ด้วยนะครับ

## ทดสอบ Completion API 

จาก Dashboard > Playground > จากเมนูด้านขวา และกำหนดค่าดังนี้

- API: `Completion`
- model: `text-davinci-002` หรือใหม่กว่า
  
ทดสอบใส่ prompt ด้านล่าง

```
Summarize and suggest the health check-up packages for user who prompt input:
แพคเกจสำหรับผู้หญิงมีแพคเกจไหนบ้าง

Condition:
- try to suggest to best package for user's prompt which relate to price, age, gender and package's description
- tell only package information
- price in dollar

Context:

ID: 1
Name: Basic Package
Price: 99.99
Age: 18-65
Gender: Male
Description: ชุดตรวจสุขภาพพื้นฐานสำหรับผู้ชาย


ID: 2
Name: Standard Package
Price: 149.99
Age: 18-65
Gender: Female
Description: ชุดตรวจสุขภาพมาตรฐานสำหรับผู้หญิง


ID: 3
Name: Comprehensive Package
Price: 199.99
Age: 18-65
Gender: Any
Description: ชุดตรวจสุขภาพครอบคลุมสำหรับทุกเพศ


ID: 4
Name: Senior Package
Price: 129.99
Age: 65+
Gender: Any
Description: ชุดตรวจสุขภาพสำหรับผู้สูงอายุ


ID: 5
Name: Child Package
Price: 79.99
Age: 0-17
Gender: Any
Description: ชุดตรวจสุขภาพสำหรับเด็ก


ID: 6
Name: Executive Package
Price: 249.99
Age: 18-65
Gender: Any
Description: ชุดตรวจสุขภาพสำหรับผู้บริหาร


Output:
- answer in Thai

```