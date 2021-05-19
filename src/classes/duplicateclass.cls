Public class duplicateclass
{
  public void duplicate(List<Account> accs)
  {
    for (Account a : accs)
    {
      List<account> acc = [Select id,Name from Account where Name = :a.Name];
      if(acc.size() > 0)
      a.Name.addError('you cannot add duplicate name');
    }
  }
}