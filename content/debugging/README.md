
# Debugging the program

## 1. วาง Breakpoint ตรงจุดที่ต้องการ

จากโค้ดโปรแกรม ให้คลิกด้านหน้าบรรทัดของโค้ดที่เป็น statement 
จะเป็นการวาง breakpoint ด้านหน้าบรรทัดที่ต้องการให้ process ของโปรแกรมหยุด เวลาที่มีการทำงานมาถึงโค้ดบรรทัดดังกล่าว

<img width="467" alt="2023-10-17_20-46-32" src="https://github.com/teerasej/flutter-handbook/assets/85179/2431b346-fa92-432d-ae2f-bcbd3a3b9154">


## 2. รันโปรเจคผ่านโปรแกรม Visual Studio Code 

จาก View Menu ด้านซ้าย ให้เลือก Run & Debug และกดปุ่ม Run & Debug

<img width="471" alt="2023-10-17_18-41-53" src="https://github.com/teerasej/flutter-handbook/assets/85179/147af289-c64c-4224-aaea-862058c2b6c1">

เลือกโปรไฟล์ของการรันที่ต้องการ

## 3. ใช้ Run & Debug View 

ใช้ส่วนประกอบของ Run & Debug View ในการตรวจสอบการทำงานของโปรแกรม

<img width="1534" alt="2023-10-17_20-50-41" src="https://github.com/teerasej/flutter-handbook/assets/85179/bb488e1c-cdf5-4218-8718-03f7e6c07432">

1. นำ cursor ชี้ที่ตัวแปร เพื่อแสดงหน้าต่างรายละเอียดของข้อมูล หรือ object ในตัวแปรปัจจุบัน
2. **Debug control** แถบควบคุมในการเริ่มการทำงานต่อ หรือข้ามบรรทัด
3. **Local variable** แสดงตัวแปรที่เกี่ยวข้องทั้งหมดใน scope ของการทำงานที่ breakpoint หยุดอยู่
4. **Watch** ใช้ในการเพิ่มชื่อตัวแปรที่สนใจเป็นพิเศษ 
5. **Breakpoints** ใช้ในการเปิด/ปิด จัดการ breakpoint ที่มีอยู่ทั้้งหมดในโปรเจค
6. **Terminel/Debug console** ใช้ในการแสดงข้อมูลการทำงานอื่นๆ 