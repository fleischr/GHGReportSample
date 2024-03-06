using GHGService as service from '../../srv/ghg-service';

annotate service.CarbonEmissions with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ObjectType',
            Value : ObjectType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ObjectKey',
            Value : ObjectKey,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CO2eAmount',
            Value : CO2eAmount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'UnitOfMeasure',
            Value : UnitOfMeasure,
        },
    ]
);
annotate service.CarbonEmissions with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ObjectType',
                Value : ObjectType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ObjectKey',
                Value : ObjectKey,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CO2eAmount',
                Value : CO2eAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnitOfMeasure',
                Value : UnitOfMeasure,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EmissionsFrom',
                Value : EmissionsFrom,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EmissionsTo',
                Value : EmissionsTo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'GHGOrgID',
                Value : GHGOrgID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
