public class RandomContactFactory {

    public static List<Contact>  generateRandomContacts(integer numcon,string clastname)
    {
        List<Contact> cons = new List<Contact>();
        for (integer i =0;i<numcon;i++)
        {
            Contact c = new Contact(FirstName = 'Test'+i,LastName=clastname);
            cons.add(c);
        }
        return cons;
    }
}