/**
 * Created by Administrator on 2017/4/18.
 */
<script type="text/javascript">
    function checkAll(){
        var a=document.getElementById("checkAll");
        var b=document.getElementsByName("select");
        if(a.checked==true){
            for(var i=0;i<b.length;i++){
                b[i].checked=true;
            }
        }else{
            for(var i=0;i<b.length;i++){
                b[i].checked=false;
            }
        }
    }
    </script>