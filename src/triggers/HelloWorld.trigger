trigger HelloWorld on Lead (Before Update) {

For (Lead l : Trigger.new)
{
  l.FirstName = 'Hello';
  l.LastName =  'World';
}

}