@isTest
public class TemperatureConverterTest {

     @istest static void testWarmTemp()
     {
         Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
         System.assertEquals(21.11,celsius);
     }
    
    @istest static void testfreezingpoint()
    {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0,celsius);
    }

    @istest static void testboilingPoint()
    {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
        System.assertEquals(100,celsius,'Boiling point temp is not expected.');
        
    }
}