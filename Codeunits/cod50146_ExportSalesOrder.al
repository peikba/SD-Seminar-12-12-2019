codeunit 50146 "CSD Export Sales Orders"
{
    trigger OnRun()
    begin
        Client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        if not Client.Get('http://NAVTraining:7047/BC140/WS/CRONUS%20International%20Ltd./Codeunit/WSFunctions', ResponseMessage) then
            Error('The call to the web service failed.');
        if not ResponseMessage.IsSuccessStatusCode then
            error('The web service returned an error message:\\' + 'Status code: %1\' + 'Description: %2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase);
        ResponseMessage.Content.ReadAs(XMLText);
        XMLoptions.PreserveWhitespace := true;
        XmlDocument.ReadFrom(xmlText, XMLoptions, XMLDoc);
        Error('%1',XMLDoc);
    end;
    
    var
        Client: HttpClient;
        ResponseMessage : HttpResponseMessage;
        XMLText : Text;
        XMLoptions : XmlReadOptions;
        XMLDoc : XmlDocument;
}