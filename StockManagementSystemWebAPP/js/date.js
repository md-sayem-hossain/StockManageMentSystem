
        $(function () {
            $('.dates #usr1').datepicker({
                'format': 'yyyy-mm-dd',
                'autoclose': true
            });
            $('.dates #usr2').datepicker({
                'format': 'yyyy-mm-dd',
                'autoclose': true
            });
        });


        $(function() {
            window.onload = function() {
                var seconds = 2;
                setTimeout(function() {
                    document.getElementById("<%=messagelabel.ClientID %>").style.display = "none";
                }, seconds * 1000);
            };
        }



)
