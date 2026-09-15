<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mascotas.aspx.cs" Inherits="PawCare.Mascotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>PawCare</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">

        <div class="container mt-4">

            <h2 class="text-center mb-4">PawCare - Registro de Mascotas</h2>

            <div class="row">

                <div class="col-md-5">

                    <div class="card p-3">

                        <h4>Registrar Mascota</h4>

                        <div class="mb-3">
                            <label>Nombre de la mascota</label>

                            <asp:TextBox ID="txtNombreMascota" runat="server"
                                CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="rfvNombreMascota"
                                runat="server"
                                ControlToValidate="txtNombreMascota"
                                ErrorMessage="Ingrese el nombre de la mascota"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="mb-3">
                            <label>Nombre del dueño</label>

                            <asp:TextBox ID="txtNombreDueno" runat="server"
                                CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="rfvNombreDueno"
                                runat="server"
                                ControlToValidate="txtNombreDueno"
                                ErrorMessage="Ingrese el nombre del dueño"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="mb-3">
                            <label>Tipo</label>

                            <asp:DropDownList ID="ddlTipo" runat="server"
                                CssClass="form-select">

                                <asp:ListItem>Perro</asp:ListItem>
                                <asp:ListItem>Gato</asp:ListItem>
                                <asp:ListItem>Otro</asp:ListItem>

                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label>Edad</label>

                            <asp:TextBox ID="txtEdad" runat="server"
                                CssClass="form-control"></asp:TextBox>

                            <asp:RangeValidator ID="rvEdad"
                                runat="server"
                                ControlToValidate="txtEdad"
                                MinimumValue="0"
                                MaximumValue="30"
                                Type="Integer"
                                ErrorMessage="La edad debe estar entre 0 y 30"
                                ForeColor="Red">
                            </asp:RangeValidator>
                        </div>

                        <div class="mb-3">
                            <label>Teléfono</label>

                            <asp:TextBox ID="txtTelefono" runat="server"
                                CssClass="form-control"></asp:TextBox>

                            <asp:RegularExpressionValidator ID="revTelefono"
                                runat="server"
                                ControlToValidate="txtTelefono"
                                ValidationExpression="^[0-9]{9}$"
                                ErrorMessage="Ingrese un teléfono de 9 dígitos"
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div class="mb-3">
                            <label>Observaciones</label>

                            <asp:TextBox ID="txtObservaciones" runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine">
                            </asp:TextBox>
                        </div>

                        <asp:Button ID="btnRegistrar" runat="server"
                            Text="Registrar"
                            CssClass="btn btn-primary"
                            OnClick="btnRegistrar_Click" />

                    </div>

                </div>

                <div class="col-md-7 mt-3 mt-md-0">

                    <div class="card p-3">

                        <h4>Mascotas registradas</h4>

                        <div class="table-responsive">

                            <asp:GridView ID="gvMascotas" runat="server"
                                CssClass="table table-bordered table-striped"
                                AutoGenerateColumns="true">
                            </asp:GridView>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </form>
</body>
</html>