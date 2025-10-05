@isTest
public class LeadProcessorTest {    
    @isTest
    static void LeadProcessorBatchTest(){
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++){
            Lead lead = new Lead(LastName='TestBatchLead ' + i, Company = 'Freelance');
            leads.add(lead);
        }
        insert leads;
        
        System.debug('Lista de leads criados no setup: ' +leads);
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();
        
        List<Lead> leadUpdated = [SELECT Id, LastName, Company, LeadSource FROM Lead WHERE Company = 'Freelance' LIMIT 1];
        Lead leadFinal = leadUpdated[0];
        System.debug('Lead atualizado: ' +leadFinal);
        Assert.areEqual('Dreamforce', leadFinal.LeadSource, 'O campo lead source não foi atualizado como esperado');
    }
}