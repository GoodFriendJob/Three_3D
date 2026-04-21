<%@ page language="VB" autoeventwireup="false" inherits="OrderRouting_Loading, App_Web_loading.aspx.62c128f4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loading...</title>

    <script type="text/javascript">
    function doBlink() {
	var blink = document.all.tags("BLINK")
	for (var i=0; i<blink.length; i++)
		blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "" ;
    }

    function startBlink() {
	    if (document.all)
		    setInterval("doBlink()",1000);
    }

    window.onload = startBlink;

    var secs;
    var timerID = null;
    var timerRunning = false;
    var delay = 1000;

    function InitializeTimer()
    {
        secs = 5;
        StartTheTimer();
    }

    function StopTheClock()
    {
        if(timerRunning)
            clearTimeout(timerID);
        timerRunning = false;
    }

    function StartTheTimer()
    {
        if (secs==0)
        {
             /*document.forms.waitForm.submit();*/
             StopTheClock();
        }
        else
        {
            self.status = secs;
            secs = secs - 1;
            timerRunning = true;
            timerID = self.setTimeout("StartTheTimer()", delay);
        }
    }
    //-->
    </script>

</head>
<body onload="InitializeTimer(); startBlink();">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Red" BackColor="Transparent" Font-Names="verdana"  >
								<BLINK>Please Wait While Load is Calculated</BLINK>
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
                            width="250" height="200" id="../Flash/lift_truck_intro_RevA_3-1-09" align="middle">
                            <param name="allowScriptAccess" value="sameDomain" />
                            <param name="movie" value="../Flash/lift_truck_intro_RevA_3-1-09.swf" />
                            <param name="quality" value="high" />
                            <param name="bgcolor" value="#ffffff" />
                            <embed src="../Flash/lift_truck_intro_RevA_3-1-09.swf" quality="high" bgcolor="#ffffff"
                                width="250" height="200" name="../Flash/lift_truck_intro_RevA_3-1-09" align="middle"
                                allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
