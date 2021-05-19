@isTest

Private Class AnimalLocatorTest
{
  @istest static void AnimalLocatorMock1()
  {
  
   test.SetMock(HttpCalloutMock.class, new AnimalLocatorMock());
   string result = AnimalLocator.getAnimalNamebyID(3);
   string expectedResult = 'chicken';
   System.AssertEquals(result,expectedresult);
  
  }
    
    }