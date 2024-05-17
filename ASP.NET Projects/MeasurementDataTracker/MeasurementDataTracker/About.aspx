<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MeasurementDataTracker.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Task 2 – ASP.NET Web Application.</h3>
        <div >
        <p>
                Our client needs a web application to capture measurement data into a Microsoft SQL Database.
                The data should be normalized. The application must be access controlled using Microsoft Identity.
            </p>
            <p>
                The following data will need to be captured into the database in their appropriate data types:
            </p>
            <ul>
                <li>Temperature</li>
                <li>Humidity</li>
                <li>Weight</li>
                <li>Width</li>
                <li>Length</li>
                <li>Depth</li>
                <li>
                    A dropdown list selection (ID/Name) which should be bound from your SQL database
                    <ul>
                        <li>Production Line 1</li>
                        <li>Production Line 2</li>
                        <li>Production Line 3</li>
                    </ul>
                </li>
                <li>Pass/Fail toggle</li>
                <li>Timestamp (UTC)</li>
                <li>Details of who captured it</li>
            </ul>
            <p>
                All records should be visible inside of a GridView with the facility to update and delete records.
                Users are permitted to view all records saved by everyone but should only be allowed to update and
                delete their own records.
            </p>
            <p>
                Two classes are required with all required properties and constructors. One for the measurement
                entries, the other is a parent class with a collection to store instances of the measurement class.
                Methods to calculate the highest, lowest, variance, mean, sum, and standard deviation (of the
                temperature, humidity, weight, and dimensions) for all the items in the parent class collection are
                required. These calculated values should be displayed at the top of the page, and they should be
                recalculated and displayed after any insert, update, and delete.
            </p>
        </div>
    </main>
</asp:Content>
