enum 50136 MyEnum01
{
    Extensible = true;

    value(0; Value00)
    {
    }
    value(1; Value01)
    {
    }
}

table 50135 MyTable03
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

table 50136 MyTable04
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
            CalcFormula = sum (MyTable03.Amount where(MyEnum = const(Value00)));
        }
        field(4; "TotalAmount2"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum (MyTable03.Amount where(MyEnum = filter(Value00)));
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