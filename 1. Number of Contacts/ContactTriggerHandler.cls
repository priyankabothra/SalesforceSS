public class ContactTriggerHandler {
    
    //find the count of number of contacts related to an account
    
    public static void updateCountOfContact(List<Contact> con, String triggerOperation){
        Set<Id> accId = new Set<Id>();
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        
        //retrieve the account id from trigger.new
        for(Contact c : con){
            if(c.AccountId != null){
                accId.add(c.AccountId);
            }
        }
        System.debug('Account Id>>>' + accId);
        
        //check if there are account Ids in set and add it to a map
        if(accId.size()>0){
            accMap = new Map<Id, Account>([Select Id, Number_of_Contacts__c from Account where Id =: accId]);
            
            System.debug('Account Map>>>' + accMap);
            
            //iterate over trigger and if the id is contained in teh map then increase the count by 1
            for (Contact contacts : con){
                if(accMap.containsKey(contacts.AccountId)){
                    //Id acctid = contacts.AccountId;
                    if(accMap.get(contacts.AccountId).Number_of_Contacts__c != null && triggerOperation == 'insert'){
                        accMap.get(contacts.AccountId).Number_of_Contacts__c += 1;
                    }
                    else if(accMap.get(contacts.AccountId).Number_of_Contacts__c != null && triggerOperation == 'delete'){
                        accMap.get(contacts.AccountId).Number_of_Contacts__c -= 1;
                    }
                    else {
                       accMap.get(contacts.AccountId).Number_of_Contacts__c = 1;
                    }
                } 
            }
            System.debug('No of contact>>>' + accMap.Values());
            
            update accMap.values();
        }
    }
}