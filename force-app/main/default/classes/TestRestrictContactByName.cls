@isTest
public class TestRestrictContactByName {
    @isTest
    static void TestInvalidName() {
          Contact c = new Contact();
          c.LastName = 'INVALIDNAME';
          
        Test.startTest();
        try {
            insert c;
        } catch (Exception msg) {
            Boolean e = (msg.getMessage().contains('The Last Name "'+c.LastName+'" is not allowed for DML'));
            System.AssertEquals(e, true);
        }
        Test.stopTest();    
    
    }     
}