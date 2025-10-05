public class AddPrimaryContact implements Queueable {
    private Contact cont;
    private String state;
    public AddPrimaryContact(Contact cont, String state) {
        this.cont = cont;
        this.state = state;       
    }
    
    public void execute(QueueableContext context) {
        List<Account> accs = [SELECT Id FROM Account WHERE BillingState =: state LIMIT 200];
        List<Contact> conts = new List<Contact>();
        for (Account acc : accs) {
            Contact contClone = cont.clone();
            contClone.AccountId = acc.Id;
            conts.add(contClone);
        }
        insert conts;     
   }
}