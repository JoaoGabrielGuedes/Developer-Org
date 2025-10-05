@isTest
public class TestVerifyDate {

    @isTest
    static void checkDateLess30Days()  {
        Date startDay = Date.newInstance(2024, 3, 21);
        Date endDate = Date.newInstance(2024, 3, 27);
        Date testDate = VerifyDate.CheckDates(startDay, endDate);
        
        System.assertEquals(endDate, testDate);
    
    }
    @isTest
    static void checkDateMore30Days()  {
        Date startDayMore = Date.newInstance(2024, 3, 31);
        Date endDateMore = Date.newInstance(2024, 5, 21);
        Date testDateMore = VerifyDate.CheckDates(startDayMore, endDateMore);
        
        System.assertEquals(startDayMore, testDateMore);
    
    }
}