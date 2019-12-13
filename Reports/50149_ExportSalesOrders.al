report 50149 "CSD Export Sales Orders"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Export Sales Orders';

    trigger OnInitReport()
    begin
        Client.UseWindowsAuthentication('Admin', 'D365BC_RW2', 'NavTraining');
        Client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        if not Client.Get('http://NAVTraining:7047/BC140/WS/CRONUS%20International%20Ltd./Codeunit/WSFunctions', ResponseMessage) then
            Error('The call to the web service failed.');
        if not ResponseMessage.IsSuccessStatusCode then
            error('The web service returned an error message:\\' + 'Status code: %1\' + 'Description: %2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase);
        ResponseMessage.Content.ReadAs(XMLText);
        XMLoptions.PreserveWhitespace := true;
        XmlDocument.ReadFrom(xmlText, XMLoptions, XMLDoc);
        Error('%1', XMLDoc);
    end;

    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        XMLText: Text;
        XMLoptions: XmlReadOptions;
        XMLDoc: XmlDocument;
}