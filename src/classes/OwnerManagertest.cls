@isTest
Private class OwnerManagertest {
    
    public static void OwnerhasNoManager()
    {
        User myuser = new User();
        myuser.FirstName = 'Sansa';
        myuser.LastName  = 'Stark';
        myuser.Email     = 'sstark@intefacehotels.com';
        myuser.Username  =  'stark@interfacehotels.com';
        myuser.Alias     =  'redhead';
        myuser.ProfileId  = [Select id from profile where Name = 'system Administrator'].Id;
        myuser.TimeZoneSidKey    = 'America/Denver';
        myuser.LocaleSidKey      = 'en_US';
        myuser.EmailEncodingKey  = 'UTF-8';
        myuser.LanguageLocaleKey =  'en_US';
        myuser.ManagerId         = null;
        insert myuser;
        
        Opportunity opp = new Opportunity();
        opp.Name        = 'Big Deal';
        opp.Amount      = 100;
        opp.StageName   = 'Prospectng';
        opp.CloseDate   = Date.today();
        opp.OwnerId     = myuser.id;
        insert opp;
        
        List<OpportunityTeamMember> otms = [Select Id from OpportunityTeamMember where OpportunityId = :opp.Id];
        System.assertEquals(0, otms.size());
    }
        @isTest static void onwerhasManager()
         {
            User manager = new User();
            manager.FirstName = 'Sansa';
            manager.LastName  = 'Stark';
            manager.Email     = 'sstark@interfacehotels.com';
            manager.Username  = 'sstark@interfacehotels.com';
            manager.Alias     = 'redhead';
            manager.ProfileId = [Select Id from profile where Name = 'System Administrator'].id;
            manager.TimeZoneSidKey = 'America/denver';
            manager.LocaleSidKey  =  'en_US';
            manager.EmailEncodingKey =  'UTF-8';
            manager.LanguageLocaleKey = 'en_US';
            manager.ManagerId         = null;
            insert manager;
            User me = [Select id from user where Id =:UserInfo.getUserId()];
            me.ManagerId = manager.id;
            update me;
            
            Opportunity opp = new Opportunity();
            opp.Name        = 'Big Deal';
            opp.Amount      = 100;
            opp.StageName   = 'Prospecting';
            opp.CloseDate   = Date.today();
            opp.OwnerId     = me.Id;
            insert opp;
            
            List<OpportunityTeammember> otms = [Select Id from OpportunityTeamMember where OpportunityId = :opp.id AND UserID = : manager.Id and TeammemberRole = 'Sales Manager'];
            System.assertEquals(1, otms.size());
                                
        }
              }