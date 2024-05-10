# Chat History API

This guide will walk you through the steps to create a web API that can save chat data as JSON using a POST request and retrieve chat history based on a user ID.

## Part 1: The Controller & Route API

1. [สร้าง ASP.NET Core Web API โปรเจคใหม่](/content/exercise/chat-history-api/step1.md)
2. [สร้าง Controller เพื่อจัดการ Route POST request ของ API](/content/exercise/chat-history-api/step2.md)
3. [สร้าง Route GET request สำหรับการดึงข้อมูลของ Chat history จาก UserID](/content/exercise/chat-history-api/step3.md)



2. Create a `ChatMessage` model class with properties for `UserId`, `Message`, and `Timestamp`.
3. Implement a `ChatController` with the following actions:
    - `PostChatMessage`: Accepts a JSON payload with `UserId` and `Message` properties, creates a new `ChatMessage` object, and saves it to a data store.
    - `GetChatHistory`: Accepts a `UserId` parameter and retrieves all chat messages associated with that user.
4. Configure routing in `Startup.cs` to map the appropriate routes to the `ChatController` actions.
5. Test the API using a tool like Postman or cURL to send a POST request to save a chat message and a GET request to retrieve chat history for a specific user.

That's it! You've successfully created a web API for saving chat data and retrieving chat history based on a user ID.

Remember to implement the necessary data storage and error handling based on your specific requirements.

Happy coding!