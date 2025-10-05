trigger HelloWorldTrigger on Account (before insert) {
    for(Account a : Trigger.new){
        a.Description = 'Hello World!';
        a.Phone = '11999998888';
        a.Rating = 'Hot';
    }
}