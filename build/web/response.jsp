<%-- 
    Document   : response
    Created on : 12 Νοε 2015, 6:19:53 μμ
    Author     : thomi
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/gasstation_db"
                   user="root"  password=""/>

<sql:query var="markers" dataSource="${snapshot}">
    SELECT * from gas_station as s 

    <c:choose>
        <c:when test="${param.select_brand_name != 'alls'}">
            WHERE s.brand_name= ? <sql:param value="${param.select_brand_name}"/>
        </c:when>
        <c:otherwise>
            WHERE s.brand_name IS NOT NULL
        </c:otherwise>            
    </c:choose>

    <c:if test="${param.laundry != null}">
        AND  s.laundry = 1
    </c:if>
    <c:if test="${param.oil != null}">
        AND  s.oil = 1
    </c:if>
    <c:if test="${param.gas != null}">
        AND  s.gas = 1
    </c:if>
    <c:if test="${param.market != null}">
        AND  s.market = 1
    </c:if>

</sql:query>

<sql:query var="count" dataSource="${snapshot}">
    SELECT COUNT(*) as count FROM gas_station as s 
    <c:choose>
        <c:when test="${param.select_brand_name != 'alls'}">
            WHERE s.brand_name= ? <sql:param value="${param.select_brand_name}"/>
        </c:when>
        <c:otherwise>
            WHERE s.brand_name IS NOT NULL
        </c:otherwise>            
    </c:choose>

    <c:if test="${param.laundry != null}">
        AND  s.laundry = 1
    </c:if>
    <c:if test="${param.oil != null}">
        AND  s.oil = 1
    </c:if>
    <c:if test="${param.gas != null}">
        AND  s.gas = 1
    </c:if>
    <c:if test="${param.market != null}">
        AND  s.market = 1
    </c:if>


</sql:query>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GasStationFinder - Results</title>
        <link rel='icon' href='images/marker.png' type='image/x-icon'/ >
        <link href="css/response.css" rel="stylesheet" type="text/css"/>      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>      
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
                        // this.infowindow.close(map, this);
                    });
                    google.maps.event.addListener(marker, 'click', function () {

                        map.setCenter(this.getPosition());
                    });




                }

            }
        </script>
        <div id="maindiv" >

            <div class="left_div col-md-6">
                <div id="header">
                    <center><h1>Gas Station Information</h1></center>
                </div>
                <div id="results2">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th colspan="3" style="font-size:2em;">Results</th>
                            </tr>
                            <tr>
                                <td><strong>Gas Station brand: </strong></td>
                                <td></td>
                                <td><strong>Location: </strong></td>
                                <td></td>
                                <td><strong>Contact Details: </strong></td>
                            </tr>
                        </thead> 
                        <tbody>
                            <c:forEach var="returnRes" items="${markers.rows}">
                                <c:set var="flag"  value="${1}"/>
                                <tr>
                                    <td>
                                        <a  href="#" class="hvr-float-shadow" style="color: rgb(255, 255, 255);">
                                            <img src=${returnRes.log} width="75px" height="75px">
                                        </a>
                                    </td>
                                    <td><strong>${returnRes.brand_name}<strong></td>
                                                <td><span>${returnRes.address} ${returnRes.address_no}</span><br>
                                                    <span>${returnRes.city} ${returnRes.area}, ${returnRes.postal_code} </span><br>
                                                    <span><strong>lat: </strong>${returnRes.latitube}  </span><br>
                                                    <span><strong>lng: </strong>${returnRes.longitude} </span>
                                                </td>


                                                <td><strong>tel: </strong>${returnRes.phone_no} 
                                                </td>      

                                                </tr>
                                            </c:forEach >
                                            </tbody>
                                            </table>
                                            </div>
                                            <center><a class="btn btn-info" value="submit" style="margin-top: 2em;" href="index.jsp">Return</a></center>
                                                <c:choose>
                                                    <c:when test="${flag!=1}">
                                                    <td><strong style="margin-left: 5%; margin-top: 2em;">Nothing found. Try again </strong></td>
                                                </c:when>                                            

                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${count.rows[0].count!=1}">
                                                            <td><h4 style="font-size: 1.2em!important; margin-left: 5%; margin-top: -2em;">${count.rows[0].count} results were found</h4></td>
                                                        </c:when> 
                                                        <c:otherwise>
                                                            <td><h4 style="font-size: 1.2em!important; margin-left: 5%; margin-top: -2em;">${count.rows[0].count} result was found</h4></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                            <div class="right_div col-md-6">
                                                <div id="map" ></div>

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

