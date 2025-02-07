pageextension 10050600 "JXR Purchase Invoice ext" extends "Purchase Invoices"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {

    }

    trigger OnDeleteRecord(): Boolean
    begin
        myCodeunit.MyProcedure(Rec);
    end;

    var
        myCodeunit: Codeunit "JXR Vendor Actions";
}