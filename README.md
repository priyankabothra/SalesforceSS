# SalesforceSS

Test Details -

1. Create a field on Account named "Number of Contacts". Populate this field with the number of contacts related to an account.
    Number of Contacts :
    Setup -> Object Manager -> Account -> Field and Relationships -> New -> Number -> Number of Contacts.
    Created a trigger on Contact object -> Contact Trigger and ContactriggerHandler 
   
3. Build a basic lightning component that can query a list of 10 most recently created accounts and display it using a lightning app.
    LWC :
    Created an Apex class to query for the 10 recently created accounts -> recentAccountQuery
    Created a LWC to display the result in lightning app -> recentAccounts
      
5. Build a basic http callout and print the result using system.debug
    HttpCallout : 
    Created an Apex class to print the result -> httpCallout
