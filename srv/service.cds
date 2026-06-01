using { RiskManagement as my } from '../db/schema.cds';

@path : '/service/RiskManagementService'
service RiskManagementService
{
    @cds.redirection.target
    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @cds.redirection.target
    @odata.draft.enabled
    entity Mitigations as
        projection on my.Mitigations;

    @cds.redirection.target
    @odata.draft.enabled
    entity A_BusinessPartner as projection on my.A_BusinessPartner {
        BusinessPartner,
        Customer,
        Supplier,
        BusinessPartnerFullName,
        BusinessPartnerName,
        FirstName,
        LastName,
        BusinessPartnerCategory,
        Industry,
        BusinessPartnerIsBlocked,
        BusinessPartnerType,
        OrganizationBPName1,
        OrganizationBPName2,
        SearchTerm1,
        Language,
        CreationDate,
        LastChangeDate
    };
}

annotate RiskManagementService.Risks with @restrict :
[
    {
        grant : 'READ',
        to    : 'RiskViewer'
    },
    {
        grant : [ 'READ', 'WRITE' ],
        to    : 'RiskManager'
    }
];

annotate RiskManagementService.Mitigations with @restrict :
[
    {
        grant : 'READ',
        to    : 'RiskViewer'
    },
    {
        grant : [ 'READ', 'WRITE' ],
        to    : 'RiskManager'
    }
];
