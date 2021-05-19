@istest
private class TestRestrictContactByName {

    @istest static void invalidnametest()
    {
        Contact con1 = new Contact(FirstName = 'xyz',LastName = 'INVALIDNAME'); 
        test.startTest();
        try
        {
            insert con1;
        }
        catch (DmlException dmlEx)
        {
        String expectedMessage = 'The Last Name "'+ con1.LastName+'" is not allowed for DML';
        system.assertEquals('expectedMessage', dmlEx.getDmlMessage(0));
        }
        test.stopTest();
       }
}