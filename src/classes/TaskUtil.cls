public class TaskUtil {

    Public static String getTaskPriority(String leadState)
    {
        //validate string
          if (String.isBlank(leadState) || leadState.length()>2 )
          {
              return null;
          }
        
        string taskpriority;
        
        if (leadState == 'CA')
        {
            taskpriority = 'High';
        }
        else 
        {
            taskPriority = 'Normal';
        }
        return taskpriority;
    }
    
    
}