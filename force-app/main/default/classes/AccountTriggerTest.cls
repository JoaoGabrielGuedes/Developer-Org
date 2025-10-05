@isTest
public class AccountTriggerTest {
    @isTest static void AccountWithSSequalBS() {        
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i, BillingState = 'CA');
            accts.add(acct);
        }        
        Test.startTest();
        insert accts;
        Test.stopTest();
        Account verifyAccts = [SELECT Id, ShippingState, BillingState FROM Account WHERE BillingState = 'CA' LIMIT 1];
        Assert.areEqual(verifyAccts.ShippingState, verifyAccts.BillingState, 'Os campos não são iguais!');
    }
}