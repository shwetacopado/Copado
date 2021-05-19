@istest
public class testrecentcase {

    @istest public static void newcase()
    {
        User myuser       = new user();
        myuser.FirstName  = 'Sansa';
        myuser.LastName	  = 'Stark';
        myuser.Email      = 'sstark@intehotel.com';
        myuser.Username   = 'sstark@interhotel.com';
        myuser.Alias      = 'sstark';
        myuser.ProfileId   = [Select Id from Profile where Name = 'System Administrator'].id;
        myuser.TimeZoneSidKey = 'America/Denver';
        myuser.LocaleSidKey   = 'en_US';
        myuser.EmailEncodingKey = 'UTF-8';
        myuser.LanguageLocaleKey = 'en_uS';
        myuser.ManagerId         = null;
        insert myuser;
        
        Contact mycon = new Contact();
        mycon.FirstName = 'Arya';
        mycon.LastName  = 'Stark';
        mycon.OwnerId   =  myuser.Id;
        
        Account myacc = new Account();
        myacc.Name    = 'INFA';
        myacc.OwnerId = myuser.id;
        
        case mycase = new case();
        mycase.Subject = 'Reclaim Winterfall';
        mycase.ContactId = mycon.id;
        insert mycase;
        
        Contact UpdatedCon = [Select Ownerid from Contact where Id =:mycon.Id];
        
        System.assertEquals(UserInfo.getUserId(), UpdatedCon.OwnerId);
        
        Account updatedacc = [Select Ownerid from Account where Id =:myacc.Id];
        
        System.assertEquals(Userinfo.getUserId(),updatedacc.OwnerId);
    }
}