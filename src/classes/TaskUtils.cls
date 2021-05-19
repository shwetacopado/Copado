public class TaskUtils
{

public static void remindOwners(List<Opportunity> lstOpp)
{
RemindOpptyOwners reminder = new RemindOpptyOwners();
String sch = '20 30 8 10 2 ?';
String jobID = System.schedule('Remind Opp Owners', sch, reminder);

}
}