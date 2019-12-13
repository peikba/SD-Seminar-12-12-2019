codeunit 50147 "CSD Upgrade Codeunit"
{
    Subtype=Upgrade;
trigger OnCheckPreconditionsPerCompany()
var
    myInt: Integer;
begin
    
end;
trigger OnUpgradePerCompany()
var
    ModuleInfo : ModuleInfo;
begin
    NavApp.GetCurrentModuleInfo(ModuleInfo);
    case Format(ModuleInfo.DataVersion) of
        '1.0.0.0' : UpgradeStepOne();
        '2.0.0.0' : UpgradeStepTwo();
    end;
end;
trigger OnValidateUpgradePerCompany()
var
    myInt: Integer;
begin
    
end;

local procedure UpgradeStepOne()
var
    myInt: Integer;
begin
    
end;
local procedure UpgradeStepTwo()
var
    myInt: Integer;
begin
    
end;
}