%include('navbar.tpl')  

<!-- Ticket leader table -->
<br>
<br>

<h4 class="text-center"> Tickets are how you win Super Bundle RMX. Do you have enough? </h4>
<br>

<div style="display: table; margin-left:auto; margin-right:auto;">
    <div style="display: table-row">
        <div class="container" style="width: 200px; display: table-cell;">
            <table id="prices" summary="ticket prices" class="table table-condensed" style="width: 40%;">
                <thead>
                    <tr>
                        <th>Donation</th>
                        <th>Tickets</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-md-2">$1</td>
                        <td class="col-md-2">1</td>
                    </tr>
                    <tr>
                        <td class="col-md-2">$5</td>
                        <td class="col-md-2">10</td>
                    </tr>
                    <tr>
                        <td class="col-md-2">$10</td>
                        <td class="col-md-2">30</td>
                    </tr>
                    <tr>
                        <td class="col-md-2">${{ random_ticket_cost }}</td>
                        <td class="col-md-2">{{ random_num_tickets }}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!--
        <div style="display: table-cell;vertical-align: middle; visibility: hidden;">
        -->
        <div style="display: table-cell;vertical-align: middle;">
            <h4 class="text-center" style="text-align:center; margin-left:auto; margin-right:auto;">Donations Received: ${{ money_raised }}</h4>
        </div>
    </div>
</div>

<div class="container">
        <table id="tickets" summary="Ticket Leader" class="table table-striped table-hover table-bordered">
            <thead>
                <tr>
                    <th colspan="6">Ticket Stats</th>
                </tr>
                <tr>
                    <th scope="col">Donor</th>
                    <th scope="col">Tickets</th>
                    <th scope="col">Chance of winning</th>
                    <th scope="col">Chance of losing</th>
                    <th scope="col">Chance of winning with 30 more tickets</th>
                    <th scope="col">Chance of winning with 5,000 more tickets</th>
                </tr>
            </thead>
            <tbody>
                %for each in tickets:
                    <tr>
                        %if each["sbtss_user"] is True:
                            <td><span class='glyphicon glyphicon-flag'></span> {{ each["_id"] }}</td>
                        %else:
                            <td>{{ each["_id"] }}</td>
                        %end
                        <td>{{ each["count"] }}</td>
                        <td>{{ each["percent_chance_win"] }} %</td>
                        <td>{{ each["percent_chance_lose"] }} %</td>
                        <td>{{ each["percent_chance_win_plus_30"] }} %</td>
                        <td>{{ each["percent_chance_win_plus_5000"] }} %</td>
                    </tr>
                %end
            </tbody>
        </table>
        <p> <span class='glyphicon glyphicon-flag'></span> = Confirmed <a href="faq#sbtss">Super Bundle Ticket Sharing Sytem (SBTSS)</a> user</p>
                   </div>

        <p class="text_line"> &nbsp </p>
        </div>
</div>








%include('footer.tpl')
