@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {

    global class RequestBody {
        public String reason;
    }

    @HttpPost
    global static void closeCase() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String caseId;
        String fullURI = req.requestURI;

        System.debug('--- Received REST request ---');
        System.debug('URI: ' + fullURI);
        System.debug('Body: ' + req.requestBody.toString());

        try {
            // Extract ID using regex
            Matcher m = Pattern.compile('/case/([a-zA-Z0-9]{15,18})/close').matcher(fullURI);
            if (m.find()) {
                caseId = m.group(1);
            } else {
                res.statusCode = 400;
                res.responseBody = Blob.valueOf('Invalid URL format: Could not parse Case ID.');
                System.debug('Failed to parse Case ID.');
                return;
            }

            System.debug('Parsed Case ID: ' + caseId);

            // Deserialize the request body
            RequestBody input = (RequestBody) JSON.deserialize(req.requestBody.toString(), RequestBody.class);

            if (input == null || String.isBlank(input.reason)) {
                res.statusCode = 400;
                res.responseBody = Blob.valueOf('Missing reason.');
                System.debug('Reason is missing.');
                return;
            }

            System.debug('Calling CaseService.closeCases...');

            CaseService.closeCases(new Set<Id>{Id.valueOf(caseId)}, input.reason);

            System.debug('CaseService call completed.');

            res.statusCode = 204; // Success
        } catch (Exception e) {
            res.statusCode = 500;
            res.responseBody = Blob.valueOf('Error: ' + e.getMessage());
            System.debug('Error occurred: ' + e.getMessage());
        }
    }
}