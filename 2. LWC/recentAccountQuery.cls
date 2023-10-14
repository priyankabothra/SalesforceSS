public class recentAccountQuery {
    
    @AuraEnabled(cacheable=true)

    public static List<Account> recentAccountsList() {
        return [SELECT Id, Name, CreatedDate, Type, Phone, Industry, Active__c FROM Account Order by CreatedDate Desc LIMIT 10];
    }
}