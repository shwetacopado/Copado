Public class UseWrapperCtr
{
    public List<Wrapper>lstAccWrapper{get;set;}
    public UseWrapperCtr()
    {
        lstAccWrapper = new List<Wrapper>();
        List<Account> accounts = [Select id,name,rating,createddate from Account where rating!= null];
        for(Account a: accounts)
        {
            Wrapper w = new Wrapper();
            w.accName = a.Name;
            w.ratingName = a.Rating;
            w.dayName    = returnDayname(a.createddate);
            lstAccWrapper.add(w);
        }
    }

public class wrapper {

    public String accName{get;set;}
    public  String ratingName{get;set;}
    public String dayName{get;set;}
    
}

Public String returnDayName(DateTime accCreateDate)
{
    String dayName = accCreateDate.format('EEEE');
    return dayName;
}
}