using {sap.ui.thingsmanagement as myproject} from '../db/schema';

service ThingsService {
    entity Things @(restrict: [
        {
            grant: ['READ'],
            to   : ['ThingsViewer']
        },
        {
            grant: ['*'],
            to   : ['ThingsManager']
        }
    ]) as projection on myproject.Things;

    annotate Things with @odata.draft.enabled;

    entity Suppliers @(restrict: [
        {
            grant: ['READ'],
            to   : ['ThingsViewer']
        },
        {
            grant: ['*'],
            to   : ['ThingsManager']
        }
    ]) as projection on myproject.Suppliers;

    annotate Suppliers with @odata.draft.enabled;
}
