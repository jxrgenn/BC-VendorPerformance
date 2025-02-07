table 10050600 "JXR Vendors Performance"
{
    DataClassification = CustomerContent;
    Caption = 'JXR Vendors Performance';

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Vendor No.';
        }
        field(2; "Purchase Order ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Purchase Order ID';
            TableRelation = "Purch. Inv. Header";
        }
        field(3; "Expected Delivery Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Expected Delivery Date';
            TableRelation = "Purch. Inv. Header";
        }
        field(4; "Actual Delivery Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Actual Delivery Date';
            TableRelation = "Purch. Inv. Header";
        }
        field(5; "Delivery Duration"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Delivery duration in days (negative means early)';
        }
        field(6; "Vendor Avg Delivery Time"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Average Delivery duration in days (negative means early)';
        }
    }

    keys
    {
        key(PK; "Vendor No.", "Purchase Order ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}