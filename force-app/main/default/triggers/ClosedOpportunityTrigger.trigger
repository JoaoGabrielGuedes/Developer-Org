trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> taskslist = new List<Task>();

    for (Opportunity oppObj : Trigger.new) {

        if (oppObj.StageName == 'Closed Won') {

            Task tObj = new Task();

            tObj.Subject = 'Follow Up Test Task';

            tObj.WhatId = oppObj.Id;

            taskslist.add(tObj);

        }

    }

    if (taskslist.size() > 0) {

        insert taskslist;

    }

}