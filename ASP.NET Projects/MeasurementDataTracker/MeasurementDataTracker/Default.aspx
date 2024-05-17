<%@Page EnableEventValidation="false" Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MeasurementDataTracker._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2> Statistic  Table</h2>
    <div class="d-flex justify-content-center align-items-center py-5">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" class= "table table-striped table-bordered table-condensed">
                <Columns>
                    <asp:BoundField DataField="Statistic" HeaderText="Statistic" />
                    <asp:BoundField DataField="Temperature" HeaderText="Temperature" />
                    <asp:BoundField DataField="Humidity" HeaderText="Humidity" />
                    <asp:BoundField DataField="Weight" HeaderText="Weight" />
                    <asp:BoundField DataField="Width" HeaderText="Width" />
                    <asp:BoundField DataField="Length" HeaderText="Length" />
                    <asp:BoundField DataField="Depth" HeaderText="Depth" />
                </Columns>
            </asp:GridView>
    </div>
     <h2> Input Measurements</h2>
    <div class ="py-5 " >
     <div class="form-group row py-1">
        <asp:Label ID="Label1" runat="server" CssClass="col-md-2 col-form-label">Temperature</asp:Label>
           <div class="col-md-10">
              <asp:TextBox runat="server" ID="txtTemperature" Text="0" CssClass="form-control"  />
           </div>
     </div>
    <div class="form-group row py-1">
   <asp:Label ID="Label2" runat="server" CssClass="col-md-2 col-form-label">Humidity</asp:Label>
      <div class="col-md-10">
         <asp:TextBox runat="server" ID="txtHumidity" Text="0" CssClass="form-control"  />
      </div>
</div>
    <div class="form-group row py-1">
   <asp:Label ID="Label3" runat="server" CssClass="col-md-2 col-form-label">Weight</asp:Label>
      <div class="col-md-10">
         <asp:TextBox runat="server" ID="txtWeight" Text="0" CssClass="form-control"  />
      </div>
</div>
    <div class="form-group row py-1">
   <asp:Label ID="Label4" runat="server" CssClass="col-md-2 col-form-label">Width</asp:Label>
      <div class="col-md-10">
         <asp:TextBox runat="server" ID="txtWidth" Text="0" CssClass="form-control"  />
      </div>
</div>
    <div class="form-group row py-1">
   <asp:Label ID="Label5" runat="server" CssClass="col-md-2 col-form-label">Length</asp:Label>
      <div class="col-md-10">
         <asp:TextBox runat="server" ID="txtLength" Text="0" CssClass="form-control"  />
      </div>
</div>
    <div class="form-group row py-1">
   <asp:Label ID="Label6" runat="server" CssClass="col-md-2 col-form-label">Depth</asp:Label>
      <div class="col-md-10">
         <asp:TextBox runat="server" ID="txtDepth" Text="0" CssClass="form-control"  />
      </div>
</div>
    <div class="form-group row py-1">
        <asp:Label ID="Label7" runat="server" CssClass="col-md-2 col-form-label">Production Line</asp:Label>
        
      <div class="col-md-10">
         <asp:DropDownList ID="ddlProductionLine" runat="server"></asp:DropDownList>
      </div>
</div>
    <div class="form-group row py-1">
   <asp:Label ID="Label8" runat="server" CssClass="col-md-2 col-form-label">Pass/Fail</asp:Label>
      <div class="col-md-10">
          <asp:CheckBox ID="cbPassFail" runat="server" />
      </div>
</div>
 </div> 
    
    <div class="form-group row">
    <div class="col-md-offset-2 col-md-10">
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-outline-dark" />
    </div>
</div>

 <h2 class=" mt-5"> Measurement Table </h2>
<div class="py-5">
 <div style="overflow-y: scroll; height: 400px;" >
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="false" OnRowDataBound="GridView1_RowDataBound" EnableViewState="true" class= "table table-striped table-bordered table-condensed"  > 
        <Columns>
            <asp:BoundField DataField="MeasurementID" HeaderText="Measurement ID" />
            <asp:BoundField DataField="Temperature" HeaderText="Temperature" />
            <asp:BoundField DataField="Humidity" HeaderText="Humidity" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" />
            <asp:BoundField DataField="Width" HeaderText="Width" />
            <asp:BoundField DataField="Length" HeaderText="Length" />
            <asp:BoundField DataField="Depth" HeaderText="Depth" />
            <asp:BoundField DataField="ProductionLineID" HeaderText="ProductionLineID" />
            <asp:BoundField DataField="PassFail" HeaderText="PassFail" />
            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" visible="false"/>
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:TemplateField>
                <HeaderTemplate>
                    <div class="d-flex flex-row">
                         <div class="flex-fill">Edit/Delete</div>
                    </div>
                </HeaderTemplate>
                    <ItemTemplate>
                        <div class="d-flex flex-row">
                         <asp:Button ID="btnEdit" runat="server" Text="Edit"  OnClick="btnEdit_Click" CssClass="btn btn-outline-dark my-1 btn-block"/>
                         <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-outline-dark my-1 mx-1 btn-block" />
                        </div>
                    </ItemTemplate>
           </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</div>

</asp:Content>
