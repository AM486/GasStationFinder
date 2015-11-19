<%@page import="java.sql.ResultSet"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:include page="/do.GasServlet" />
<%  ResultSet rs = (ResultSet) request.getAttribute("rs");%>
<!--αρκεί να αλλάξεις το url της βάσης, το username και το passwword και τρέχει κανονικά-->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/gasstation_db"
                   user="root"  password=""/>


<sql:query var="markers" dataSource="${snapshot}">
    SELECT * FROM gas_station
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GasStationFinder - Welcome Page</title>
        <link href="css/hover.css" rel="stylesheet" media="all">
        <link rel='icon' href='images/marker.png' type='image/x-icon'/ >
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript" ></script>

    </head>
    <body>

        <script>



            var myLatLng = [
            <c:forEach var="rows" items="${markers.rows}">
                {lat: ${rows.latitube},
                            lng: ${rows.longitude}},
            </c:forEach>
            ];

            var brands = [
            <c:forEach var="rows" items="${markers.rows}">
            "${rows.brand_name}",
            </c:forEach>
            ];
                    var phone = [
            <c:forEach var="rows" items="${markers.rows}">
                    '<i class="fa  fa-phone fa-lg"></i>   ' + "${rows.phone_no}",
            </c:forEach>
                    ];
                    var address = [
            <c:forEach var="rows" items="${markers.rows}">
                    '<i class="fa  fa-home fa-lg"></i>   ' + "${rows.address}" + " " + "${rows.adrress_no}" + ", </br>  " + "   ${rows.city}" + " " + "${rows.postal_code}",
            </c:forEach>
                    ];
                    var logo = [
            <c:forEach var="rows" items="${markers.rows}">
                    "${rows.log}",
            </c:forEach>
                    ];
                    console.log(brands.length)
            console.log(myLatLng)
            console.log(myLatLng.length)
            console.log(brands)
            console.log(phone)
            console.log(address)
            console.log(logo)

            var infowindow = null;
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 13,
                    center: {lat: 39.364300, lng: 22.937828}
                });


                infowindow = new google.maps.InfoWindow({
                    content: "holding..."

                });
                var markers = []

                var image = 'images/markers.png';
                for (i in myLatLng) {
                    markers[i] = new google.maps.Marker({
                        position: myLatLng[i],
                        map: map,
                        title: brands[i],
                        clickable: true,
                        icon:  image,
                    });

                }

                for (i in markers) {
                    map.setCenter(new google.maps.LatLng(myLatLng[i].lat, myLatLng[i].lng))
                    

                    var marker = markers[i];
                    var brand = brands[i]

                    marker.infowindow = new google.maps.InfoWindow({
                        content: "<div class='panel panel-default'><div class='panel-heading'>" + "<h4 class='panel-title'>" +
                                "<img src=" + logo[i] + "  width='15px' height='15px' style='margin-top:-3px'>  "
                                + brands[i] + "</h4>" + "</div>" + "<div class='panel-body'>" + address[i] + "</br>" + phone[i] + "</div></div>"
                    });

                    google.maps.event.addListener(marker, 'click', function () {
                        for (i in markers) {
                            var marker = markers[i];
                            marker.infowindow.close();
                        }

                        this.infowindow.open(map, this);
                    });

                    google.maps.event.addListener(marker, 'click', function () {

                        map.setCenter(this.getPosition());
                    });




                }

            }
        </script>



        <div id="maindiv" class="in row">
            <div class="left_div col-md-6">

                <div id="gas_pump">
                    <center><div id="header"> <h2 >Welcome to the Gas Station Finder!</h2></div></center>

                    <div id="pump_main">

                        <div id="gas_form">
                            <table border="0">
                                <thead>
                                    <tr>
                                        <th>Are you looking for a gas station?</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td >
                                            To view more information about nearby gas stations 
                                            select a gas station from below
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <form action="response.jsp">
                                                <div class="selection">
                                                    <select name="select_brand_name"  class=" form-control"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                        <option value="alls" selected="true"><strong>Select a gas station: </strong></option>
                                                        <%--<c:forEach var="gas_station" items="${gas_stations.rows}">--%>
                                                            <!--<option value="${gas_station.brand_name}">  ${gas_station.brand_name}</option>-->
                                                        <%--</c:forEach>--%>
                                                        <%

                                                            while (rs.next()) {
                                                                //Retrieve by column name
                                                                int id = rs.getInt("id");
                                                                String brand_name = rs.getString("brand_name");
                                                                float latitube = rs.getFloat("latitube");
                                                                float longitude = rs.getFloat("longitude");

                                                                //Display values
                                                                out.println("<option value= " + brand_name + ">" + brand_name + "</option>");
                                                                out.println(", brand_name: " + brand_name + "<br>");

                                                            }
                                                        %>
                                                    </select>
                                                </div>

                                                <strong>Select the services you need :</strong><br>
                                                <center> <label><input type="checkbox" name="gas" >Gas <br></label>
                                                    <label><input type="checkbox" name="oil" >Oil <br></label>
                                                    <label><input type="checkbox" name="laundry" >Car wash <br></label>
                                                    <label><input type="checkbox" name="market" >Minimarket <br></label></center>


                                                <!--                            <input type="checkbox" name="gas">Have gas <br>
                                                                            <input type="checkbox" name="oil">Have oil <br>
                                                                            <input type="checkbox" name="laundry">Have car wash<br>
                                                                            <input type="checkbox" name="market">Have market<br>-->





                                                <!--                                                <label class="radio-inline"><input type="radio" name="gas">Have gas </label>
                                                <label class="radio-inline"><input type="radio" name="oil">Have oil</label>
                                                <label class="radio-inline"><input type="radio" name="laundry">Have car wash</label>
                                                <label class="radio-inline"><input type="radio" name="market">Have market</label>-->



                                                </br>

                                                
                                                <center> <input type="submit" class="btn btn-info" value="submit" name="submit"></center>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <center>
                            <div id="uth_logo">
                                <a href="" class="hvr-float-shadow">  <img src="images/uth_logo_red.png" width="200" height="200"/> </a>

                            </div>
                        </center>

                    </div>
                    <div id="pump"></div>
                    <div id="pump_base">   </div>
                </div>
            </div>

            <div class="right_div col-md-6">
                <div id="map" class=""></div>

            </div>

        </div>
        <div class=" footer_div container-fluid ">

            <div class="in row">
                <div id="logo"   class="col-md-6">
                    <h3 class="sub"><a href="#" style="color: rgb(255, 255, 255);"><img src="images/uth_logo.png" width="20px" height="20px"></a> University of Thessaly</h3>
                    <h3 class="sub">CE 426 Web Technologies</h3>
                    <div id="me" >
                        <h4>What is Gas Station Finder?</h4>
                        Gas Station Finder is a web application that was created as a team project for the 2015 CE426 Web Technologies course.
                        The purpose of the application is to demonstrate a simple example of a web application 
                        with database connectivity. 
                    </div>
                </div>

                <div id="contributors" class="col-md-6">
                    <h2 class="sub">Contributors</h2>

                    <div class="col-md-4" >
                        <a href="https://github.com/AM486" class="hvr-wobble-vertical"  target="_blank"> <h4>Αργύριος Βαρθολομαίος</h4>  </a>

                    </div>         
                    <div class="col-md-4" >
                        <a href="https://github.com/am1369" class="hvr-wobble-vertical"  target="_blank"> <h4>Μαρία Κοσμίδου</h4>  </a>

                    </div>
                    <div class="col-md-4" >
                        <a href="https://github.com/am1244" class="hvr-wobble-vertical"  target="_blank">  <h4>Θωμαή Λύκα</h4>  </a>

                    </div>
                    <div class="col-md-4" >
                        <a href="https://github.com/am1374" class="hvr-wobble-vertical"  target="_blank"> <h4>Δημήτρης Μάλλιος</h4>    </a>

                    </div>
                    <div class="col-md-4" >
                        <a href="https://github.com/AM1196" class="hvr-wobble-vertical"  target="_blank">  <h4>Όλγα Ξυδιά</h4>   </a>

                    </div>
                    <div class="col-md-4" >
                        <a href="https://github.com/AM1445" class="hvr-wobble-vertical"  target="_blank"> <h4>Αποστόλης Ταμβάκης</h4>   </a>

                    </div>
                    <div class="col-md-4" >
                        <a href="https://github.com/AM9393" class="hvr-wobble-vertical"  target="_blank">   <h4>Γρηγόρης Τσιτσιρίκης</h4>   </a>

                    </div>


                </div>

            </div>

        </div>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2vyehv3aGQUJn0TlKh-OGACZAlNQSmTA&callback=initMap">
        </script>

    </body>
</html>

