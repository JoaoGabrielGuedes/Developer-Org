@isTest
public class AddPrimaryContactTest {
    @isTest
    private static void testQueueableClass(){
        List<Account> accs = new List<Account>();
        for(Integer i=0; i<100; i++){
            Account acc = new Account(Name = 'QueueableAccTest' +i);
            if(i < 50){
                acc.BillingState = 'NY';
            } else {
                acc.BillingState = 'CA';
            }
            accs.add(acc);
        }
        insert accs;
        
        Contact cont = new Contact(FirstName = 'Test', LastName = 'QueueableCont');
        insert cont;
        
        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(cont, 'CA'));
        Id jobIdNY = System.enqueueJob(new AddPrimaryContact(cont, 'NY'));
        Test.stopTest();
        
        List<Contact> conts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        Assert.areEqual(50, conts.size(), 'O número de contatos está incorreto');
        
        List<Contact> contNY = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'NY'];
        Assert.areEqual(50, contNY.size(), 'O número de contatos está incorreto');
    }

}