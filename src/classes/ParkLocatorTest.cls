@isTest
private class ParkLocatorTest
{
 @isTest static void testcallout()
 {
  Test.setMock(WebServiceMock.class, new ParkServiceMock());
  string country = 'Germany';
  string [] result = parkLocator.Country(country);
 }

}