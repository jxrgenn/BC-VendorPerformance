page 10050600 "JXR Vendors Performance"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "JXR Vendors Performance";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the vendor no.';
                }
                field("Purchase Invoice Id"; Rec."Purchase Order ID")
                {
                    ToolTip = 'Specifies the Purchase Invoice Id';
                }
                field("Expected Delivery Date"; Rec."Expected Delivery Date")
                {
                    ToolTip = 'Specifies the Expected Delivery Date';
                }
                field("Actual Delivery Date"; Rec."Actual Delivery Date")
                {
                    ToolTip = 'Specifies the Actual Delivery Date';
                }
                field("Delivery Duration"; Rec."Delivery Duration")
                {
                    ToolTip = 'Specifies the Delivery Duration';
                }
                field("Vendor Avg Delivery Time"; Rec."Vendor Avg Delivery Time")
                {
                    ToolTip = 'Specifies the vendors avg delivery time';
                }
            }

        }

    }
    actions
    {
        area(Navigation)
        {
            action(DeleteAll)
            {
                ApplicationArea = All;
                Caption = 'Delete all entries';
                Image = Delete;
                ToolTip = 'Deletes all entries';
                trigger OnAction()
                begin
                    Rec.DeleteAll();
                end;

            }
        }
    }

    trigger OnOpenPage()
    var
        vendorCodeunit: Codeunit "JXR Vendor Populate";
    begin
        //vendorCodeunit.Run();
    end;

}