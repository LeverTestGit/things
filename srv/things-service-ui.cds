using ThingsService from './things-service';

annotate ThingsService.Things with {
    title @title: 'Title';
    descr @title: 'Description';
    suppl @title: 'Suppliers';
    price @title: 'Price';
}

annotate ThingsService.Suppliers with {
    ID          @(
        UI.Hidden,
        Common: {Text: description}
    );
    description @title: 'Description';
    owner       @title: 'Owner';
    things      @title: 'Things';
}

annotate ThingsService.Things with @(UI: {
    HeaderInfo      : {
        TypeName      : 'Things',
        TypeNamePlural: 'Things',
        Title         : {
            $Type: 'UI.DataField',
            Value: title
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr
        }
    },
    LineItem        : [
        {Value: title},
        {Value: descr},
        {Value: price},
        {Value: suppl_ID}
    ],
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target: '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main: {Data: [
        {Value: title},
        {Value: suppl_ID},
        {Value: descr},
        {Value: price}
    ]}
}, ) {

};

annotate ThingsService.Things with {
    suppl @(Common: {
        Text           : suppl.description,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Suppliers',
            CollectionPath: 'Suppliers',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: suppl_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    });
}
