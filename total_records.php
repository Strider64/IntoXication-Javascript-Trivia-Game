<!DOCTYPE html>
<!--
Pepster's Place 
A Website Design & Development Company
President John R Pepp
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Retrieve Records</title>
    </head>
    <body>
        <script>
            var categories = 0;
            var records = {};



            function getRecords(url, callback) {
                var check = 'set=yes';
                console.log('check', check);
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    //console.log('readyState: ' + xhr.readyState, 'xhr.status: ' + xhr.status);
                    if (xhr.readyState === 2) {
                        //console.log(xhr.status);
                    }
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var info = JSON.parse(xhr.responseText);
                        callback.call(info);
                    }
                }; // End of Ready State:

                xhr.open('POST', url, true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
                xhr.send(check);
            }

            getRecords('totalRecords.php', function () {
                records = this;
                console.log(this);
                console.log('Number of movie questions', this.movie);
                console.log('Number of space questions', this.space);

            });
            
            
            



        </script>
    </body>
</html>
