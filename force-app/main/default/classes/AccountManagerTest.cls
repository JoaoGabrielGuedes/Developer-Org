@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Account a = new Account(Name = 'TestGetAccount');
        insert a;
        Contact c = new Contact(AccountId = a.Id, FirstName = 'Test', LastName = 'Get');
        insert c;
        
        RestRequest request = new RestRequest();
        request.requestUri = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'+a.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account thisAccount = AccountManager.getAccount();        
        
        Assert.areEqual('TestGetAccount', thisAccount.Name);
    }
}