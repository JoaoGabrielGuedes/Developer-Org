global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Lead WHERE LeadSource != \'Dreamforce\'');
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> processedLeads = new List<Lead>();
        for(Lead lead : scope){
            lead.LeadSource = 'Dreamforce';
            processedLeads.add(lead);
        }
        update processedLeads;
    }
    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}