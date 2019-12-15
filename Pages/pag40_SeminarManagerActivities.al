page 50140 "CSD Seminar Manager Activities"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 10 - Lab 1 - 2
//     - Created new page
{
    PageType = CardPart;
    SourceTable = "CSD Seminar Cue";
    Caption = 'Seminar Manager Activities';

    layout
    {
        area(content)
        {
            cuegroup(Registrations)
            {
                CuegroupLayout = Wide;
                Caption = 'Registrations';
                field(Planned; Planned)
                {
                    ApplicationArea = All;
                }
                field(Registered; Registered)
                {
                    ApplicationArea = All;
                }
                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registration";
                        RunPageMode = Create;
                        ApplicationArea = All;
                    }
                }
            }
            cuegroup("For Posting")
            {
                CuegroupLayout = Wide;
                field(Closed; Closed)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        if not get() then begin
            init();
            insert();
        end;
    end;
}