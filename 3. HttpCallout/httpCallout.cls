public class httpCallout {
    
//print the response of the http request
    public static void httpCalloutResponse() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            for(String str : results.keySet()){
                System.debug('Field>>>' + str + 'FieldValue>>>' + results.get(str));
            }
        }
    }
}