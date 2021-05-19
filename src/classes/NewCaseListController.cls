public class NewCaseListController {

list<case> newcase = new list<case>();
public List<case> getNewCases()
{

newcase = [Select Id,CaseNumber from case where status='New'];
return newcase;
}


}