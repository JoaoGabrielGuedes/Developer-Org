public class OrderEventTriggerHandler {
    public static void ordertaskevent(List<Order_Event__e> oList){
        if(!oList.isEmpty()){
            List<Task> taskList = new List<Task>();
            for(Order_Event__e event : oList){
                if(event.Has_Shipped__c == true){
                    Task tList = new Task();
                    tList.Priority = 'Medium';
                    tList.Subject = 'Follow up on shipped order 105';
                    tList.OwnerId = event.CreatedById;
                    taskList.add(tList);
                    
                }
            }
            INSERT taskList;
        }
    }

}