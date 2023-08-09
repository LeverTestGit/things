using {sap.ui.thingsmanagement as myproject} from '../db/schema';

service ThingsService {
    entity Things  as projection on myproject.Things;
    annotate Things with @odata.draft.enabled;
    entity Suppliers as projection on myproject.Suppliers;
    annotate Suppliers with @odata.draft.enabled;
}
