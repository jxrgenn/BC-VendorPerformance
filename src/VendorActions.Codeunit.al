codeunit 10050601 "JXR Vendor Actions"
{
    var
        vendorsPerformance: Record "JXR Vendors Performance";

    procedure MyProcedure(var purchHeader: Record "Purchase Header")

    begin
        vendorsPerformance.Init();
        vendorsPerformance."Vendor No." := purchHeader."Buy-from Vendor No.";
        vendorsPerformance."Expected Delivery Date" := purchHeader."Due Date";
        vendorsPerformance."Actual Delivery Date" := purchHeader."Posting Date";
        vendorsPerformance."Delivery Duration" := purchHeader."Posting Date" - purchHeader."Due Date";
        vendorsPerformance.Insert();
    end;

}