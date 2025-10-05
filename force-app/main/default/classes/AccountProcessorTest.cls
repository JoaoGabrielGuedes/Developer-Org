@isTest
public class AccountProcessorTest {
    @isTest static void countContactsTest(){
        List<Id> accId = new List<Id>();
        Account acc = new Account(Name = 'Future Test', Phone = '3786885284');
        insert acc;
        accId.add(acc.Id);
        System.debug(accId);
        
        List<Contact> conts = new List<Contact>();
        Contact contA = new Contact(LastName = 'contA', AccountId = acc.Id);
        Contact contB = new Contact(LastName = 'contB', AccountId = acc.Id);
        Contact contC = new Contact(LastName = 'contC', AccountId = acc.Id);
        conts.add(contA);
        conts.add(contB);
        conts.add(contC);
        insert conts;
        
        Test.startTest();
        AccountProcessor.countContacts(accId);
        Test.stopTest();        
        
        Account accResult = [SELECT Name, Number_Of_Contacts__c FROM Account WHERE Name = 'Future Test'];
        System.debug('AccResult:' +accResult);        
        System.assertEquals(3, accResult.Number_Of_Contacts__c, 'O número de contatos associados não está correto');        
    }
}