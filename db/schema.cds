namespace RiskManagement;

entity Risks
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one Mitigations;
    bp : Association to one A_BusinessPartner;
    supplier : Association to one A_BusinessPartner;
}

entity Mitigations
{
    key ID : UUID;
    createdAt : String(100);
    createdBy : String(100);
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.miti = $self;
}

entity A_BusinessPartner
{
    key BusinessPartner : String(10);
    Customer : String(10);
    Supplier : String(10);
    BusinessPartnerFullName : String(81);
    BusinessPartnerName : String(81);
    FirstName : String(40);
    LastName : String(40);
    BusinessPartnerCategory : String(1);
    Industry : String(10);
    BusinessPartnerIsBlocked : Boolean;
    BusinessPartnerType : String(4);
    OrganizationBPName1 : String(40);
    OrganizationBPName2 : String(40);
    SearchTerm1 : String(20);
    Language : String(2);
    CreationDate : Date;
    LastChangeDate : Date;
}
