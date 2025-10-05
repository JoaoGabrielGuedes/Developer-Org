public class AccountUtils {
    public static List<Account> accountsByState(String BillingState){
        List<Account> state = [SELECT Id, Name, BillingState FROM Account WHERE BillingState =: BillingState];         
        return state;    
    }
}