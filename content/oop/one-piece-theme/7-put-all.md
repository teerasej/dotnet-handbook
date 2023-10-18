
# การใช้งานคลาสที่สร้างขึ้น

```cs
using pirateShipManagement.model;


StrawHatShip thousandSunny = new StrawHatShip
    {
        Flag = "Straw Hat",
        Captain = "Monkey D. Luffy",
        CrewSize = 10,
        SpecialFeature = "Soldier Dock System"
    };

    Console.WriteLine($"Ship's Flag: {thousandSunny.Flag}");
    Console.WriteLine($"Ship's Captain: {thousandSunny.Captain}");
    Console.WriteLine($"Ship's Crew Size: {thousandSunny.CrewSize}");
    Console.WriteLine($"Special Feature: {thousandSunny.SpecialFeature}");

    Console.WriteLine("\nLuffy: Show me the treasure map!");
    ShowMeTheMap(thousandSunny);

    OnePieceTreasure treasure = new OnePieceTreasure();
    Console.WriteLine("\nNami: Here's a hint about the One Piece treasure.");
    treasure.GiveHint();


```