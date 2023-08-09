using {managed} from '@sap/cds/common';

namespace sap.ui.thingsmanagement;

entity Things : managed {
    key ID    : Integer;
        title : String(111);
        descr : String(1111);
        suppl : Association to Suppliers;
        price : Integer
}

entity Suppliers : managed {
    key ID          : Integer;
        description : String(111);
        owner       : String(111);
        things    : Association to many Things
                          on things.suppl = $self;
}
