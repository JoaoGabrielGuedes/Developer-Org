public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String commonLastName) {
        List<Contact> randomContacts = new List<Contact>();
        
        for (Integer i = 0; i < numberOfContacts; i++) {
            Contact newContact = new Contact();
            newContact.LastName = commonLastName;
            newContact.FirstName = 'Test ' + i;
            randomContacts.add(newContact);
        }
        
        return randomContacts;
    }
}