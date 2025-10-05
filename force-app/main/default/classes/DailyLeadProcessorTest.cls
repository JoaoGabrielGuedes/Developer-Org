@isTest
public class DailyLeadProcessorTest {
    @isTest
    public static void TestDailyLeadProcessor(){
        List<Lead> leads = new List<Lead>();        
        for(Integer i = 0; i < 200; i++){
            Lead lead = new Lead(LastName = 'ScheduleTest' +i, Company = 'Freelance');
            leads.add(lead);
        }
        insert leads;
        
        DailyLeadProcessor reminder = new DailyLeadProcessor();
        String sch = '20 30 8 10 2 ?';
                
        Test.startTest();
        String jobID = System.schedule('Daily lead processor', sch, reminder);
        Test.stopTest();
        
        Lead leadUpdated = [SELECT Id, LeadSource FROM Lead WHERE Id IN: leads LIMIT 1];
        Assert.areEqual('Dreamforce', leadUpdated.LeadSource, 'O campo LeadSource não foi atualizado corretamente');
    }

}