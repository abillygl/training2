<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="training2._new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<table id="letters"></table>
    <script>
        $(document).ready(function () {
            var $letters = $("#letters");
            $.ajax({
                url: "api/letters",
                contentType: "json",
                success: function (data) {
                    $.each(data, function (index, item) {

                        $row = $("#template").find(".row-template").clone().attr("id", "row_" + item.Id);
                        $row.find("#id").html(item.Id);
                        $row.find("#firstName").html(item.PatientFirstName);
                        $row.find("#lastName").html(item.PatientLastName);
                        $row.find("#critNotMet").html(item.CriteriaNotMet);
                        $row.find(".delete").click(function () {
                            $.ajax({
                                URL: "api/letters/" + item.Id,
                                type: "DELETE",
                                success: function () {
                                    $row.remove();
                                }
                            });
                        });
                        $letters.append($row);
                    });
                }
            });
        });
    </script>

    <div id="template" style="display:none;">
        <table>
            <tr class="row-template">
                <td id="id"></td>
                <td id="firstName"></td>
                <td id="lastName"></td>
                <td id="critNotMet"></td>
                <td>
                    <input type="button" value="x" class="delete" />
                </td>
            </tr>
         </table>
    </div>
</asp:Content>
