public class QueueOwnerUpdate {
    public List<Group> grp = new List<Group>();
    private final Case caseobj{get;set;}
    public string queue1 {get;set;}
    public String caseId{get;set;}
                                
    public QueueOwnerUpdate()
    { }
    
    public List<SelectOption> QueueList
    {
        get
        {
            grp = [Select Id,Name,Type from Group where Type = 'queue'];
            QueueList = new List<SelectOption>();
            QueueList.Add(new SelectOption('--None--','--None--'));
            
            for (Group q : grp)
            {
                QueueList.Add(new SelectOption(q.Id,q.Name));
            }
            System.debug('Selected Queue |' + QueueList);
            return QueueList;
        }
    set;
    }
  public Pagereference saveCase()
  {
      try 
      {
          if (queue1 == '--None--')
          {
              Apexpages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,'Please Select a Queue from DropDown'));
          }
          else
          {
              caseId = ApexPages.currentPage().getparameters().get('id');
              Case caseRecord = [Select Id, CaseNumber,ownerId from Case where Id =: caseId];
              caseRecord.OwnerId = queue1;
              update caseRecord;
              PageReference ref = new pageReference('/' + caseRecord.Id);
              return ref;
          }
      }
          Catch (Exception e)
          {
              ApexPages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,'Please Select a Queue from dropdown'));
          }
          return null;
      }
  }