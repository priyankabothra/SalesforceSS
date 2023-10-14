import { LightningElement, wire } from 'lwc';
import recentAccountsList from '@salesforce/apex/recentAccountQuery.recentAccountsList';

export default class RecentAccounts extends LightningElement {

    @wire(recentAccountsList) accDetails;
    
}