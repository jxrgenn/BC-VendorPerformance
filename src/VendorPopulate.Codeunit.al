codeunit 10050600 "JXR Vendor Populate"
{
    Subtype = Install;

    var
        purchInvHeader: Record "Purch. Inv. Header";
        vendorsPerformance: Record "JXR Vendors Performance";
        vendorsNos: array[5] of Integer;
        number: Integer;
        i: Integer;
        vendorsDurations: array[5] of Integer;

    trigger OnInstallAppPerCompany()
    begin
        if (vendorsPerformance.Count <> 0) then 
            exit;
        i := 1;
        number := 10000;
        //fill the array from 10000 to 50000
        populateVendorsArray(i, vendorsNos);

        repeat
            purchInvHeader.SetRange("Buy-from Vendor No.", Format(vendorsNos[i]));

            if purchInvHeader.FindSet() then
                repeat
                    vendorsPerformance.Init();
                    vendorsPerformance."Vendor No." := purchInvHeader."Buy-from Vendor No.";
                    vendorsPerformance."Purchase Order ID" := purchInvHeader."No.";
                    vendorsPerformance."Expected Delivery Date" := purchInvHeader."Due Date";
                    vendorsPerformance."Actual Delivery Date" := purchInvHeader."Posting Date";
                    vendorsPerformance."Delivery Duration" := vendorsPerformance."Actual Delivery Date" - vendorsPerformance."Expected Delivery Date";
                    vendorsPerformance.Insert();
                until purchInvHeader.Next() = 0;
            i += 1;

        until i = 6;
        i := 1;
        //get vendors avg duration
        calculateAverageDurationByVendor(i);
        i := 1;
        //populate the avg duration for all entries
        populateAvgDuration(i);
    end;



    local procedure populateVendorsArray(var i: Integer; var vendorsNo: array[5] of Integer)
    begin

        repeat
            vendorsNos[i] := number;
            number += 10000;
            i += 1;
        until number = 60000;
        i := 1;
    end;

    local procedure calculateAverageDurationByVendor(var i: Integer)
    var
        fullDuration: Integer;
        j: Integer;

    begin
        repeat
            Message('fillojm me %1', vendorsNos[i]);
            vendorsPerformance.SetRange(vendorsPerformance."Vendor No.", Format(vendorsNos[i]));
            if vendorsPerformance.FindSet() then begin
                j := 0;
                repeat
                    fullDuration += vendorsPerformance."Delivery Duration";
                    j += 1;
                until vendorsPerformance.Next() = 0;
                vendorsDurations[i] := fullDuration div j;

                j := 0;
            end;
            i += 1;

        until i = 6;
        i := 1;

    end;

    local procedure populateAvgDuration(var i: Integer)
    begin
        repeat
            vendorsPerformance.SetRange(vendorsPerformance."Vendor No.", Format(vendorsNos[i]));
            if vendorsPerformance.FindSet() then
                repeat
                    vendorsPerformance."Vendor Avg Delivery Time" := vendorsDurations[i];
                    vendorsPerformance.Modify();
                until vendorsPerformance.Next() = 0;
            i += 1;
        until i = 6;
        i := 1;
    end;

}