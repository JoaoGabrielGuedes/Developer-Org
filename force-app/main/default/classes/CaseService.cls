public class CaseService {
    public static void closeCases(Set<Id> caseIds, String reason) {
        if (caseIds == null || caseIds.isEmpty() || String.isBlank(reason)) {
            throw new IllegalArgumentException('Case IDs and reason must be provided.');
        }

        List<Case> casesToUpdate = [SELECT Id, Status, Reason FROM Case WHERE Id IN :caseIds];

        for (Case c : casesToUpdate) {
            c.Status = 'Closed';
            c.Reason = reason;
        }

        update casesToUpdate;
    }
}