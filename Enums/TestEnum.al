enum 50140 MyEnum01
{
    Extensible = true;

    value(0; Value00)
    {
    }
    value(1; Value01)
    {
    }
}

table 50140 MyTable01
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "MyField"; Integer)
        {
            Caption = 'MyField';
            DataClassification = ToBeClassified;
        }
        field(2; "MyEnum"; Enum MyEnum01)
        {
            Caption = 'MyEnum';
            DataClassification = ToBeClassified;
        }
        field(3; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "MyField")
        {
            Clustered = true;
        }
    }
}

table 50141 MyTable02
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "MyField"; Integer)
        {
            Caption = 'MyField';
            DataClassification = ToBeClassified;
        }
        field(3; "TotalAmount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum (MyTable01.Amount where(MyEnum = const(Value00)));
        }
        field(4; "TotalAmount2"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum (MyTable01.Amount where(MyEnum = filter(Value00)));
            /* ERROR:
            "resource": "/c:/Users/Jmarin/Documents/AL/ALProject39/.vscode/Test01.al",
            "owner": "_generated_diagnostic_collection_name_#1",
            "code": "AL0186",
            "severity": 8,
            "message": "Reference 'MyEnum' in application object 'MyTable01' does not exist",
            "source": "AL",
            "startLineNumber": 83,
            "startColumn": 73,
            "endLineNumber": 83,
            "endColumn": 80

            */
        }

    }

    keys
    {
        key(PK; "MyField")
        {
            Clustered = true;
        }
    }
}