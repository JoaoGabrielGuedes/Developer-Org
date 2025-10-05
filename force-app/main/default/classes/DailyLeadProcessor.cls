public class DailyLeadProcessor implements Schedulable {
     public void execute(SchedulableContext ctx) {
         List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = '' LIMIT 200];
         List<Lead> leadsUpd = new List<Lead>();
         for(Lead lead : leads){
             lead.LeadSource = 'Dreamforce';
             leadsUpd.add(lead);             
         }
         update leadsUpd;         
     }

}