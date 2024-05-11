
# กำหนด Connection string ใน appsettings.json

1.  เพื่อให้ Entity Framework Core สามารถเชื่อมต่อกับฐานข้อมูลได้ จะต้องกำหนด Connection string ในไฟล์ `appsettings.Development.json` ของโปรเจค
   
2. ใน Visual Studio Code ให้เปิดไฟล์ `appsettings.Development.json` ที่อยู่ในโฟลเดอร์ `ChatHistoryAPI` และกำหนดค่าดังนี้:

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "ConnectionStrings": {
    "AZURE_SQL_CONNECTIONSTRING": "Server=tcp:nextflow-workshop-db-server.database.windows.net,1433;Initial Catalog=nextflow-api-chat-history;Persist Security Info=False;User ID=adminNextflowA;Password=RToebtJ6ghqfmM;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
}
```

3. บันทึกไฟล์ 