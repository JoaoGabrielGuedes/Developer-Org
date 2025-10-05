@isTest
private class AnimalLocatorTest {
    @isTest 
    static void testGetAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String expected = 'Lion';
 
        System.assertEquals(actual, expected, 'The returned animal name is incorrect.');
    }
}