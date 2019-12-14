report 50149 "CSD Export Sales Orders"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Export Sales Orders';
    ProcessingOnly = true;
    UseRequestPage = false;

    trigger OnInitReport()
    var
        XMLText: Text;
        HttpContent: HttpContent;
        HttpRequestMessage: HttpRequestMessage;
        HttpHeaders: HttpHeaders;
        HttpClient: HttpClient;
        Url: Text;
        HttpResponse: HttpResponseMessage;
        XMLoptions: XmlReadOptions;
        XMLDoc: XmlDocument;
        XmlNodeList: XmlNodeList;
        XmlNode: XmlNode;
        TempCust: Record Customer temporary;
        BalanceLCY: Decimal;
        RootNode: XmlNode;
        NamespaceMgr: XmlNamespaceManager;
        AuthTxt: Text;
        UserName: Text;
        Password: Text;
        Base64: Codeunit "Base64 Convert";

    begin
        // Prepare the XML Request message 
        XMLText := '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">' +
                        '<Body>' +
                        '    <ImportSalesOrders xmlns="urn:microsoft-dynamics-schemas/codeunit/WSFunctions">' +
                        '        <salesOrderImportExport>' +
                        '            <SalesHeader xmlns="urn:microsoft-dynamics-nav/xmlports/x50002">' +
                        '                <PostingDate>2019-12-13</PostingDate>' +
                        '                <CustomerNo>30000</CustomerNo>' +
                        '                <SalesLine>' +
                        '                    <ItemNo>1000</ItemNo>' +
                        '                    <Quantity>10</Quantity>' +
                        '                    <UnitPrice>4000</UnitPrice>' +
                        '                </SalesLine>' +
                        '            </SalesHeader>' +
                        '        </salesOrderImportExport>' +
                        '    </ImportSalesOrders>' +
                        '</Body>' +
                    '</Envelope>';
        // Set the URL
        Url := 'http://NAVTraining:7047/BC140/WS/CRONUS%20International%20Ltd./Codeunit/WSFunctions';
        // Use Windows authentication
        UserName := '';
        Password := '';
        // Prepare the Request message and the Respons message
        HttpRequestMessage.SetRequestUri(URL);
        HttpRequestMessage.Method('POST');
        HttpContent.WriteFrom(XMLtext);
        HttpContent.GetHeaders(HttpHeaders);
        HttpHeaders.Remove('Content-Type');
        HttpHeaders.Add('Content-Type', 'application/xml;charset=utf-8');
        HttpRequestMessage.Content := HttpContent;
        HttpRequestMessage.GetHeaders(HttpHeaders);
        HttpHeaders.Add('SOAPAction', 'urn:microsoft-dynamics-schemas/page/ImportSalesOrders');
        // Basic authentication 
        if UserName <> '' then begin
            AuthTxt := strsubstno('%1:%2', UserName, Password);
            HttpHeaders.Add('Authorization', StrSubstNo('Basic %1', Base64.ToBase64(AuthTxt)));
        end else begin
            // Windows Authentication
            HttpClient.UseWindowsAuthentication('Admin', 'D365BC_RW2', 'NavTraining');
        end;
        HttpClient.send(HttpRequestMessage, HttpResponse);

        // Handle the result
        if not HttpResponse.IsSuccessStatusCode() then
            error(format(HttpResponse.HttpStatusCode()) + ' , ' + HttpResponse.ReasonPhrase())
        else begin
            Message('Yahoo');
        end;
    end;
}