@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();        
        response.setHeader('contentType', 'application/json');
        response.setBody('{"animal":{"Id":1,"name":"Lion","eats":"meat","says":"roar"}}');        
        response.setStatusCode(200);        
        return response;
    }
}