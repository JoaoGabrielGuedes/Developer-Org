@isTest
public class ParkLocatorTest {
 @isTest static void testParkLocator() {        
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'India';
        List<String> expected = new List<String>{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        List<String> actual = ParkLocator.Country(country);
        Assert.areEqual(expected, actual, 'A lista não retornou os valores corretos');
    }
}