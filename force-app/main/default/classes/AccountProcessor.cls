public class AccountProcessor {
    @future
    public static void countContacts(List<ID> recordIds){
        List<Account> accts = [SELECT Name FROM Account WHERE Id =: recordIds];
        List<Contact> conts = [SELECT Name FROM Contact WHERE AccountId =: accts];
        
        if(conts.size() > 0 ){
            for(Account a : accts){
                a.Number_Of_Contacts__c = conts.size();
                System.debug(conts.size());
            }    
        update accts;    
        }
    }
}