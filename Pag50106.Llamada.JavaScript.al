page 50106 "Llamada JavaScript"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Posicion geografica"; TextoPosicion)
                {
                    ApplicationArea = All;
                }
                usercontrol(ControlName; ControlGeografico)
                {
                    ApplicationArea = All;

                    trigger PosicionCargadaJSon(Posicion: JsonObject)
                    begin
                        Posicion.WriteTo(TextoPosicion);
                    end;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CoordenadasJson)
            {
                Caption = 'Obtener coordenadas Json';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.ControlName.ObtenerPosicionJson();
                end;
            }

        }
    }
    var
        TextoPosicion: Text;

    trigger OnOpenPage()
    var
        ClientWeb: HttpClient;
        GeoResponse: HttpResponseMessage;
        GeoContent: Text;
    begin
        ClientWeb.Get('http://ip-api.com/json', GeoResponse);
        GeoResponse.Content.ReadAs(GeoContent);
        Message(GeoContent);
    end;
}