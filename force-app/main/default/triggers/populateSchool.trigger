trigger populateSchool on Student__c (before insert) {
    School__c uninterSchool = [SELECT Id FROM School__c WHERE Name = 'Uninter' LIMIT 1];
    
    for (Student__c student : Trigger.new) {
        student.School__c = uninterSchool.Id;
    }
}