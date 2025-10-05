public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts) {
        List<Account> updatedAcc = new List<Account>();
        for(Account a : accts){
            if(a.ShippingState != a.BillingState){
                a.ShippingState = a.BillingState;
            }
        }
   }
}